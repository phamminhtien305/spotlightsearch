//
//  ViewController.swift
//  SpotlightSearch
//
//  Created by Pham Tien on 8/22/16.
//  Copyright © 2016 Pham Tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var moviesInfo = NSMutableArray()
    let controller = HomeController()

    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controller.initWithTargetTableView(tableView)
        loadMoviesInfo()
        navigationItem.title = "Comics"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadMoviesInfo() {
        if let path = NSBundle.mainBundle().pathForResource("ComicsData", ofType: "plist") {
            let listItem = NSMutableArray(contentsOfFile: path)
            moviesInfo.addObject(listItem!)
            controller.updateWithListItem(moviesInfo)
        }
    }
    

}

