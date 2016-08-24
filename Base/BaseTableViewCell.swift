//
//  BaseTableViewCell.swift
//  BaseProject
//
//  Created by Minh Tien on 6/2/16.
//  Copyright © 2016 MTLAB. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var indexPath : NSIndexPath!
    
    class func nib() -> UINib{
        return UINib(nibName:String(self), bundle: NSBundle .mainBundle())
    }
    class func nibName() -> String{
        return String(self)
    }
    
    class func height() -> CGFloat{
        return 50.0
    }
    
    func configCellWithData(data: AnyObject?){}
}
