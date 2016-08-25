
//
//  InAppViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 21/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SystemConfiguration
import StoreKit

class InAppViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unlimited Access 🔓"
        label.font = UIFont.systemFontOfSize(25, weight: UIFontWeightBold)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    var icon: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please upgrade your membership to access your detailed reports, we'll also update them regularly. \n \n In order to see your reports and to be monitored your social accounts regularly, plase choose your package."
        label.font = UIFont.systemFontOfSize(14, weight: UIFontWeightRegular)
        label.numberOfLines = 7
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    var packageLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Your Package"
        label.font = UIFont.systemFontOfSize(18, weight: UIFontWeightBold)
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    lazy var buy1Button: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("chemaa →", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 89, g: 194, b: 248)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(buy1ButtonClicked), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    lazy var buy2Button: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("chemaa →", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 65, g: 170, b: 225)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(buy2ButtonClicked), forControlEvents: .TouchUpInside)
        
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
        label.text = "Loading..."
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("←  Cancel", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 234, g: 70, b: 70)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(cancel), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 225, g: 225, b: 225)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.alpha = 0
        self.title = "Unlimited Access 🔓"
        
        titleLabel.alpha = 0
        textLabel.alpha = 0
        packageLabel.alpha = 0
        buy1Button.alpha = 0
        buy2Button.alpha = 0
        separatorView.alpha = 0
        cancelButton.alpha = 0
        
        getJSON()
        
        view.addSubview(loadingView)
        loadingView.addSubview(loadingLabel)
        loadingView.addSubview(loadingIndicator)
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(packageLabel)
        view.addSubview(buy1Button)
        view.addSubview(buy2Button)
        view.addSubview(cancelButton)
        view.addSubview(separatorView)
        setupConstraints()
        
        if SKPaymentQueue.canMakePayments() {
            print("IAP is enabled, loading...")
            let productId: NSSet = NSSet(objects: "socialSpy1", "socialSpy2")
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
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("product request")
        print("add paymnet")
        
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            
            switch trans.transactionState {
            case .Purchased:
                let prodId = p.productIdentifier as String
                switch prodId {
                case "socialSpy1":
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "premiumMember")
                    self.navigationController?.popViewControllerAnimated(true)
                    break
                case "socialSpy2":
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "premiumMember")
                    self.navigationController?.popViewControllerAnimated(true)
                    break
                default:
                    print("IAP not setup")
                    break
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
    
    func buy(id: String) {
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == prodID) {
                p = product
                buyProduct()
                break;
            }
        }
    }
    
    func buy1ButtonClicked() {
        buy("socialSpy1")
    }
    
    func buy2ButtonClicked() {
        buy("socialSpy2")
    }
    
    func getJSON() {
        Alamofire.request(.GET, "https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-117245197647/socialPicket/data.json")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    let response = JSON as! NSDictionary
                    
                    if let inApp1: String! = String(response.objectForKey("inApp1")!), inApp2: String! = String(response.objectForKey("inApp2")!) {
                        
                        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                            self.titleLabel.alpha = 1
                            self.textLabel.alpha = 1
                            self.packageLabel.alpha = 1
                            self.separatorView.alpha = 1
                            self.buy1Button.alpha = 1
                            self.buy2Button.alpha = 1
                            self.buy1Button.setTitle(inApp1, forState: .Normal)
                            self.buy2Button.setTitle(inApp2, forState: .Normal)
                            self.cancelButton.alpha = 1
                            self.loadingView.hidden = true
                            self.loadingIndicator.stopAnimating()
                            }, completion:nil)
                        
                    } else {
                        
                        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                            self.titleLabel.alpha = 1
                            self.textLabel.alpha = 1
                            self.packageLabel.alpha = 1
                            self.buy1Button.alpha = 1
                            self.buy2Button.alpha = 1
                            self.cancelButton.alpha = 1
                            self.separatorView.alpha = 1
                            self.loadingView.hidden = true
                            self.loadingIndicator.stopAnimating()
                            }, completion:nil)
                        
                    }
                    
                }
        }
    }
    
    
    func cancel() {self.navigationController?.popViewControllerAnimated(true)}
    
    func setupConstraints() {
        
        loadingView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        loadingView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        loadingView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -200).active = true
        loadingView.heightAnchor.constraintEqualToConstant(100).active = true
        
        loadingIndicator.centerXAnchor.constraintEqualToAnchor(loadingLabel.centerXAnchor).active = true
        loadingIndicator.centerYAnchor.constraintEqualToAnchor(loadingView.centerYAnchor, constant: -10).active = true
        
        loadingLabel.centerXAnchor.constraintEqualToAnchor(loadingView.centerXAnchor).active = true
        loadingLabel.centerYAnchor.constraintEqualToAnchor(loadingView.centerYAnchor, constant: 25).active = true
        loadingLabel.heightAnchor.constraintEqualToConstant(25).active = true
        
        titleLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 30).active = true
        titleLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 20).active = true
        
//        icon.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor, constant: 20).active = true
//        icon.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
//        icon.widthAnchor.constraintEqualToConstant(100).active = true
//        icon.heightAnchor.constraintEqualToConstant(100).active = true
        
        textLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        textLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor, constant: 20).active = true
        textLabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -40).active = true
        
        separatorView.topAnchor.constraintEqualToAnchor(textLabel.bottomAnchor, constant: 20).active = true
        separatorView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        separatorView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        separatorView.heightAnchor.constraintEqualToConstant(1).active = true
        
        packageLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        packageLabel.topAnchor.constraintEqualToAnchor(separatorView.bottomAnchor, constant: 10).active = true
        
        buy1Button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        buy1Button.topAnchor.constraintEqualToAnchor(packageLabel.bottomAnchor, constant: 10).active = true
        buy1Button.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        buy1Button.heightAnchor.constraintEqualToConstant(40).active = true
        
        buy2Button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        buy2Button.topAnchor.constraintEqualToAnchor(buy1Button.bottomAnchor, constant: 5).active = true
        buy2Button.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        buy2Button.heightAnchor.constraintEqualToConstant(40).active = true
        
        cancelButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -10).active = true
        cancelButton.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        cancelButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        cancelButton.heightAnchor.constraintEqualToConstant(35).active = true
        
    }
    
    
}
