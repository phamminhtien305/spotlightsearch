//
//  BaseTableController.swift
//  BaseProject
//
//  Created by Minh Tien on 6/2/16.
//  Copyright © 2016 MTLAB. All rights reserved.
//

import UIKit

class BaseTableController: NSObject {
    var _targetTableView: UITableView!
    var items = NSMutableArray()
    var sections = [AnyObject]()
    
    func initWithTargetTableView(targetTableView:UITableView) -> NSObject {
        _targetTableView = targetTableView
        _targetTableView.delegate = self
        _targetTableView.dataSource = self
        self.registerNibWithTargetTableView(targetTableView)
        return self
    }
    
    func registerNibWithTargetTableView(targetTableView: UITableView) {
        assert(false, "This is abstract method, should be overidden")
    }
    
    func getCellIdentify(item: AnyObject?, returnClassName: Bool) -> String {
        assert(false, "This is abstact method, should be overidden")
    }
    
    func getHeaderIdentifiWithItem(item: AnyObject, returnClassName: Bool) -> String {
        assert(false, "This is abstract method, should be overidden")
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        if indexPath.section > items.count {
            return nil
        } else {
            let listItemAtSection = items[indexPath.section]
            if listItemAtSection.count > indexPath.row {
                return listItemAtSection[indexPath.row]
            }
            
        }
        return nil
    }
    
    private func getCellClass(indexPath: NSIndexPath) -> BaseTableViewCell.Type {
        let item = self.itemAtIndexPath(indexPath)
        let className = self.getCellIdentify(item, returnClassName: true)
        return NSClassFromString(className) as! BaseTableViewCell.Type
    }
    
    func listItemOfSection(section: Int) -> AnyObject? {
        return section < items.count ? items.count : nil
    }
    
    func updateWithListItem(listItems:NSMutableArray) {
        items = listItems
        _targetTableView .reloadData()
    }
    
    func updateWithListItem(listItem: NSMutableArray, listSections: Array<AnyObject>) {
        items = listItem
        sections = listSections
        _targetTableView.reloadData()
    }
}


extension BaseTableController:UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let item = self.itemAtIndexPath(indexPath)
        let cellClass = self.getCellClass(indexPath)
        return cellClass.height()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections.count > section {
            let item = sections[section]
            let headerClassName = self.getHeaderIdentifiWithItem(item, returnClassName: true)
            let  header = NSClassFromString(headerClassName) as! BaseHeaderTableView.Type;
            return header.heightWithItem(item)
        }else{
            return 0.0
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView: BaseHeaderTableView! = nil
        if sections.count > section {
            let item = sections[section]
            let headerIdentifier = self.getHeaderIdentifiWithItem(item, returnClassName: false)
            let headerTable = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headerIdentifier)
            headerView = headerTable as? BaseHeaderTableView
            headerView.configHeaderWithData(item)
            return headerView
        }
                return nil
    }
    
}

extension BaseTableController:UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.itemAtIndexPath(indexPath)
        let cellIdentify = self.getCellIdentify(item, returnClassName: false)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify, forIndexPath: indexPath)
        let baseCell = cell as! BaseTableViewCell
        baseCell.configCellWithData(item)
        baseCell.indexPath = indexPath
        return cell
    }
}