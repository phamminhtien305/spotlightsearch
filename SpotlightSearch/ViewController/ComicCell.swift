//
//  ComicCell.swift
//  SpotlightSearch
//
//  Created by Pham Tien on 8/16/16.
//  Copyright © 2016 Pham Tien. All rights reserved.
//

import UIKit

class ComicCell: BaseTableViewCell {

    @IBOutlet weak var imgMovieImage: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblCategory: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblDirector: UILabel!
    
    @IBOutlet weak var lblStars: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    override class func height() -> CGFloat{
        return 100.0
    }
    
    override func configCellWithData(data: AnyObject?) {
        
    }
    
}
