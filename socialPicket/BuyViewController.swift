//
//  BuyViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 21/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKCoreKit
import FBSDKLoginKit

class BuyViewController: UIViewController {

    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Facebook Account"
        label.font = UIFont.systemFontOfSize(25, weight: UIFontWeightBold)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    var amos = String()
    
    var lastUpdatedLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Facebook Account"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    var visitorsBackgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var visitorsTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last Profile Visitors"
        label.font = UIFont.systemFontOfSize(16, weight: UIFontWeightBold)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        label.textAlignment = NSTextAlignment.Center
        
        return label
    }()
    
    lazy var viewListButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show All List  →", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 115, g: 230, b: 135)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(showAllList), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var likeMostView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var likeMostTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "People Who Like Me Most"
        label.font = UIFont.systemFontOfSize(16, weight: UIFontWeightBold)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        label.textAlignment = NSTextAlignment.Center
        
        return label
    }()
    
    lazy var likeMostViewListButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show All List  →", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 115, g: 230, b: 135)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(showAllList), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOpacity = 0.0
        view.layer.shadowOffset = CGSizeZero
        view.layer.shadowRadius = 10
        
        return view
    }()
    
    var loadingIndicator: UIActivityIndicatorView  = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        indicator.color = UIColor(r: 50, g: 50, b: 50)
        return indicator
    }()
    
    var loadingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(14, weight: UIFontWeightSemibold)
        label.text = "Getting profile data..."
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    lazy var logoutbutton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("←  Log Out", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 234, g: 70, b: 70)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(showLogoutAlert), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var scrollView = UIScrollView()
    
    var userPhoto1 = UIImageView()
    var userPhoto2 = UIImageView()
    var userPhoto3 = UIImageView()
    var userPhoto4 = UIImageView()
    var userPhoto5 = UIImageView()
    
    var userPhoto6 = UIImageView()
    var userPhoto7 = UIImageView()
    var userPhoto8 = UIImageView()
    var userPhoto9 = UIImageView()
    var userPhoto10 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width:view.bounds.width, height: 2000)
        
        scrollView.hidden = true
        scrollView.alpha = 0
        
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        self.navigationController?.navigationBarHidden = true
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        visitorsBackgroundView.alpha = 0
        likeMostView.alpha = 0
        titleLabel.alpha = 0
        lastUpdatedLabel.alpha = 0
        logoutbutton.alpha = 0
        
        let todaysDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy, HH:mm"
        let dateInFormat:String = dateFormatter.stringFromDate(todaysDate)
        lastUpdatedLabel.text = "Last update: \(dateInFormat)"
        
        userPhoto1.translatesAutoresizingMaskIntoConstraints = false
        userPhoto2.translatesAutoresizingMaskIntoConstraints = false
        userPhoto3.translatesAutoresizingMaskIntoConstraints = false
        userPhoto4.translatesAutoresizingMaskIntoConstraints = false
        userPhoto5.translatesAutoresizingMaskIntoConstraints = false
        
        userPhoto6.translatesAutoresizingMaskIntoConstraints = false
        userPhoto7.translatesAutoresizingMaskIntoConstraints = false
        userPhoto8.translatesAutoresizingMaskIntoConstraints = false
        userPhoto9.translatesAutoresizingMaskIntoConstraints = false
        userPhoto10.translatesAutoresizingMaskIntoConstraints = false
        
        userPhoto1.layer.cornerRadius = 5
        userPhoto2.layer.cornerRadius = 5
        userPhoto3.layer.cornerRadius = 5
        userPhoto4.layer.cornerRadius = 5
        userPhoto5.layer.cornerRadius = 5
        
        userPhoto6.layer.cornerRadius = 5
        userPhoto7.layer.cornerRadius = 5
        userPhoto8.layer.cornerRadius = 5
        userPhoto9.layer.cornerRadius = 5
        userPhoto10.layer.cornerRadius = 5
        
        view.addSubview(loadingView)
        loadingView.addSubview(loadingLabel)
        loadingView.addSubview(loadingIndicator)
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(visitorsBackgroundView)
        scrollView.addSubview(likeMostView)
        scrollView.addSubview(lastUpdatedLabel)
        view.addSubview(logoutbutton)
        visitorsBackgroundView.addSubview(visitorsTitleLabel)
        visitorsBackgroundView.addSubview(userPhoto1)
        visitorsBackgroundView.addSubview(userPhoto2)
        visitorsBackgroundView.addSubview(userPhoto3)
        visitorsBackgroundView.addSubview(userPhoto4)
        visitorsBackgroundView.addSubview(userPhoto5)
        visitorsBackgroundView.addSubview(viewListButton)
        likeMostView.addSubview(likeMostTitleLabel)
        likeMostView.addSubview(userPhoto6)
        likeMostView.addSubview(userPhoto7)
        likeMostView.addSubview(userPhoto8)
        likeMostView.addSubview(userPhoto9)
        likeMostView.addSubview(userPhoto10)
        likeMostView.addSubview(likeMostViewListButton)
        setupConstraints()
        
        self.getUsers()
    }
    
    func getUsers() {
        Alamofire.request(.GET, "https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-117245197647/socialPicket/data.json")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    let response = JSON as! NSDictionary
                    
                    let userPhoto1: String! = String(response.objectForKey("blur1")!)
                    let userPhoto2: String! = String(response.objectForKey("blur2")!)
                    let userPhoto3: String! = String(response.objectForKey("blur3")!)
                    let userPhoto4: String! = String(response.objectForKey("blur4")!)
                    let userPhoto5: String! = String(response.objectForKey("blur5")!)
                    
                    let userPhoto6: String! = String(response.objectForKey("blur6")!)
                    let userPhoto7: String! = String(response.objectForKey("blur7")!)
                    let userPhoto8: String! = String(response.objectForKey("blur8")!)
                    let userPhoto9: String! = String(response.objectForKey("blur9")!)
                    let userPhoto10: String! = String(response.objectForKey("blur10")!)
                    
                    if let url  = NSURL(string: userPhoto1),
                        _ = NSData(contentsOfURL: url)
                    {
                        self.setUserPhoto(userPhoto1, image: self.userPhoto1)
                        self.setUserPhoto(userPhoto2, image: self.userPhoto2)
                        self.setUserPhoto(userPhoto3, image: self.userPhoto3)
                        self.setUserPhoto(userPhoto4, image: self.userPhoto4)
                        self.setUserPhoto(userPhoto5, image: self.userPhoto5)
                        
                        self.setUserPhoto(userPhoto6, image: self.userPhoto6)
                        self.setUserPhoto(userPhoto7, image: self.userPhoto7)
                        self.setUserPhoto(userPhoto8, image: self.userPhoto8)
                        self.setUserPhoto(userPhoto9, image: self.userPhoto9)
                        self.setUserPhoto(userPhoto10, image: self.userPhoto10)
                        
                        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                            self.scrollView.hidden = false
                            self.scrollView.alpha = 1
                            self.titleLabel.alpha = 1
                            self.lastUpdatedLabel.alpha = 1
                            self.visitorsBackgroundView.alpha = 1
                            self.likeMostView.alpha = 1
                            self.logoutbutton.alpha = 1
                            self.loadingView.hidden = true
                            self.loadingIndicator.stopAnimating()
                            }, completion:nil)
                        
                    }
                    
                }
        }
    }
    
    func setUserPhoto(url: String, image: UIImageView) {
        if let url  = NSURL(string: url), data = NSData(contentsOfURL: url) {
            image.image = UIImage(data: data)
        }
    }
    
    func showAllList() {
        let premium = NSUserDefaults.standardUserDefaults().boolForKey("premiumMember")
        let inApp = InAppViewController()
        let list = LastVisitorsViewController()
        
//        if premium {
            self.navigationController?.pushViewController(list, animated: true)
//        } else {
//            self.navigationController?.pushViewController(inApp, animated: true)
//        }
    }
    
    func showLogoutAlert(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in}
        alertController.addAction(cancelAction)
        let destroyAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            self.logout()
        }
        
        alertController.addAction(destroyAction)
        self.presentViewController(alertController, animated: true) {}
    }
    
    func logout() {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logOut()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func setupConstraints() {
        let scrollViewHeight = self.view.bounds.height - 20
        
        scrollView.heightAnchor.constraintEqualToConstant(scrollViewHeight).active = true
        scrollView.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        scrollView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 20).active = true
        
        loadingView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        loadingView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        loadingView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -200).active = true
        loadingView.heightAnchor.constraintEqualToConstant(100).active = true
        
        loadingIndicator.centerXAnchor.constraintEqualToAnchor(loadingLabel.centerXAnchor).active = true
        loadingIndicator.centerYAnchor.constraintEqualToAnchor(loadingView.centerYAnchor, constant: -10).active = true
        
        loadingLabel.centerXAnchor.constraintEqualToAnchor(loadingView.centerXAnchor).active = true
        loadingLabel.centerYAnchor.constraintEqualToAnchor(loadingView.centerYAnchor, constant: 25).active = true
        loadingLabel.heightAnchor.constraintEqualToConstant(25).active = true
        
        titleLabel.topAnchor.constraintEqualToAnchor(scrollView.topAnchor, constant: 10).active = true
        titleLabel.leftAnchor.constraintEqualToAnchor(scrollView.leftAnchor, constant: 20).active = true
        
        lastUpdatedLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor, constant: 5).active = true
        lastUpdatedLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 20).active = true
        
        visitorsBackgroundView.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor).active = true
        visitorsBackgroundView.topAnchor.constraintEqualToAnchor(lastUpdatedLabel.bottomAnchor, constant: 20).active = true
        visitorsBackgroundView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        visitorsBackgroundView.heightAnchor.constraintEqualToConstant(150).active = true
        
        visitorsTitleLabel.topAnchor.constraintEqualToAnchor(visitorsBackgroundView.topAnchor, constant: 10).active = true
        visitorsTitleLabel.leftAnchor.constraintEqualToAnchor(visitorsBackgroundView.leftAnchor, constant: 20).active = true
        
        userPhoto1.leftAnchor.constraintEqualToAnchor(visitorsBackgroundView.leftAnchor, constant: 20).active = true
        userPhoto1.topAnchor.constraintEqualToAnchor(visitorsTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto1.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto1.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto2.leftAnchor.constraintEqualToAnchor(userPhoto1.rightAnchor, constant: 5).active = true
        userPhoto2.topAnchor.constraintEqualToAnchor(visitorsTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto2.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto2.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto3.leftAnchor.constraintEqualToAnchor(userPhoto2.rightAnchor, constant: 5).active = true
        userPhoto3.topAnchor.constraintEqualToAnchor(visitorsTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto3.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto3.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto4.leftAnchor.constraintEqualToAnchor(userPhoto3.rightAnchor, constant: 5).active = true
        userPhoto4.topAnchor.constraintEqualToAnchor(visitorsTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto4.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto4.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto5.leftAnchor.constraintEqualToAnchor(userPhoto4.rightAnchor, constant: 5).active = true
        userPhoto5.topAnchor.constraintEqualToAnchor(visitorsTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto5.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto5.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto6.leftAnchor.constraintEqualToAnchor(likeMostView.leftAnchor, constant: 20).active = true
        userPhoto6.topAnchor.constraintEqualToAnchor(likeMostTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto6.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto6.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto7.leftAnchor.constraintEqualToAnchor(userPhoto6.rightAnchor, constant: 5).active = true
        userPhoto7.topAnchor.constraintEqualToAnchor(likeMostTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto7.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto7.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto8.leftAnchor.constraintEqualToAnchor(userPhoto7.rightAnchor, constant: 5).active = true
        userPhoto8.topAnchor.constraintEqualToAnchor(likeMostTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto8.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto8.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto9.leftAnchor.constraintEqualToAnchor(userPhoto8.rightAnchor, constant: 5).active = true
        userPhoto9.topAnchor.constraintEqualToAnchor(likeMostTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto9.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto9.heightAnchor.constraintEqualToConstant(50).active = true
        
        userPhoto10.leftAnchor.constraintEqualToAnchor(userPhoto9.rightAnchor, constant: 5).active = true
        userPhoto10.topAnchor.constraintEqualToAnchor(likeMostTitleLabel.bottomAnchor, constant: 10).active = true
        userPhoto10.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto10.heightAnchor.constraintEqualToConstant(50).active = true
        
        viewListButton.leftAnchor.constraintEqualToAnchor(visitorsBackgroundView.leftAnchor, constant: 20).active = true
        viewListButton.topAnchor.constraintEqualToAnchor(userPhoto1.bottomAnchor, constant: 10).active = true
        viewListButton.widthAnchor.constraintEqualToConstant(270).active = true
        viewListButton.heightAnchor.constraintEqualToConstant(35).active = true
        
        likeMostViewListButton.leftAnchor.constraintEqualToAnchor(likeMostView.leftAnchor, constant: 20).active = true
        likeMostViewListButton.topAnchor.constraintEqualToAnchor(userPhoto6.bottomAnchor, constant: 10).active = true
        likeMostViewListButton.widthAnchor.constraintEqualToConstant(270).active = true
        likeMostViewListButton.heightAnchor.constraintEqualToConstant(35).active = true
        
        logoutbutton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -10).active = true
        logoutbutton.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        logoutbutton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        logoutbutton.heightAnchor.constraintEqualToConstant(35).active = true
        
        likeMostTitleLabel.topAnchor.constraintEqualToAnchor(likeMostView.topAnchor, constant: 10).active = true
        likeMostTitleLabel.leftAnchor.constraintEqualToAnchor(likeMostView.leftAnchor, constant: 20).active = true
        
        likeMostView.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor).active = true
        likeMostView.topAnchor.constraintEqualToAnchor(visitorsBackgroundView.bottomAnchor, constant: 20).active = true
        likeMostView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        likeMostView.heightAnchor.constraintEqualToConstant(150).active = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }
    
}
