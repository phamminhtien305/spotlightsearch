//
//  HomeController.swift
//  SpotlightSearch
//
//  Created by Pham Tien on 8/16/16.
//  Copyright © 2016 Pham Tien. All rights reserved.
//

import UIKit

class HomeController: BaseTableController {
    override func registerNibWithTargetTableView(targetTableView: UITableView) {
        targetTableView.registerNib(ComicCell.nib(), forCellReuseIdentifier: ComicCell.nibName())
    }
    
    override func getCellIdentify(item: AnyObject?, returnClassName: Bool) -> String {
        if returnClassName {
            return NSStringFromClass(ComicCell)
        }else {
            return ComicCell.nibName()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let comic = self.itemAtIndexPath(indexPath) as! ComicObject
       let detailView = DetailComicViewController.initWithComicObject(comic)
        self.owner.navigationController?.pushViewController(detailView, animated: true)
    }
}
