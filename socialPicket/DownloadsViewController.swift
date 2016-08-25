//
//  DownloadsViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 19/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    lazy var button: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFontOfSize(50, weight: UIFontWeightBold)
        button.setTitleColor(UIColor(r: 50, g: 50, b: 50), forState: .Normal)
        
        button.addTarget(self, action: #selector(back), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        
        view.addSubview(button)
        button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        button.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        button.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        
        updateDownloads()
        var _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(WelcomeViewController.updateDownloads), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateDownloads() {
        let welcome = WelcomeViewController()
        
        welcome.databaseRef.child("App").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            let firstOpenings = snapshot.value!["firstOpenings"] as! Int
            
            self.button.setTitle("\(firstOpenings)", forState: .Normal)
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
