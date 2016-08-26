//
//  ViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 27/7/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation
import SystemConfiguration
import StoreKit
import Alamofire
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    var scrollView = UIScrollView()
    
    var inApp1Text = ""
    var inApp2Text = ""
    var inApp3Text = ""
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    var view4 = UIView()
    var view5 = UIView()
    var view6 = UIView()
    var view7 = UIView()
    var view8 = UIView()
    var view9 = UIView()
    var view10 = UIView()
    var view11 = UIView()
    var view12 = UIView()
    var view13 = UIView()
    var view14 = UIView()
    var view15 = UIView()
    var view16 = UIView()
    var view17 = UIView()
    var view18 = UIView()
    var view19 = UIView()
    var view20 = UIView()
    
    var separator1 = UIView()
    var separator2 = UIView()
    var separator3 = UIView()
    var separator4 = UIView()
    var separator5 = UIView()
    var separator6 = UIView()
    var separator7 = UIView()
    var separator8 = UIView()
    var separator9 = UIView()
    var separator10 = UIView()
    var separator11 = UIView()
    var separator12 = UIView()
    var separator13 = UIView()
    var separator14 = UIView()
    var separator15 = UIView()
    var separator16 = UIView()
    var separator17 = UIView()
    var separator18 = UIView()
    var separator19 = UIView()
    var separator20 = UIView()
    
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
    var userPhoto11 = UIImageView()
    var userPhoto12 = UIImageView()
    var userPhoto13 = UIImageView()
    var userPhoto14 = UIImageView()
    var userPhoto15 = UIImageView()
    var userPhoto16 = UIImageView()
    var userPhoto17 = UIImageView()
    var userPhoto18 = UIImageView()
    var userPhoto19 = UIImageView()
    var userPhoto20 = UIImageView()
    
    var userName1 = UILabel()
    var userName2 = UILabel()
    var userName3 = UILabel()
    var userName4 = UILabel()
    var userName5 = UILabel()
    var userName6 = UILabel()
    var userName7 = UILabel()
    var userName8 = UILabel()
    var userName9 = UILabel()
    var userName10 = UILabel()
    var userName11 = UILabel()
    var userName12 = UILabel()
    var userName13 = UILabel()
    var userName14 = UILabel()
    var userName15 = UILabel()
    var userName16 = UILabel()
    var userName17 = UILabel()
    var userName18 = UILabel()
    var userName19 = UILabel()
    var userName20 = UILabel()
    
    var indicator1 = UIActivityIndicatorView()
    var indicator2 = UIActivityIndicatorView()
    var indicator3 = UIActivityIndicatorView()
    var indicator4 = UIActivityIndicatorView()
    var indicator5 = UIActivityIndicatorView()
    var indicator6 = UIActivityIndicatorView()
    var indicator7 = UIActivityIndicatorView()
    var indicator8 = UIActivityIndicatorView()
    var indicator9 = UIActivityIndicatorView()
    var indicator10 = UIActivityIndicatorView()
    var indicator11 = UIActivityIndicatorView()
    var indicator12 = UIActivityIndicatorView()
    var indicator13 = UIActivityIndicatorView()
    var indicator14 = UIActivityIndicatorView()
    var indicator15 = UIActivityIndicatorView()
    var indicator16 = UIActivityIndicatorView()
    var indicator17 = UIActivityIndicatorView()
    var indicator18 = UIActivityIndicatorView()
    var indicator19 = UIActivityIndicatorView()
    var indicator20 = UIActivityIndicatorView()
    
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
        label.text = "Loading..."
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
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
    
    var username1: String! = ""
    var username2: String! = ""
    var username3: String! = ""
    var username4: String! = ""
    var username5: String! = ""
    var username6: String! = ""
    var username7: String! = ""
    var username8: String! = ""
    var username9: String! = ""
    var username10: String! = ""
    var username11: String! = ""
    var username12: String! = ""
    var username13: String! = ""
    var username14: String! = ""
    var username15: String! = ""
    var username16: String! = ""
    var username17: String! = ""
    var username18: String! = ""
    var username19: String! = ""
    var username20: String! = ""
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width:view.bounds.width, height: 1420)
        
        self.title = "Last Profile Visitors"
        navigationController?.navigationBarHidden = true
        navigationController?.navigationBar.alpha = 0
        navigationController?.navigationItem.leftBarButtonItem = nil
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        
        let rightBarButton = UIBarButtonItem(
            title: "",
            style: .Plain,
            target: self,
            action: #selector(ViewController.openDownloadsView))
        
        
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        self.getUsers()
        
        scrollView.hidden = true
        scrollView.alpha = 0
        
        viewSettings(view1, separator: separator1, photo: userPhoto1, indicator: indicator1, nameLabel: userName1)
        viewSettings(view2, separator: separator2, photo: userPhoto2, indicator: indicator2, nameLabel: userName2)
        viewSettings(view3, separator: separator3, photo: userPhoto3, indicator: indicator3, nameLabel: userName3)
        viewSettings(view4, separator: separator4, photo: userPhoto4, indicator: indicator4, nameLabel: userName4)
        viewSettings(view5, separator: separator5, photo: userPhoto5, indicator: indicator5, nameLabel: userName5)
        viewSettings(view6, separator: separator6, photo: userPhoto6, indicator: indicator6, nameLabel: userName6)
        viewSettings(view7, separator: separator7, photo: userPhoto7, indicator: indicator7, nameLabel: userName7)
        viewSettings(view8, separator: separator8, photo: userPhoto8, indicator: indicator8, nameLabel: userName8)
        viewSettings(view9, separator: separator9, photo: userPhoto9, indicator: indicator9, nameLabel: userName9)
        viewSettings(view10, separator: separator10, photo: userPhoto10, indicator: indicator10, nameLabel: userName10)
        viewSettings(view11, separator: separator11, photo: userPhoto11, indicator: indicator11, nameLabel: userName11)
        viewSettings(view12, separator: separator12, photo: userPhoto12, indicator: indicator12, nameLabel: userName12)
        viewSettings(view13, separator: separator13, photo: userPhoto13, indicator: indicator13, nameLabel: userName13)
        viewSettings(view14, separator: separator14, photo: userPhoto14, indicator: indicator14, nameLabel: userName14)
        viewSettings(view15, separator: separator15, photo: userPhoto15, indicator: indicator15, nameLabel: userName15)
        viewSettings(view16, separator: separator16, photo: userPhoto16, indicator: indicator16, nameLabel: userName16)
        viewSettings(view17, separator: separator17, photo: userPhoto17, indicator: indicator17, nameLabel: userName17)
        viewSettings(view18, separator: separator18, photo: userPhoto18, indicator: indicator18, nameLabel: userName18)
        viewSettings(view19, separator: separator19, photo: userPhoto19, indicator: indicator19, nameLabel: userName19)
        viewSettings(view20, separator: separator20, photo: userPhoto20, indicator: indicator20, nameLabel: userName20)
        
        view.addSubview(scrollView)
        scrollView.addSubview(view1)
        scrollView.addSubview(separator1)
        scrollView.addSubview(view2)
        scrollView.addSubview(separator2)
        scrollView.addSubview(view3)
        scrollView.addSubview(separator3)
        scrollView.addSubview(view4)
        scrollView.addSubview(separator4)
        scrollView.addSubview(view5)
        scrollView.addSubview(separator5)
        scrollView.addSubview(view6)
        scrollView.addSubview(separator6)
        scrollView.addSubview(view7)
        scrollView.addSubview(separator7)
        scrollView.addSubview(view8)
        scrollView.addSubview(separator8)
        scrollView.addSubview(view9)
        scrollView.addSubview(separator9)
        scrollView.addSubview(view10)
        scrollView.addSubview(separator10)
        scrollView.addSubview(view11)
        scrollView.addSubview(separator11)
        scrollView.addSubview(view12)
        scrollView.addSubview(separator12)
        scrollView.addSubview(view13)
        scrollView.addSubview(separator13)
        scrollView.addSubview(view14)
        scrollView.addSubview(separator14)
        scrollView.addSubview(view15)
        scrollView.addSubview(separator15)
        scrollView.addSubview(view16)
        scrollView.addSubview(separator16)
        scrollView.addSubview(view17)
        scrollView.addSubview(separator17)
        scrollView.addSubview(view18)
        scrollView.addSubview(separator18)
        scrollView.addSubview(view19)
        scrollView.addSubview(separator19)
        scrollView.addSubview(view20)
        scrollView.addSubview(separator20)
        
        view1.addSubview(indicator1)
        view2.addSubview(indicator2)
        view3.addSubview(indicator3)
        view4.addSubview(indicator4)
        view5.addSubview(indicator5)
        view6.addSubview(indicator6)
        view7.addSubview(indicator7)
        view8.addSubview(indicator8)
        view9.addSubview(indicator9)
        view10.addSubview(indicator10)
        view11.addSubview(indicator11)
        view12.addSubview(indicator12)
        view13.addSubview(indicator13)
        view14.addSubview(indicator14)
        view15.addSubview(indicator15)
        view16.addSubview(indicator16)
        view17.addSubview(indicator17)
        view18.addSubview(indicator18)
        view19.addSubview(indicator19)
        view20.addSubview(indicator20)
        
        view1.addSubview(userPhoto1)
        view2.addSubview(userPhoto2)
        view3.addSubview(userPhoto3)
        view4.addSubview(userPhoto4)
        view5.addSubview(userPhoto5)
        view6.addSubview(userPhoto6)
        view7.addSubview(userPhoto7)
        view8.addSubview(userPhoto8)
        view9.addSubview(userPhoto9)
        view10.addSubview(userPhoto10)
        view11.addSubview(userPhoto11)
        view12.addSubview(userPhoto12)
        view13.addSubview(userPhoto13)
        view14.addSubview(userPhoto14)
        view15.addSubview(userPhoto15)
        view16.addSubview(userPhoto16)
        view17.addSubview(userPhoto17)
        view18.addSubview(userPhoto18)
        view19.addSubview(userPhoto19)
        view20.addSubview(userPhoto20)
        
        blurphoto(userPhoto1)
        blurphoto(userPhoto2)
        blurphoto(userPhoto3)
        blurphoto(userPhoto4)
        blurphoto(userPhoto5)
        blurphoto(userPhoto6)
        blurphoto(userPhoto7)
        blurphoto(userPhoto8)
        blurphoto(userPhoto9)
        blurphoto(userPhoto10)
        blurphoto(userPhoto11)
        blurphoto(userPhoto12)
        blurphoto(userPhoto13)
        blurphoto(userPhoto14)
        blurphoto(userPhoto15)
        blurphoto(userPhoto16)
        blurphoto(userPhoto17)
        
        view1.addSubview(userName1)
        view2.addSubview(userName2)
        view3.addSubview(userName3)
        view4.addSubview(userName4)
        view5.addSubview(userName5)
        view6.addSubview(userName6)
        view7.addSubview(userName7)
        view8.addSubview(userName8)
        view9.addSubview(userName9)
        view10.addSubview(userName10)
        view11.addSubview(userName11)
        view12.addSubview(userName12)
        view13.addSubview(userName13)
        view14.addSubview(userName14)
        view15.addSubview(userName15)
        view16.addSubview(userName16)
        view17.addSubview(userName17)
        view18.addSubview(userName18)
        view19.addSubview(userName19)
        view20.addSubview(userName20)
        
        view.addSubview(loadingView)
        loadingView.addSubview(loadingIndicator)
        loadingView.addSubview(loadingLabel)
        
        setupViews()
        
        if SKPaymentQueue.canMakePayments() {
            print("IAP is enabled, loading...")
            let productId: NSSet = NSSet(objects: "socialSpy1", "socialSpy2", "socialSpy3")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productId as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPs")
        }
        
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().addPayment(pay as SKPayment)
    }
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        print("product request")
        let myProduct = response.products
        
        for product in myProduct {
            print("product added")
            print(product.productIdentifier)
            print(product.localizedTitle)
            print(product.localizedDescription)
            print(product.price)
            
            list.append(product )
        }
    }
    
    
    func openDownloadsView() {
        let downloads = DownloadsViewController()
        self.presentViewController(downloads, animated: true, completion: nil)
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("product request")
        print("add paymnet")
        
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            
            switch trans.transactionState {
            case .Purchased:
                let prodId = p.productIdentifier as String
                switch prodId {
                case "socialSpy3":
                    self.showNames3()
                    break
                default:
                    print("IAP not setup")
                }
                queue.finishTransaction(trans)
                break
            case .Failed:
                print("buy error")
                queue.finishTransaction(trans)
                break
            default:
                break
            }
        }
    }
    
    func finishTransaction(trans:SKPaymentTransaction) {
        print("finish trans")
        SKPaymentQueue.defaultQueue().finishTransaction(trans)
    }
    func paymentQueue(queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("remove trans");
    }
    
    func buyTop5() {
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "socialSpy1") {
                p = product
                buyProduct()
                break;
            }
        }
    }
    
    func buyTop10() {
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "socialSpy2") {
                p = product
                buyProduct()
                break;
            }
        }
    }
    
    func buyTop20() {
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "socialSpy3") {
                p = product
                buyProduct()
                break;
            }
        }
    }
    
    func blurphoto(photo: UIImageView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = photo.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        photo.addSubview(blurEffectView)
    }
    
    func setUserPhoto(url: String, image: UIImageView) {
        if let url  = NSURL(string: url),
            data = NSData(contentsOfURL: url)
        {
            image.image = UIImage(data: data)
        }
    }
    
    func viewSettings(view: UIView, separator: UIView, photo: UIImageView, indicator: UIActivityIndicatorView, nameLabel: UILabel) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.whiteColor()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 10
        photo.clipsToBounds = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        indicator.color = UIColor(r: 50, g: 50, b: 50)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFontOfSize(16)
        nameLabel.text = "Hidden (Buy to unlock)"
    }
    
    func showBuyAlert(){
        let alert = UIAlertView(title: "Purchase", message: "Unlock and see wich users have visited your profile.", delegate: self, cancelButtonTitle:"Cancel")
        alert.addButtonWithTitle(self.inApp1Text)
        alert.addButtonWithTitle(self.inApp2Text)
        alert.addButtonWithTitle(self.inApp3Text)
        alert.show()
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        switch buttonIndex{
        case 1: self.buyTop5()
        case 2: self.buyTop10()
        case 3: self.buyTop20()
        default: print("Is this part even possible?")
        }
    }
    
    func getUsers() {
        Alamofire.request(.GET, "https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-117245197647/socialPicket/data.json")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    let response = JSON as! NSDictionary
                    
                    let userPhoto1: String! = String(response.objectForKey("userPhoto1")!)
                    let userPhoto2: String! = String(response.objectForKey("userPhoto2")!)
                    let userPhoto3: String! = String(response.objectForKey("userPhoto3")!)
                    let userPhoto4: String! = String(response.objectForKey("userPhoto4")!)
                    let userPhoto5: String! = String(response.objectForKey("userPhoto5")!)
                    let userPhoto6: String! = String(response.objectForKey("userPhoto6")!)
                    let userPhoto7: String! = String(response.objectForKey("userPhoto7")!)
                    let userPhoto8: String! = String(response.objectForKey("userPhoto8")!)
                    let userPhoto9: String! = String(response.objectForKey("userPhoto9")!)
                    let userPhoto10: String! = String(response.objectForKey("userPhoto10")!)
                    let userPhoto11: String! = String(response.objectForKey("userPhoto11")!)
                    let userPhoto12: String! = String(response.objectForKey("userPhoto12")!)
                    let userPhoto13: String! = String(response.objectForKey("userPhoto13")!)
                    let userPhoto14: String! = String(response.objectForKey("userPhoto14")!)
                    let userPhoto15: String! = String(response.objectForKey("userPhoto15")!)
                    let userPhoto16: String! = String(response.objectForKey("userPhoto16")!)
                    let userPhoto17: String! = String(response.objectForKey("userPhoto17")!)
                    let userPhoto18: String! = String(response.objectForKey("userPhoto18")!)
                    let userPhoto19: String! = String(response.objectForKey("userPhoto19")!)
                    let userPhoto20: String! = String(response.objectForKey("userPhoto20")!)
                    
                    let userName1: String! = String(response.objectForKey("userName1")!)
                    let userName2: String! = String(response.objectForKey("userName2")!)
                    let userName3: String! = String(response.objectForKey("userName3")!)
                    let userName4: String! = String(response.objectForKey("userName4")!)
                    let userName5: String! = String(response.objectForKey("userName5")!)
                    let userName6: String! = String(response.objectForKey("userName6")!)
                    let userName7: String! = String(response.objectForKey("userName7")!)
                    let userName8: String! = String(response.objectForKey("userName8")!)
                    let userName9: String! = String(response.objectForKey("userName9")!)
                    let userName10: String! = String(response.objectForKey("userName10")!)
                    let userName11: String! = String(response.objectForKey("userName11")!)
                    let userName12: String! = String(response.objectForKey("userName12")!)
                    let userName13: String! = String(response.objectForKey("userName13")!)
                    let userName14: String! = String(response.objectForKey("userName14")!)
                    let userName15: String! = String(response.objectForKey("userName15")!)
                    let userName16: String! = String(response.objectForKey("userName16")!)
                    let userName17: String! = String(response.objectForKey("userName17")!)
                    let userName18: String! = String(response.objectForKey("userName18")!)
                    let userName19: String! = String(response.objectForKey("userName19")!)
                    let userName20: String! = String(response.objectForKey("userName20")!)
                    
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
                        self.setUserPhoto(userPhoto11, image: self.userPhoto11)
                        self.setUserPhoto(userPhoto12, image: self.userPhoto12)
                        self.setUserPhoto(userPhoto13, image: self.userPhoto13)
                        self.setUserPhoto(userPhoto14, image: self.userPhoto14)
                        self.setUserPhoto(userPhoto15, image: self.userPhoto15)
                        self.setUserPhoto(userPhoto16, image: self.userPhoto16)
                        self.setUserPhoto(userPhoto17, image: self.userPhoto17)
                        self.setUserPhoto(userPhoto18, image: self.userPhoto18)
                        self.setUserPhoto(userPhoto19, image: self.userPhoto19)
                        self.setUserPhoto(userPhoto20, image: self.userPhoto20)
                        
                        self.username1 = userName1
                        self.username2 = userName2
                        self.username3 = userName3
                        self.username4 = userName4
                        self.username5 = userName5
                        self.username6 = userName6
                        self.username7 = userName7
                        self.username8 = userName8
                        self.username9 = userName9
                        self.username10 = userName10
                        self.username11 = userName11
                        self.username12 = userName12
                        self.username13 = userName13
                        self.username14 = userName14
                        self.username15 = userName15
                        self.username16 = userName16
                        self.username17 = userName17
                        self.username18 = userName18
                        self.username19 = userName19
                        self.username20 = userName20
                        
                        self.indicator1.hidden = true
                        self.indicator1.stopAnimating()
                        self.indicator2.hidden = true
                        self.indicator2.stopAnimating()
                        self.indicator3.hidden = true
                        self.indicator3.stopAnimating()
                        self.indicator4.hidden = true
                        self.indicator4.stopAnimating()
                        self.indicator5.hidden = true
                        self.indicator5.stopAnimating()
                        self.indicator6.hidden = true
                        self.indicator6.stopAnimating()
                        self.indicator7.hidden = true
                        self.indicator7.stopAnimating()
                        self.indicator8.hidden = true
                        self.indicator8.stopAnimating()
                        self.indicator9.hidden = true
                        self.indicator9.stopAnimating()
                        self.indicator10.hidden = true
                        self.indicator10.stopAnimating()
                        self.indicator11.hidden = true
                        self.indicator11.stopAnimating()
                        self.indicator12.hidden = true
                        self.indicator12.stopAnimating()
                        self.indicator13.hidden = true
                        self.indicator13.stopAnimating()
                        self.indicator14.hidden = true
                        self.indicator14.stopAnimating()
                        self.indicator15.hidden = true
                        self.indicator15.stopAnimating()
                        self.indicator16.hidden = true
                        self.indicator16.stopAnimating()
                        self.indicator17.hidden = true
                        self.indicator17.stopAnimating()
                        self.indicator18.hidden = true
                        self.indicator18.stopAnimating()
                        self.indicator19.hidden = true
                        self.indicator19.stopAnimating()
                        self.indicator20.hidden = true
                        self.indicator20.stopAnimating()
                        
                        
                        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                            self.scrollView.hidden = false
                            self.scrollView.alpha = 1
                            self.navigationController?.navigationBarHidden = false
                            self.navigationController?.navigationBar.alpha = 1
                            self.loadingView.hidden = true
                            self.showNames3()
                            }, completion:nil)
                    }
                }
        }
    }
    
    func showNames3() {
        self.userName1.alpha = 0
        self.userName2.alpha = 0
        self.userName3.alpha = 0
        self.userName4.alpha = 0
        self.userName5.alpha = 0
        self.userName6.alpha = 0
        self.userName7.alpha = 0
        self.userName8.alpha = 0
        self.userName9.alpha = 0
        self.userName10.alpha = 0
        self.userName11.alpha = 0
        self.userName12.alpha = 0
        self.userName13.alpha = 0
        self.userName14.alpha = 0
        self.userName15.alpha = 0
        self.userName16.alpha = 0
        self.userName17.alpha = 0
        self.userName18.alpha = 0
        self.userName19.alpha = 0
        self.userName20.alpha = 0
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.userName1.text = self.username1
            self.userName2.text = self.username2
            self.userName3.text = self.username3
            self.userName4.text = self.username4
            self.userName5.text = self.username5
            self.userName6.text = self.username6
            self.userName7.text = self.username7
            self.userName8.text = self.username8
            self.userName9.text = self.username9
            self.userName10.text = self.username10
            self.userName11.text = self.username11
            self.userName12.text = self.username12
            self.userName13.text = self.username13
            self.userName14.text = self.username14
            self.userName15.text = self.username15
            self.userName16.text = self.username16
            self.userName17.text = self.username17
            self.userName18.text = self.username18
            self.userName19.text = self.username19
            self.userName20.text = self.username20
            
            self.userName1.alpha = 1
            self.userName2.alpha = 1
            self.userName3.alpha = 1
            self.userName4.alpha = 1
            self.userName5.alpha = 1
            self.userName6.alpha = 1
            self.userName7.alpha = 1
            self.userName8.alpha = 1
            self.userName9.alpha = 1
            self.userName10.alpha = 1
            self.userName11.alpha = 1
            self.userName12.alpha = 1
            self.userName13.alpha = 1
            self.userName14.alpha = 1
            self.userName15.alpha = 1
            self.userName16.alpha = 1
            self.userName17.alpha = 1
            self.userName18.alpha = 1
            self.userName19.alpha = 1
            self.userName20.alpha = 1
    
            
            self.userPhoto1.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto2.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto3.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto4.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto5.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto6.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto7.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto8.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto9.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto10.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto11.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto12.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto13.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto14.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto15.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto16.subviews.forEach({ $0.removeFromSuperview() })
            self.userPhoto17.subviews.forEach({ $0.removeFromSuperview() })
            
            }, completion:nil)
    }
    
    
    func setupViews() {
        let scrollViewHeight = self.view.bounds.height
        
        scrollView.heightAnchor.constraintEqualToConstant(scrollViewHeight).active = true
        scrollView.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        scrollView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        view1.topAnchor.constraintEqualToAnchor(scrollView.topAnchor).active = true
        view1.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view1.heightAnchor.constraintEqualToConstant(70).active = true
        separator1.topAnchor.constraintEqualToAnchor(view1.bottomAnchor).active = true
        separator1.heightAnchor.constraintEqualToConstant(1).active = true
        separator1.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view2.topAnchor.constraintEqualToAnchor(separator1.bottomAnchor).active = true
        view2.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view2.heightAnchor.constraintEqualToConstant(70).active = true
        separator2.topAnchor.constraintEqualToAnchor(view2.bottomAnchor).active = true
        separator2.heightAnchor.constraintEqualToConstant(1).active = true
        separator2.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view3.topAnchor.constraintEqualToAnchor(separator2.bottomAnchor).active = true
        view3.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view3.heightAnchor.constraintEqualToConstant(70).active = true
        separator3.topAnchor.constraintEqualToAnchor(view3.bottomAnchor).active = true
        separator3.heightAnchor.constraintEqualToConstant(1).active = true
        separator3.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view4.topAnchor.constraintEqualToAnchor(separator3.bottomAnchor).active = true
        view4.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view4.heightAnchor.constraintEqualToConstant(70).active = true
        separator4.topAnchor.constraintEqualToAnchor(view4.bottomAnchor).active = true
        separator4.heightAnchor.constraintEqualToConstant(1).active = true
        separator4.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view5.topAnchor.constraintEqualToAnchor(separator4.bottomAnchor).active = true
        view5.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view5.heightAnchor.constraintEqualToConstant(70).active = true
        separator5.topAnchor.constraintEqualToAnchor(view5.bottomAnchor).active = true
        separator5.heightAnchor.constraintEqualToConstant(1).active = true
        separator5.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view6.topAnchor.constraintEqualToAnchor(separator5.bottomAnchor).active = true
        view6.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view6.heightAnchor.constraintEqualToConstant(70).active = true
        separator6.topAnchor.constraintEqualToAnchor(view6.bottomAnchor).active = true
        separator6.heightAnchor.constraintEqualToConstant(1).active = true
        separator6.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view7.topAnchor.constraintEqualToAnchor(separator6.bottomAnchor).active = true
        view7.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view7.heightAnchor.constraintEqualToConstant(70).active = true
        separator7.topAnchor.constraintEqualToAnchor(view7.bottomAnchor).active = true
        separator7.heightAnchor.constraintEqualToConstant(1).active = true
        separator7.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view8.topAnchor.constraintEqualToAnchor(separator7.bottomAnchor).active = true
        view8.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view8.heightAnchor.constraintEqualToConstant(70).active = true
        separator8.topAnchor.constraintEqualToAnchor(view8.bottomAnchor).active = true
        separator8.heightAnchor.constraintEqualToConstant(1).active = true
        separator8.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view9.topAnchor.constraintEqualToAnchor(separator8.bottomAnchor).active = true
        view9.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view9.heightAnchor.constraintEqualToConstant(70).active = true
        separator9.topAnchor.constraintEqualToAnchor(view9.bottomAnchor).active = true
        separator9.heightAnchor.constraintEqualToConstant(1).active = true
        separator9.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view10.topAnchor.constraintEqualToAnchor(separator9.bottomAnchor).active = true
        view10.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view10.heightAnchor.constraintEqualToConstant(70).active = true
        separator10.topAnchor.constraintEqualToAnchor(view10.bottomAnchor).active = true
        separator10.heightAnchor.constraintEqualToConstant(1).active = true
        separator10.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view11.topAnchor.constraintEqualToAnchor(separator10.bottomAnchor).active = true
        view11.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view11.heightAnchor.constraintEqualToConstant(70).active = true
        separator11.topAnchor.constraintEqualToAnchor(view11.bottomAnchor).active = true
        separator11.heightAnchor.constraintEqualToConstant(1).active = true
        separator11.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view12.topAnchor.constraintEqualToAnchor(separator11.bottomAnchor).active = true
        view12.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view12.heightAnchor.constraintEqualToConstant(70).active = true
        separator12.topAnchor.constraintEqualToAnchor(view12.bottomAnchor).active = true
        separator12.heightAnchor.constraintEqualToConstant(1).active = true
        separator12.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view13.topAnchor.constraintEqualToAnchor(separator12.bottomAnchor).active = true
        view13.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view13.heightAnchor.constraintEqualToConstant(70).active = true
        separator13.topAnchor.constraintEqualToAnchor(view13.bottomAnchor).active = true
        separator13.heightAnchor.constraintEqualToConstant(1).active = true
        separator13.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view14.topAnchor.constraintEqualToAnchor(separator13.bottomAnchor).active = true
        view14.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view14.heightAnchor.constraintEqualToConstant(70).active = true
        separator14.topAnchor.constraintEqualToAnchor(view14.bottomAnchor).active = true
        separator14.heightAnchor.constraintEqualToConstant(1).active = true
        separator14.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view15.topAnchor.constraintEqualToAnchor(separator14.bottomAnchor).active = true
        view15.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view15.heightAnchor.constraintEqualToConstant(70).active = true
        separator15.topAnchor.constraintEqualToAnchor(view15.bottomAnchor).active = true
        separator15.heightAnchor.constraintEqualToConstant(1).active = true
        separator15.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view16.topAnchor.constraintEqualToAnchor(separator15.bottomAnchor).active = true
        view16.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view16.heightAnchor.constraintEqualToConstant(70).active = true
        separator16.topAnchor.constraintEqualToAnchor(view16.bottomAnchor).active = true
        separator16.heightAnchor.constraintEqualToConstant(1).active = true
        separator16.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view17.topAnchor.constraintEqualToAnchor(separator16.bottomAnchor).active = true
        view17.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view17.heightAnchor.constraintEqualToConstant(70).active = true
        separator17.topAnchor.constraintEqualToAnchor(view17.bottomAnchor).active = true
        separator17.heightAnchor.constraintEqualToConstant(1).active = true
        separator17.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view18.topAnchor.constraintEqualToAnchor(separator17.bottomAnchor).active = true
        view18.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view18.heightAnchor.constraintEqualToConstant(70).active = true
        separator18.topAnchor.constraintEqualToAnchor(view18.bottomAnchor).active = true
        separator18.heightAnchor.constraintEqualToConstant(1).active = true
        separator18.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view19.topAnchor.constraintEqualToAnchor(separator18.bottomAnchor).active = true
        view19.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view19.heightAnchor.constraintEqualToConstant(70).active = true
        separator19.topAnchor.constraintEqualToAnchor(view19.bottomAnchor).active = true
        separator19.heightAnchor.constraintEqualToConstant(1).active = true
        separator19.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view20.topAnchor.constraintEqualToAnchor(separator19.bottomAnchor).active = true
        view20.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        view20.heightAnchor.constraintEqualToConstant(70).active = true
        separator20.topAnchor.constraintEqualToAnchor(view20.bottomAnchor).active = true
        separator20.heightAnchor.constraintEqualToConstant(1).active = true
        separator20.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
        
        loadingView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        loadingView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        loadingView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -200).active = true
        loadingView.heightAnchor.constraintEqualToConstant(100).active = true
        
        loadingIndicator.centerXAnchor.constraintEqualToAnchor(loadingLabel.centerXAnchor).active = true
        loadingIndicator.centerYAnchor.constraintEqualToAnchor(loadingView.centerYAnchor, constant: -10).active = true
        
        loadingLabel.centerXAnchor.constraintEqualToAnchor(loadingView.centerXAnchor).active = true
        loadingLabel.centerYAnchor.constraintEqualToAnchor(loadingView.centerYAnchor, constant: 25).active = true
        loadingLabel.heightAnchor.constraintEqualToConstant(25).active = true
        
        userPhoto1.leftAnchor.constraintEqualToAnchor(view1.leftAnchor, constant: 10).active = true
        userPhoto1.centerYAnchor.constraintEqualToAnchor(view1.centerYAnchor).active = true
        userPhoto1.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto1.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto2.leftAnchor.constraintEqualToAnchor(view2.leftAnchor, constant: 10).active = true
        userPhoto2.centerYAnchor.constraintEqualToAnchor(view2.centerYAnchor).active = true
        userPhoto2.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto2.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto3.leftAnchor.constraintEqualToAnchor(view3.leftAnchor, constant: 10).active = true
        userPhoto3.centerYAnchor.constraintEqualToAnchor(view3.centerYAnchor).active = true
        userPhoto3.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto3.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto4.leftAnchor.constraintEqualToAnchor(view4.leftAnchor, constant: 10).active = true
        userPhoto4.centerYAnchor.constraintEqualToAnchor(view4.centerYAnchor).active = true
        userPhoto4.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto4.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto5.leftAnchor.constraintEqualToAnchor(view5.leftAnchor, constant: 10).active = true
        userPhoto5.centerYAnchor.constraintEqualToAnchor(view5.centerYAnchor).active = true
        userPhoto5.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto5.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto6.leftAnchor.constraintEqualToAnchor(view6.leftAnchor, constant: 10).active = true
        userPhoto6.centerYAnchor.constraintEqualToAnchor(view6.centerYAnchor).active = true
        userPhoto6.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto6.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto7.leftAnchor.constraintEqualToAnchor(view7.leftAnchor, constant: 10).active = true
        userPhoto7.centerYAnchor.constraintEqualToAnchor(view7.centerYAnchor).active = true
        userPhoto7.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto7.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto8.leftAnchor.constraintEqualToAnchor(view8.leftAnchor, constant: 10).active = true
        userPhoto8.centerYAnchor.constraintEqualToAnchor(view8.centerYAnchor).active = true
        userPhoto8.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto8.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto9.leftAnchor.constraintEqualToAnchor(view9.leftAnchor, constant: 10).active = true
        userPhoto9.centerYAnchor.constraintEqualToAnchor(view9.centerYAnchor).active = true
        userPhoto9.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto9.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto10.leftAnchor.constraintEqualToAnchor(view10.leftAnchor, constant: 10).active = true
        userPhoto10.centerYAnchor.constraintEqualToAnchor(view10.centerYAnchor).active = true
        userPhoto10.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto10.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto11.leftAnchor.constraintEqualToAnchor(view11.leftAnchor, constant: 10).active = true
        userPhoto11.centerYAnchor.constraintEqualToAnchor(view11.centerYAnchor).active = true
        userPhoto11.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto11.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto12.leftAnchor.constraintEqualToAnchor(view12.leftAnchor, constant: 10).active = true
        userPhoto12.centerYAnchor.constraintEqualToAnchor(view12.centerYAnchor).active = true
        userPhoto12.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto12.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto13.leftAnchor.constraintEqualToAnchor(view13.leftAnchor, constant: 10).active = true
        userPhoto13.centerYAnchor.constraintEqualToAnchor(view13.centerYAnchor).active = true
        userPhoto13.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto13.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto14.leftAnchor.constraintEqualToAnchor(view14.leftAnchor, constant: 10).active = true
        userPhoto14.centerYAnchor.constraintEqualToAnchor(view14.centerYAnchor).active = true
        userPhoto14.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto14.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto15.leftAnchor.constraintEqualToAnchor(view15.leftAnchor, constant: 10).active = true
        userPhoto15.centerYAnchor.constraintEqualToAnchor(view15.centerYAnchor).active = true
        userPhoto15.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto15.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto16.leftAnchor.constraintEqualToAnchor(view16.leftAnchor, constant: 10).active = true
        userPhoto16.centerYAnchor.constraintEqualToAnchor(view16.centerYAnchor).active = true
        userPhoto16.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto16.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto17.leftAnchor.constraintEqualToAnchor(view17.leftAnchor, constant: 10).active = true
        userPhoto17.centerYAnchor.constraintEqualToAnchor(view17.centerYAnchor).active = true
        userPhoto17.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto17.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto18.leftAnchor.constraintEqualToAnchor(view18.leftAnchor, constant: 10).active = true
        userPhoto18.centerYAnchor.constraintEqualToAnchor(view18.centerYAnchor).active = true
        userPhoto18.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto18.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto19.leftAnchor.constraintEqualToAnchor(view19.leftAnchor, constant: 10).active = true
        userPhoto19.centerYAnchor.constraintEqualToAnchor(view19.centerYAnchor).active = true
        userPhoto19.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto19.heightAnchor.constraintEqualToConstant(50).active = true
        userPhoto20.leftAnchor.constraintEqualToAnchor(view20.leftAnchor, constant: 10).active = true
        userPhoto20.centerYAnchor.constraintEqualToAnchor(view20.centerYAnchor).active = true
        userPhoto20.widthAnchor.constraintEqualToConstant(50).active = true
        userPhoto20.heightAnchor.constraintEqualToConstant(50).active = true
        
        
        userName1.leftAnchor.constraintEqualToAnchor(userPhoto1.rightAnchor, constant: 10).active = true
        userName1.centerYAnchor.constraintEqualToAnchor(view1.centerYAnchor).active = true
        userName2.leftAnchor.constraintEqualToAnchor(userPhoto2.rightAnchor, constant: 10).active = true
        userName2.centerYAnchor.constraintEqualToAnchor(view2.centerYAnchor).active = true
        userName3.leftAnchor.constraintEqualToAnchor(userPhoto3.rightAnchor, constant: 10).active = true
        userName3.centerYAnchor.constraintEqualToAnchor(view3.centerYAnchor).active = true
        userName4.leftAnchor.constraintEqualToAnchor(userPhoto4.rightAnchor, constant: 10).active = true
        userName4.centerYAnchor.constraintEqualToAnchor(view4.centerYAnchor).active = true
        userName5.leftAnchor.constraintEqualToAnchor(userPhoto5.rightAnchor, constant: 10).active = true
        userName5.centerYAnchor.constraintEqualToAnchor(view5.centerYAnchor).active = true
        userName6.leftAnchor.constraintEqualToAnchor(userPhoto6.rightAnchor, constant: 10).active = true
        userName6.centerYAnchor.constraintEqualToAnchor(view6.centerYAnchor).active = true
        userName7.leftAnchor.constraintEqualToAnchor(userPhoto7.rightAnchor, constant: 10).active = true
        userName7.centerYAnchor.constraintEqualToAnchor(view7.centerYAnchor).active = true
        userName8.leftAnchor.constraintEqualToAnchor(userPhoto8.rightAnchor, constant: 10).active = true
        userName8.centerYAnchor.constraintEqualToAnchor(view8.centerYAnchor).active = true
        userName9.leftAnchor.constraintEqualToAnchor(userPhoto9.rightAnchor, constant: 10).active = true
        userName9.centerYAnchor.constraintEqualToAnchor(view9.centerYAnchor).active = true
        userName10.leftAnchor.constraintEqualToAnchor(userPhoto10.rightAnchor, constant: 10).active = true
        userName10.centerYAnchor.constraintEqualToAnchor(view10.centerYAnchor).active = true
        userName11.leftAnchor.constraintEqualToAnchor(userPhoto11.rightAnchor, constant: 10).active = true
        userName11.centerYAnchor.constraintEqualToAnchor(view11.centerYAnchor).active = true
        userName12.leftAnchor.constraintEqualToAnchor(userPhoto12.rightAnchor, constant: 10).active = true
        userName12.centerYAnchor.constraintEqualToAnchor(view12.centerYAnchor).active = true
        userName13.leftAnchor.constraintEqualToAnchor(userPhoto13.rightAnchor, constant: 10).active = true
        userName13.centerYAnchor.constraintEqualToAnchor(view13.centerYAnchor).active = true
        userName14.leftAnchor.constraintEqualToAnchor(userPhoto14.rightAnchor, constant: 10).active = true
        userName14.centerYAnchor.constraintEqualToAnchor(view14.centerYAnchor).active = true
        userName15.leftAnchor.constraintEqualToAnchor(userPhoto15.rightAnchor, constant: 10).active = true
        userName15.centerYAnchor.constraintEqualToAnchor(view15.centerYAnchor).active = true
        userName16.leftAnchor.constraintEqualToAnchor(userPhoto16.rightAnchor, constant: 10).active = true
        userName16.centerYAnchor.constraintEqualToAnchor(view16.centerYAnchor).active = true
        userName17.leftAnchor.constraintEqualToAnchor(userPhoto17.rightAnchor, constant: 10).active = true
        userName17.centerYAnchor.constraintEqualToAnchor(view17.centerYAnchor).active = true
        userName18.leftAnchor.constraintEqualToAnchor(userPhoto18.rightAnchor, constant: 10).active = true
        userName18.centerYAnchor.constraintEqualToAnchor(view18.centerYAnchor).active = true
        userName19.leftAnchor.constraintEqualToAnchor(userPhoto19.rightAnchor, constant: 10).active = true
        userName19.centerYAnchor.constraintEqualToAnchor(view19.centerYAnchor).active = true
        userName20.leftAnchor.constraintEqualToAnchor(userPhoto20.rightAnchor, constant: 10).active = true
        userName20.centerYAnchor.constraintEqualToAnchor(view20.centerYAnchor).active = true
        
        
        
        indicator1.centerXAnchor.constraintEqualToAnchor(userPhoto1.centerXAnchor).active = true
        indicator1.centerYAnchor.constraintEqualToAnchor(userPhoto1.centerYAnchor).active = true
        indicator2.centerXAnchor.constraintEqualToAnchor(userPhoto2.centerXAnchor).active = true
        indicator2.centerYAnchor.constraintEqualToAnchor(userPhoto2.centerYAnchor).active = true
        indicator3.centerXAnchor.constraintEqualToAnchor(userPhoto3.centerXAnchor).active = true
        indicator3.centerYAnchor.constraintEqualToAnchor(userPhoto3.centerYAnchor).active = true
        indicator4.centerXAnchor.constraintEqualToAnchor(userPhoto4.centerXAnchor).active = true
        indicator4.centerYAnchor.constraintEqualToAnchor(userPhoto4.centerYAnchor).active = true
        indicator5.centerXAnchor.constraintEqualToAnchor(userPhoto5.centerXAnchor).active = true
        indicator5.centerYAnchor.constraintEqualToAnchor(userPhoto5.centerYAnchor).active = true
        indicator6.centerXAnchor.constraintEqualToAnchor(userPhoto6.centerXAnchor).active = true
        indicator6.centerYAnchor.constraintEqualToAnchor(userPhoto6.centerYAnchor).active = true
        indicator7.centerXAnchor.constraintEqualToAnchor(userPhoto7.centerXAnchor).active = true
        indicator7.centerYAnchor.constraintEqualToAnchor(userPhoto7.centerYAnchor).active = true
        indicator8.centerXAnchor.constraintEqualToAnchor(userPhoto8.centerXAnchor).active = true
        indicator8.centerYAnchor.constraintEqualToAnchor(userPhoto8.centerYAnchor).active = true
        indicator9.centerYAnchor.constraintEqualToAnchor(userPhoto9.centerYAnchor).active = true
        indicator9.centerXAnchor.constraintEqualToAnchor(userPhoto9.centerXAnchor).active = true
        indicator10.centerYAnchor.constraintEqualToAnchor(userPhoto10.centerYAnchor).active = true
        indicator10.centerXAnchor.constraintEqualToAnchor(userPhoto10.centerXAnchor).active = true
        indicator11.centerYAnchor.constraintEqualToAnchor(userPhoto11.centerYAnchor).active = true
        indicator11.centerXAnchor.constraintEqualToAnchor(userPhoto11.centerXAnchor).active = true
        indicator12.centerYAnchor.constraintEqualToAnchor(userPhoto12.centerYAnchor).active = true
        indicator12.centerYAnchor.constraintEqualToAnchor(userPhoto12.centerYAnchor).active = true
        indicator13.centerXAnchor.constraintEqualToAnchor(userPhoto13.centerXAnchor).active = true
        indicator13.centerYAnchor.constraintEqualToAnchor(userPhoto13.centerYAnchor).active = true
        indicator14.centerXAnchor.constraintEqualToAnchor(userPhoto14.centerXAnchor).active = true
        indicator14.centerYAnchor.constraintEqualToAnchor(userPhoto14.centerYAnchor).active = true
        indicator15.centerXAnchor.constraintEqualToAnchor(userPhoto15.centerXAnchor).active = true
        indicator15.centerYAnchor.constraintEqualToAnchor(userPhoto15.centerYAnchor).active = true
        indicator16.centerYAnchor.constraintEqualToAnchor(userPhoto16.centerYAnchor).active = true
        indicator16.centerXAnchor.constraintEqualToAnchor(userPhoto16.centerXAnchor).active = true
        indicator17.centerYAnchor.constraintEqualToAnchor(userPhoto17.centerYAnchor).active = true
        indicator17.centerXAnchor.constraintEqualToAnchor(userPhoto17.centerXAnchor).active = true
        indicator18.centerYAnchor.constraintEqualToAnchor(userPhoto18.centerYAnchor).active = true
        indicator18.centerXAnchor.constraintEqualToAnchor(userPhoto18.centerXAnchor).active = true
        indicator19.centerYAnchor.constraintEqualToAnchor(userPhoto19.centerYAnchor).active = true
        indicator19.centerYAnchor.constraintEqualToAnchor(userPhoto19.centerYAnchor).active = true
        indicator20.centerYAnchor.constraintEqualToAnchor(userPhoto20.centerYAnchor).active = true
        indicator20.centerYAnchor.constraintEqualToAnchor(userPhoto20.centerYAnchor).active = true
        
//        buyButtonbackground.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
//        buyButtonbackground.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
//        buyButtonbackground.heightAnchor.constraintEqualToConstant(64).active = true
//        
//        buyButton.centerYAnchor.constraintEqualToAnchor(buyButtonbackground.centerYAnchor).active = true
//        buyButton.centerXAnchor.constraintEqualToAnchor(buyButtonbackground.centerXAnchor).active = true
//        buyButton.widthAnchor.constraintEqualToAnchor(buyButtonbackground.widthAnchor, constant: -100).active = true
//        buyButton.heightAnchor.constraintEqualToConstant(40).active = true
        
        
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

struct Friend {
    var name, picture: String!
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

