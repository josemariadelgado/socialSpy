//
//  WelcomeViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 6/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation
import SystemConfiguration
import StoreKit
import Firebase
import FirebaseDatabase
import Alamofire

class WelcomeViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var databaseRef = FIRDatabase.database().reference()
    
    var welcomeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.systemFontOfSize(40, weight: UIFontWeightHeavy)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    var welcomeLabel2: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log In with Facebook in order to track and follow your detailed friendship interactions."
        label.numberOfLines = 3
        label.font = UIFont.systemFontOfSize(15, weight: UIFontWeightSemibold)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    lazy var instagramLoginButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In with Instagram", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 174, g: 41, b: 122)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(facebookLoginButtonClicked), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    lazy var facebookLoginButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In with Facebook", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 25, g: 100, b: 175)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(facebookLoginButtonClicked), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var bottomBackgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var downloadsLabel: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        button.setTitle(" ", forState: .Normal)
        
        button.addTarget(self, action: #selector(openDownloadsView), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var loadingIndicator: UIActivityIndicatorView  = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.stopAnimating()
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        indicator.color = UIColor(r: 50, g: 50, b: 50)
        
        return indicator
    }()
    
    var downloads: String! = "false"
    let currentDeviceUUID = UIDevice.currentDevice().identifierForVendor!.UUIDString
    var chemaIphoneUUID = "47361970-87F3-40CE-B78C-9CD9589EFB19"
    
    var iconTest = UILabel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadsLabel.enabled = false
        
        iconTest.font = UIFont(name: "icomoon", size: 300)
        iconTest.textColor = UIColor(r: 20, g: 123, b: 200)
        iconTest.textAlignment = NSTextAlignment.Center
        iconTest.translatesAutoresizingMaskIntoConstraints = false
        
        iconTest.text = "\u{e902}"
        
        //        view.addSubview(iconTest)
        
        //        iconTest.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 40).active = true
        //        iconTest.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -300).active = true
        
        if currentDeviceUUID == chemaIphoneUUID {
            Alamofire.request(.GET, "https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-117245197647/socialPicket/data.json")
                .responseJSON { response in
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        let response = JSON as! NSDictionary
                        
                        let downloads: String! = String(response.objectForKey("downloads")!)
                        if downloads == "true"{
                            self.downloadsLabel.enabled = true
                            self.updateDownloads()
                            var _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(self.updateDownloads), userInfo: nil, repeats: true)
                        }
                    }
            }
            
        }
        
        if !isConnectedToNetwork() {
            let alertController = UIAlertController(title: "Ooops!", message: "You are not connected to the Internet. Please, connect to a network in order to use this app.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("launchedBefore")
        if !launchedBefore  {
            print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "launchedBefore")
            
            self.databaseRef.child("App").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                var firstOpenings = snapshot.value!["firstOpenings"] as! Int
                firstOpenings += 1
                self.databaseRef.child("App").setValue(["firstOpenings": firstOpenings])
            }) { (error) in
                print(error.localizedDescription)
            }
        }
        
        navigationController?.navigationBarHidden = true
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBarHidden = true
        loadingIndicator.hidden = true
        
        setupViews()
    }
    
    func openDownloadsView() {
        let downloads = DownloadsViewController()
        self.presentViewController(downloads, animated: true, completion: nil)
        
    }
    
    func facebookLoginButtonClicked() {
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.loadingIndicator.hidden = false
            self.loadingIndicator.startAnimating()
            self.facebookLoginButton.alpha = 0.5
            self.facebookLoginButton.enabled = false
            }, completion:nil)
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
            if (error == nil && !result.isCancelled){
                //                let viewController = ViewController()
                let buyViewController = BuyViewController()
                self.navigationController?.pushViewController(buyViewController, animated: true)
            } else if (result.isCancelled) {
                UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                    self.loadingIndicator.hidden = true
                    self.loadingIndicator.stopAnimating()
                    self.facebookLoginButton.alpha = 1
                    self.facebookLoginButton.enabled = true
                    }, completion:nil)
            }
        })
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("Login complete.")
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }
    
    func updateDownloads() {
        self.databaseRef.child("App").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            let firstOpenings = snapshot.value!["firstOpenings"] as! Int
            self.downloadsLabel.setTitle("\(firstOpenings)", forState: .Normal)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func setupViews() {
        
        view.addSubview(welcomeLabel)
//        view.addSubview(instagramLoginButton)
        view.addSubview(facebookLoginButton)
        view.addSubview(welcomeLabel2)
        view.addSubview(loadingIndicator)
        view.addSubview(downloadsLabel)
        
        downloadsLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 20).active = true
        downloadsLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 20).active = true
        downloadsLabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -40).active = true
        
        welcomeLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 20).active = true
        welcomeLabel.bottomAnchor.constraintEqualToAnchor(welcomeLabel2.topAnchor, constant: -10).active = true
        welcomeLabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        
        welcomeLabel2.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        welcomeLabel2.bottomAnchor.constraintEqualToAnchor(facebookLoginButton.topAnchor, constant: -20).active = true
        welcomeLabel2.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -40).active = true
        
//        instagramLoginButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
//        instagramLoginButton.bottomAnchor.constraintEqualToAnchor(facebookLoginButton.topAnchor, constant: -5).active = true
//        instagramLoginButton.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -40).active = true
//        instagramLoginButton.heightAnchor.constraintEqualToConstant(45).active = true
        
        facebookLoginButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        facebookLoginButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -20).active = true
        facebookLoginButton.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -40).active = true
        facebookLoginButton.heightAnchor.constraintEqualToConstant(45).active = true
        
        loadingIndicator.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        loadingIndicator.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: -50).active = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.loadingIndicator.hidden = true
        self.loadingIndicator.stopAnimating()
        self.facebookLoginButton.alpha = 1
        self.facebookLoginButton.enabled = true
    }
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
