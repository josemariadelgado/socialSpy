//
//  LastVisitorsViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 25/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit

class LastVisitorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView  =   UITableView()
    let animals : [String] = ["Dogs","Cats","Mice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = animals [indexPath.row]
        
        let image: UIImage = UIImage(named: "icon170x170.png")!
        cell.imageView!.image = image
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(animals[indexPath.row])
    }
}
