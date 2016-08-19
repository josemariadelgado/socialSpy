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

class WelcomeViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var databaseRef = FIRDatabase.database().reference()
    
    var welcomeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.font = UIFont.systemFontOfSize(40)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        label.textAlignment = NSTextAlignment.Center
        
        return label
    }()
    
    var welcomeLabel2: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your privacy is protected. \n \n Log in with your Facebook account to see the friends who interacts more with your profile."
        label.numberOfLines = 6
        label.font = UIFont.systemFontOfSize(15)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        label.textAlignment = NSTextAlignment.Center
        
        return label
    }()
    
    var icon: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var signInButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in with Facebook", forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 59, g: 89, b: 152)
        button.layer.cornerRadius = 3
        
        button.addTarget(self, action: #selector(handleFacebookLoginClicked), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var bottomBackgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var downloadsLabel: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !ViewController.isConnectedToNetwork() {
            let alertController = UIAlertController(title: "Ooops!", message: "You are not connected to the Internet. Please, connect to a network in order to use this app.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        }
        else {
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
        
        updateDownloads()
        var _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(WelcomeViewController.updateDownloads), userInfo: nil, repeats: true)
        
        navigationController?.navigationBarHidden = true
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationController?.navigationBarHidden = true
        
        let image = UIImage(named: "spy.png")
        self.icon = UIImageView(image: image!)
        self.icon.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(bottomBackgroundView)
        bottomBackgroundView.addSubview(signInButton)
        view.addSubview(welcomeLabel2)
        view.addSubview(icon)
        view.addSubview(downloadsLabel)
        setupViews()
        
    }
    
    func handleFacebookLoginClicked() {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
            if (error == nil && !result.isCancelled){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                let viewController = ViewController()
                let navController = UINavigationController(rootViewController: viewController) // Creating a navigation controller with VC1 at the root of the navigation stack.
                self.presentViewController(navController, animated:true, completion: nil)
                print(fbloginresult)
            }
        })
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("Login complete.")
            //            self.performSegueWithIdentifier("showNew", sender: self)
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
            
            self.downloadsLabel.setTitle("App downloads: \(firstOpenings)", forState: .Normal)
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func setupViews() {
        welcomeLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        welcomeLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 50).active = true
        welcomeLabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        welcomeLabel.heightAnchor.constraintEqualToConstant(50).active = true
        
        welcomeLabel2.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        welcomeLabel2.topAnchor.constraintEqualToAnchor(welcomeLabel.bottomAnchor, constant: 10).active = true
        welcomeLabel2.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -100).active = true
        welcomeLabel2.heightAnchor.constraintEqualToConstant(100).active = true
        
        icon.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        icon.bottomAnchor.constraintEqualToAnchor(bottomBackgroundView.topAnchor).active = true
        icon.widthAnchor.constraintEqualToConstant(100).active = true
        icon.heightAnchor.constraintEqualToConstant(100).active = true
        
        bottomBackgroundView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        bottomBackgroundView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
        bottomBackgroundView.rightAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
        bottomBackgroundView.heightAnchor.constraintEqualToConstant(100).active = true
        bottomBackgroundView.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        
        signInButton.centerXAnchor.constraintEqualToAnchor(bottomBackgroundView.centerXAnchor).active = true
        signInButton.bottomAnchor.constraintEqualToAnchor(bottomBackgroundView.bottomAnchor, constant: -25).active = true
        signInButton.widthAnchor.constraintEqualToAnchor(bottomBackgroundView.widthAnchor, constant: -100).active = true
        signInButton.heightAnchor.constraintEqualToConstant(44).active = true
        
        downloadsLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        downloadsLabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        downloadsLabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        downloadsLabel.heightAnchor.constraintEqualToConstant(100).active = true
        
        
    }
    
    class func isConnectedToNetwork() -> Bool {
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
