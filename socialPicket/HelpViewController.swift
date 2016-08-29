
//
//  HelpViewController.swift
//  socialPicket
//
//  Created by José María Delgado  on 27/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Help"
        label.font = UIFont.systemFontOfSize(25, weight: UIFontWeightMedium)
        label.textColor = UIColor(r: 50, g: 50, b: 50)
        
        return label
    }()
    
    var helpTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "What is Social Spy? Social Spy is an application that tracks your social media interactions.\n\n It generates basic entertaining reports by tracking who you're following, who you're followed by and tracking your social media posts and users who likes or commenting on them. For example, you can get a report who you're following and who you're not followed by.\n\n You can get this entertaining report by upgrading your membership to premium. You reports will be updated as possible as quickly.\n\n By Social Spy premium membership, you can easily take advantage of all social media accounts reports that applications provides. Each social media accounts have own specialized report screens. For example you can get a report for Who Doesn't Follow Me on Istagram account but you can not get this report on your Facebook account because people can follow each other on Instagram but they can not do this on Facebook.\n\n Who viewed my profile and who is interested in your profile algorithm is only for entertaining. It doesn't show %100 true results but it generates the report by tracking your followers data and tracking your social media posts and the users who liked or commented on them. If a user likes or comments a social media post of you, It's supposably a user who visited your profile. You can also get a report for users who liked your photos or posts.\n\n Social Spy is an entertainment service and we do not guarantee to give you %100 real reports. You accept that we do not guarantee to give you exact true reports by downloading and upgrading your membership."

        textView.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        textView.textColor = UIColor(r: 100, g: 100, b: 100)
        textView.font = UIFont.systemFontOfSize(13, weight: UIFontWeightRegular)
        textView.showsVerticalScrollIndicator = false
        textView.editable = false
        textView.selectable = false
        
        return textView
    }()
    
    lazy var cancelButton: UIButton = {
        var button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Got It!", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15, weight: UIFontWeightBold)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor(r: 25, g: 100, b: 175)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(cancel), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
        navigationController?.navigationBarHidden = true
        
        setupViewConstraints()
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupViewConstraints() {
        
        view.addSubview(titleLabel)
        view.addSubview(helpTextView)
        view.addSubview(cancelButton)
        
        titleLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 30).active = true
        titleLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 20).active = true
        
        helpTextView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        helpTextView.bottomAnchor.constraintEqualToAnchor(cancelButton.topAnchor, constant: -10).active = true
        helpTextView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -30).active = true
        helpTextView.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor, constant: 10).active = true
        
        cancelButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -10).active = true
        cancelButton.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -50).active = true
        cancelButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        cancelButton.heightAnchor.constraintEqualToConstant(35).active = true
        
    }
    
}
