//
//  DetailComicViewController.swift
//  SpotlightSearch
//
//  Created by  on 8/24/16.
//  Copyright © 2016 Pham Tien. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class DetailComicViewController: BaseViewController {
    
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbScore: UILabel!
    @IBOutlet var thumb: UIImageView!
    var comic:ComicObject!
    var comicID:String!
    
    class func initWithComicObject(comic:ComicObject) -> DetailComicViewController {
        let _self = DetailComicViewController.newViewController() as! DetailComicViewController
        _self.comic = comic
        return _self
    }
    
    class func initWithComicID(comicID: String)-> DetailComicViewController{
        let _self = DetailComicViewController.newViewController() as! DetailComicViewController
        _self.comicID = comicID
        return _self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.comic != nil {
            setupView()
        }else{
            loadComicsInfo()
        }
        self .setupSearchableContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadComicsInfo() {
        if let path = NSBundle.mainBundle().pathForResource("ComicsData", ofType: "plist") {
            let listItem = NSArray(contentsOfFile: path) as! Array<[String: String]>
            let listComicItem = ComicObject.createListObjectFromListDict(listItem)
            for comic:ComicObject in listComicItem {
                if comic.getTitle() == self.comicID {
                    self.comic = comic
                    setupView()
                }
            }
        }
    }

    func setupView(){
        lbTitle.text = self.comic.getTitle()
        lbScore.text = self.comic.getRating()
        
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: self.comic.getImage())!) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.thumb.image = UIImage(data: data)
                })
            }
        }.resume()
    }
    
    
    func setupSearchableContent() {
        let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        // Set the title.
        searchableItemAttributeSet.title = self.comic.getTitle()
        // Set the movie image
        let data = NSData(contentsOfURL:NSURL(string: self.comic.getImage())!)
        searchableItemAttributeSet.thumbnailData = data
//        NSBundle.mainBundle().URLForResource("thumbcomic", withExtension: "jpg")
        // Set the description.
        searchableItemAttributeSet.contentDescription = self.comic.getDescription()
        
        var keywords = [String]()
        keywords.append(self.comic.getTitle())
        keywords.append(self.comic.getDescription())
        
        searchableItemAttributeSet.keywords = keywords
        let searchableItem = CSSearchableItem(uniqueIdentifier:self.comic.getTitle(), domainIdentifier: "com.comics", attributeSet: searchableItemAttributeSet)
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([searchableItem]) { (error: NSError?) -> Void in
            if let error = error {
                // Indexing error
                print(error.description)
            } else {
                // Search item successfully indexed!
            }
        }
        
    }
    

}
