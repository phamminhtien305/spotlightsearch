//
//  BaseHeaderTableView.swift
//  BaseProject
//
//  Created by Minh Tien on 6/2/16.
//  Copyright © 2016 MTLAB. All rights reserved.
//

import UIKit

class BaseHeaderTableView: UITableViewHeaderFooterView {
    
    class func height() -> CGFloat {
        return 50.0
    }
    
    class func heightWithItem(data: AnyObject) -> CGFloat {
        return 50.0
    }
    
    class func nib() -> UINib{
        return UINib(nibName:String(self), bundle: NSBundle .mainBundle())
    }
    class func nibName() -> String{
        return String(self)
    }
    
    func configHeaderWithData(data: AnyObject?) {
        
    }
    
}
