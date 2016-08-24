//
//  ComicObject.swift
//  SpotlightSearch
//
//  Created by  on 8/24/16.
//  Copyright © 2016 Pham Tien. All rights reserved.
//

import UIKit

class ComicObject: NSObject {
    
    internal var myDictionary: [String : String]
    
    override init() {
        self.myDictionary = [:]
        super.init()
    }
    
    class func createListObjectFromListDict(listDict:Array<[String:String]>) -> Array<ComicObject> {
        var results:Array<ComicObject> = [ComicObject]()
        for item in listDict {
            let comic = ComicObject()
            comic.myDictionary = item
            results.append(comic)
        }
        return results
    }
    
    func getTitle()->String{
        if let title = myDictionary["Title"] {
            return title
        }
        return ""
    }
    
    func getCategory() -> String {
        if let category = myDictionary["Category"] {
            return category
        }
        return  ""
    }
    
    func getRating() -> String {
        if let rate = myDictionary["Rating"] {
            return rate
        }
        return ""
    }
 
    func getDescription() -> String {
        if let des = myDictionary["Description"] {
            return des
        }
        return ""
    }
    
    func getDirector() -> String {
        if let director = myDictionary["Director"] {
            return director
        }
        return ""
    }
    
    func getStar() -> String {
        if let star = myDictionary["Star"] {
            return star
        }
        return ""
    }
    
    func getImage() -> String {
        if let star = myDictionary["Image"] {
            return star
        }
        return ""
    }
    
}
