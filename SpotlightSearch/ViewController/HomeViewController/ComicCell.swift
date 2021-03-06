//
//  ComicCell.swift
//  SpotlightSearch
//
//  Created by Pham Tien on 8/16/16.
//  Copyright © 2016 Pham Tien. All rights reserved.
//

import UIKit

class ComicCell: BaseTableViewCell {

    @IBOutlet weak var imgComic: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    override class func height() -> CGFloat{
        return 100.0
    }
    
    override func configCellWithData(data: AnyObject?) {
        let item = data as! ComicObject
        self.lblTitle.text = item.getTitle()
        self.lblDescription.text = item.getDescription()
        self.lblRating.text = item.getRating()
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: item.getImage())!, completionHandler: { (data, response, error) in
            if let imageData = data {
                let image = UIImage(data: imageData)
                dispatch_async(dispatch_get_main_queue(), {
                    self.imgComic.image = image;
                })
                
            }
        }).resume()
    }
}
