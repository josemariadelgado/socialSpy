//
//  ConstraintsManager.swift
//  socialPicket
//
//  Created by José María Delgado  on 18/8/16.
//  Copyright © 2016 José María Delgado. All rights reserved.
//

import Foundation
import UIKit

class ConstraintsManager {
    let viewController: ViewController = ViewController()
    
    func setupViewControllerConstraints() {
//        let viewHeight = viewController.view.bounds.height
        let scrollViewHeight =   64
        
//        viewController.scrollView.heightAnchor.constraintEqualToConstant(200).active = true
//        viewController.scrollView.widthAnchor.constraintEqualToAnchor(viewController.view.widthAnchor).active = true
//        viewController.scrollView.topAnchor.constraintEqualToAnchor(viewController.view.topAnchor).active = true
//        viewController.view1.topAnchor.constraintEqualToAnchor(viewController.scrollView.topAnchor).active = true
//        viewController.view1.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view1.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator1.topAnchor.constraintEqualToAnchor(viewController.view1.bottomAnchor).active = true
//        viewController.separator1.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator1.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view2.topAnchor.constraintEqualToAnchor(viewController.separator1.bottomAnchor).active = true
//        viewController.view2.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view2.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator2.topAnchor.constraintEqualToAnchor(viewController.view2.bottomAnchor).active = true
//        viewController.separator2.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator2.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view3.topAnchor.constraintEqualToAnchor(viewController.separator2.bottomAnchor).active = true
//        viewController.view3.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view3.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator3.topAnchor.constraintEqualToAnchor(viewController.view3.bottomAnchor).active = true
//        viewController.separator3.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator3.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view4.topAnchor.constraintEqualToAnchor(viewController.separator3.bottomAnchor).active = true
//        viewController.view4.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view4.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator4.topAnchor.constraintEqualToAnchor(viewController.view4.bottomAnchor).active = true
//        viewController.separator4.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator4.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view5.topAnchor.constraintEqualToAnchor(viewController.separator4.bottomAnchor).active = true
//        viewController.view5.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view5.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator5.topAnchor.constraintEqualToAnchor(viewController.view5.bottomAnchor).active = true
//        viewController.separator5.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator5.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view6.topAnchor.constraintEqualToAnchor(viewController.separator5.bottomAnchor).active = true
//        viewController.view6.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view6.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator6.topAnchor.constraintEqualToAnchor(viewController.view6.bottomAnchor).active = true
//        viewController.separator6.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator6.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view7.topAnchor.constraintEqualToAnchor(viewController.separator6.bottomAnchor).active = true
//        viewController.view7.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view7.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator7.topAnchor.constraintEqualToAnchor(viewController.view7.bottomAnchor).active = true
//        viewController.separator7.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator7.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view8.topAnchor.constraintEqualToAnchor(viewController.separator7.bottomAnchor).active = true
//        viewController.view8.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view8.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator8.topAnchor.constraintEqualToAnchor(viewController.view8.bottomAnchor).active = true
//        viewController.separator8.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator8.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view9.topAnchor.constraintEqualToAnchor(viewController.separator8.bottomAnchor).active = true
//        viewController.view9.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view9.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator9.topAnchor.constraintEqualToAnchor(viewController.view9.bottomAnchor).active = true
//        viewController.separator9.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator9.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view10.topAnchor.constraintEqualToAnchor(viewController.separator9.bottomAnchor).active = true
//        viewController.view10.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view10.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator10.topAnchor.constraintEqualToAnchor(viewController.view10.bottomAnchor).active = true
//        viewController.separator10.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator10.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view11.topAnchor.constraintEqualToAnchor(viewController.separator10.bottomAnchor).active = true
//        viewController.view11.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view11.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator11.topAnchor.constraintEqualToAnchor(viewController.view11.bottomAnchor).active = true
//        viewController.separator11.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator11.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view12.topAnchor.constraintEqualToAnchor(viewController.separator11.bottomAnchor).active = true
//        viewController.view12.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view12.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator12.topAnchor.constraintEqualToAnchor(viewController.view12.bottomAnchor).active = true
//        viewController.separator12.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator12.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view13.topAnchor.constraintEqualToAnchor(viewController.separator12.bottomAnchor).active = true
//        viewController.view13.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view13.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator13.topAnchor.constraintEqualToAnchor(viewController.view13.bottomAnchor).active = true
//        viewController.separator13.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator13.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view14.topAnchor.constraintEqualToAnchor(viewController.separator13.bottomAnchor).active = true
//        viewController.view14.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view14.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator14.topAnchor.constraintEqualToAnchor(viewController.view14.bottomAnchor).active = true
//        viewController.separator14.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator14.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view15.topAnchor.constraintEqualToAnchor(viewController.separator14.bottomAnchor).active = true
//        viewController.view15.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view15.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator15.topAnchor.constraintEqualToAnchor(viewController.view15.bottomAnchor).active = true
//        viewController.separator15.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator15.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view16.topAnchor.constraintEqualToAnchor(viewController.separator15.bottomAnchor).active = true
//        viewController.view16.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view16.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator16.topAnchor.constraintEqualToAnchor(viewController.view16.bottomAnchor).active = true
//        viewController.separator16.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator16.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view17.topAnchor.constraintEqualToAnchor(viewController.separator16.bottomAnchor).active = true
//        viewController.view17.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view17.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator17.topAnchor.constraintEqualToAnchor(viewController.view17.bottomAnchor).active = true
//        viewController.separator17.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator17.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view18.topAnchor.constraintEqualToAnchor(viewController.separator17.bottomAnchor).active = true
//        viewController.view18.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view18.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator18.topAnchor.constraintEqualToAnchor(viewController.view18.bottomAnchor).active = true
//        viewController.separator18.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator18.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view19.topAnchor.constraintEqualToAnchor(viewController.separator18.bottomAnchor).active = true
//        viewController.view19.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view19.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator19.topAnchor.constraintEqualToAnchor(viewController.view19.bottomAnchor).active = true
//        viewController.separator19.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator19.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view20.topAnchor.constraintEqualToAnchor(viewController.separator19.bottomAnchor).active = true
//        viewController.view20.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        viewController.view20.heightAnchor.constraintEqualToConstant(70).active = true
//        viewController.separator20.topAnchor.constraintEqualToAnchor(viewController.view20.bottomAnchor).active = true
//        viewController.separator20.heightAnchor.constraintEqualToConstant(1).active = true
//        viewController.separator20.widthAnchor.constraintEqualToAnchor(viewController.scrollView.widthAnchor).active = true
//        
//        viewController.loadingView.centerXAnchor.constraintEqualToAnchor(viewController.view.centerXAnchor).active = true
//        viewController.loadingView.centerYAnchor.constraintEqualToAnchor(viewController.view.centerYAnchor).active = true
//        viewController.loadingView.widthAnchor.constraintEqualToAnchor(viewController.view.widthAnchor, constant: -100).active = true
//        viewController.loadingView.heightAnchor.constraintEqualToConstant(100).active = true
//        
//        viewController.loadingIndicator.centerXAnchor.constraintEqualToAnchor(viewController.loadingLabel.centerXAnchor).active = true
//        viewController.loadingIndicator.centerYAnchor.constraintEqualToAnchor(viewController.loadingView.centerYAnchor, constant: -10).active = true
//        
//        viewController.loadingLabel.centerXAnchor.constraintEqualToAnchor(viewController.loadingView.centerXAnchor).active = true
//        viewController.loadingLabel.centerYAnchor.constraintEqualToAnchor(viewController.loadingView.centerYAnchor, constant: 25).active = true
//        viewController.loadingLabel.heightAnchor.constraintEqualToConstant(25).active = true
//        
//        viewController.userPhoto1.leftAnchor.constraintEqualToAnchor(viewController.view1.leftAnchor, constant: 10).active = true
//        viewController.userPhoto1.centerYAnchor.constraintEqualToAnchor(viewController.view1.centerYAnchor).active = true
//        viewController.userPhoto1.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto1.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto2.leftAnchor.constraintEqualToAnchor(viewController.view2.leftAnchor, constant: 10).active = true
//        viewController.userPhoto2.centerYAnchor.constraintEqualToAnchor(viewController.view2.centerYAnchor).active = true
//        viewController.userPhoto2.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto2.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto3.leftAnchor.constraintEqualToAnchor(viewController.view3.leftAnchor, constant: 10).active = true
//        viewController.userPhoto3.centerYAnchor.constraintEqualToAnchor(viewController.view3.centerYAnchor).active = true
//        viewController.userPhoto3.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto3.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto4.leftAnchor.constraintEqualToAnchor(viewController.view4.leftAnchor, constant: 10).active = true
//        viewController.userPhoto4.centerYAnchor.constraintEqualToAnchor(viewController.view4.centerYAnchor).active = true
//        viewController.userPhoto4.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto4.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto5.leftAnchor.constraintEqualToAnchor(viewController.view5.leftAnchor, constant: 10).active = true
//        viewController.userPhoto5.centerYAnchor.constraintEqualToAnchor(viewController.view5.centerYAnchor).active = true
//        viewController.userPhoto5.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto5.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto6.leftAnchor.constraintEqualToAnchor(viewController.view6.leftAnchor, constant: 10).active = true
//        viewController.userPhoto6.centerYAnchor.constraintEqualToAnchor(viewController.view6.centerYAnchor).active = true
//        viewController.userPhoto6.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto6.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto7.leftAnchor.constraintEqualToAnchor(viewController.view7.leftAnchor, constant: 10).active = true
//        viewController.userPhoto7.centerYAnchor.constraintEqualToAnchor(viewController.view7.centerYAnchor).active = true
//        viewController.userPhoto7.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto7.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto8.leftAnchor.constraintEqualToAnchor(viewController.view8.leftAnchor, constant: 10).active = true
//        viewController.userPhoto8.centerYAnchor.constraintEqualToAnchor(viewController.view8.centerYAnchor).active = true
//        viewController.userPhoto8.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto8.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto9.leftAnchor.constraintEqualToAnchor(viewController.view9.leftAnchor, constant: 10).active = true
//        viewController.userPhoto9.centerYAnchor.constraintEqualToAnchor(viewController.view9.centerYAnchor).active = true
//        viewController.userPhoto9.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto9.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto10.leftAnchor.constraintEqualToAnchor(viewController.view10.leftAnchor, constant: 10).active = true
//        viewController.userPhoto10.centerYAnchor.constraintEqualToAnchor(viewController.view10.centerYAnchor).active = true
//        viewController.userPhoto10.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto10.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto11.leftAnchor.constraintEqualToAnchor(viewController.view11.leftAnchor, constant: 10).active = true
//        viewController.userPhoto11.centerYAnchor.constraintEqualToAnchor(viewController.view11.centerYAnchor).active = true
//        viewController.userPhoto11.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto11.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto12.leftAnchor.constraintEqualToAnchor(viewController.view12.leftAnchor, constant: 10).active = true
//        viewController.userPhoto12.centerYAnchor.constraintEqualToAnchor(viewController.view12.centerYAnchor).active = true
//        viewController.userPhoto12.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto12.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto13.leftAnchor.constraintEqualToAnchor(viewController.view13.leftAnchor, constant: 10).active = true
//        viewController.userPhoto13.centerYAnchor.constraintEqualToAnchor(viewController.view13.centerYAnchor).active = true
//        viewController.userPhoto13.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto13.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto14.leftAnchor.constraintEqualToAnchor(viewController.view14.leftAnchor, constant: 10).active = true
//        viewController.userPhoto14.centerYAnchor.constraintEqualToAnchor(viewController.view14.centerYAnchor).active = true
//        viewController.userPhoto14.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto14.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto15.leftAnchor.constraintEqualToAnchor(viewController.view15.leftAnchor, constant: 10).active = true
//        viewController.userPhoto15.centerYAnchor.constraintEqualToAnchor(viewController.view15.centerYAnchor).active = true
//        viewController.userPhoto15.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto15.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto16.leftAnchor.constraintEqualToAnchor(viewController.view16.leftAnchor, constant: 10).active = true
//        viewController.userPhoto16.centerYAnchor.constraintEqualToAnchor(viewController.view16.centerYAnchor).active = true
//        viewController.userPhoto16.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto16.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto17.leftAnchor.constraintEqualToAnchor(viewController.view17.leftAnchor, constant: 10).active = true
//        viewController.userPhoto17.centerYAnchor.constraintEqualToAnchor(viewController.view17.centerYAnchor).active = true
//        viewController.userPhoto17.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto17.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto18.leftAnchor.constraintEqualToAnchor(viewController.view18.leftAnchor, constant: 10).active = true
//        viewController.userPhoto18.centerYAnchor.constraintEqualToAnchor(viewController.view18.centerYAnchor).active = true
//        viewController.userPhoto18.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto18.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto19.leftAnchor.constraintEqualToAnchor(viewController.view19.leftAnchor, constant: 10).active = true
//        viewController.userPhoto19.centerYAnchor.constraintEqualToAnchor(viewController.view19.centerYAnchor).active = true
//        viewController.userPhoto19.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto19.heightAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto20.leftAnchor.constraintEqualToAnchor(viewController.view20.leftAnchor, constant: 10).active = true
//        viewController.userPhoto20.centerYAnchor.constraintEqualToAnchor(viewController.view20.centerYAnchor).active = true
//        viewController.userPhoto20.widthAnchor.constraintEqualToConstant(50).active = true
//        viewController.userPhoto20.heightAnchor.constraintEqualToConstant(50).active = true
//        
//        
//        viewController.userName1.leftAnchor.constraintEqualToAnchor(viewController.userPhoto1.rightAnchor, constant: 10).active = true
//        viewController.userName1.centerYAnchor.constraintEqualToAnchor(viewController.view1.centerYAnchor).active = true
//        viewController.userName2.leftAnchor.constraintEqualToAnchor(viewController.userPhoto2.rightAnchor, constant: 10).active = true
//        viewController.userName2.centerYAnchor.constraintEqualToAnchor(viewController.view2.centerYAnchor).active = true
//        viewController.userName3.leftAnchor.constraintEqualToAnchor(viewController.userPhoto3.rightAnchor, constant: 10).active = true
//        viewController.userName3.centerYAnchor.constraintEqualToAnchor(viewController.view3.centerYAnchor).active = true
//        viewController.userName4.leftAnchor.constraintEqualToAnchor(viewController.userPhoto4.rightAnchor, constant: 10).active = true
//        viewController.userName4.centerYAnchor.constraintEqualToAnchor(viewController.view4.centerYAnchor).active = true
//        viewController.userName5.leftAnchor.constraintEqualToAnchor(viewController.userPhoto5.rightAnchor, constant: 10).active = true
//        viewController.userName5.centerYAnchor.constraintEqualToAnchor(viewController.view5.centerYAnchor).active = true
//        viewController.userName6.leftAnchor.constraintEqualToAnchor(viewController.userPhoto6.rightAnchor, constant: 10).active = true
//        viewController.userName6.centerYAnchor.constraintEqualToAnchor(viewController.view6.centerYAnchor).active = true
//        viewController.userName7.leftAnchor.constraintEqualToAnchor(viewController.userPhoto7.rightAnchor, constant: 10).active = true
//        viewController.userName7.centerYAnchor.constraintEqualToAnchor(viewController.view7.centerYAnchor).active = true
//        viewController.userName8.leftAnchor.constraintEqualToAnchor(viewController.userPhoto8.rightAnchor, constant: 10).active = true
//        viewController.userName8.centerYAnchor.constraintEqualToAnchor(viewController.view8.centerYAnchor).active = true
//        viewController.userName9.leftAnchor.constraintEqualToAnchor(viewController.userPhoto9.rightAnchor, constant: 10).active = true
//        viewController.userName9.centerYAnchor.constraintEqualToAnchor(viewController.view9.centerYAnchor).active = true
//        viewController.userName10.leftAnchor.constraintEqualToAnchor(viewController.userPhoto10.rightAnchor, constant: 10).active = true
//        viewController.userName10.centerYAnchor.constraintEqualToAnchor(viewController.view10.centerYAnchor).active = true
//        viewController.userName11.leftAnchor.constraintEqualToAnchor(viewController.userPhoto11.rightAnchor, constant: 10).active = true
//        viewController.userName11.centerYAnchor.constraintEqualToAnchor(viewController.view11.centerYAnchor).active = true
//        viewController.userName12.leftAnchor.constraintEqualToAnchor(viewController.userPhoto12.rightAnchor, constant: 10).active = true
//        viewController.userName12.centerYAnchor.constraintEqualToAnchor(viewController.view12.centerYAnchor).active = true
//        viewController.userName13.leftAnchor.constraintEqualToAnchor(viewController.userPhoto13.rightAnchor, constant: 10).active = true
//        viewController.userName13.centerYAnchor.constraintEqualToAnchor(viewController.view13.centerYAnchor).active = true
//        viewController.userName14.leftAnchor.constraintEqualToAnchor(viewController.userPhoto14.rightAnchor, constant: 10).active = true
//        viewController.userName14.centerYAnchor.constraintEqualToAnchor(viewController.view14.centerYAnchor).active = true
//        viewController.userName15.leftAnchor.constraintEqualToAnchor(viewController.userPhoto15.rightAnchor, constant: 10).active = true
//        viewController.userName15.centerYAnchor.constraintEqualToAnchor(viewController.view15.centerYAnchor).active = true
//        viewController.userName16.leftAnchor.constraintEqualToAnchor(viewController.userPhoto16.rightAnchor, constant: 10).active = true
//        viewController.userName16.centerYAnchor.constraintEqualToAnchor(viewController.view16.centerYAnchor).active = true
//        viewController.userName17.leftAnchor.constraintEqualToAnchor(viewController.userPhoto17.rightAnchor, constant: 10).active = true
//        viewController.userName17.centerYAnchor.constraintEqualToAnchor(viewController.view17.centerYAnchor).active = true
//        viewController.userName18.leftAnchor.constraintEqualToAnchor(viewController.userPhoto18.rightAnchor, constant: 10).active = true
//        viewController.userName18.centerYAnchor.constraintEqualToAnchor(viewController.view18.centerYAnchor).active = true
//        viewController.userName19.leftAnchor.constraintEqualToAnchor(viewController.userPhoto19.rightAnchor, constant: 10).active = true
//        viewController.userName19.centerYAnchor.constraintEqualToAnchor(viewController.view19.centerYAnchor).active = true
//        viewController.userName20.leftAnchor.constraintEqualToAnchor(viewController.userPhoto20.rightAnchor, constant: 10).active = true
//        viewController.userName20.centerYAnchor.constraintEqualToAnchor(viewController.view20.centerYAnchor).active = true
//        
//        
//        
//        viewController.indicator1.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto1.centerXAnchor).active = true
//        viewController.indicator1.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto1.centerYAnchor).active = true
//        viewController.indicator2.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto2.centerXAnchor).active = true
//        viewController.indicator2.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto2.centerYAnchor).active = true
//        viewController.indicator3.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto3.centerXAnchor).active = true
//        viewController.indicator3.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto3.centerYAnchor).active = true
//        viewController.indicator4.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto4.centerXAnchor).active = true
//        viewController.indicator4.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto4.centerYAnchor).active = true
//        viewController.indicator5.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto5.centerXAnchor).active = true
//        viewController.indicator5.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto5.centerYAnchor).active = true
//        viewController.indicator6.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto6.centerXAnchor).active = true
//        viewController.indicator6.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto6.centerYAnchor).active = true
//        viewController.indicator7.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto7.centerXAnchor).active = true
//        viewController.indicator7.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto7.centerYAnchor).active = true
//        viewController.indicator8.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto8.centerXAnchor).active = true
//        viewController.indicator8.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto8.centerYAnchor).active = true
//        viewController.indicator9.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto9.centerYAnchor).active = true
//        viewController.indicator9.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto9.centerXAnchor).active = true
//        viewController.indicator10.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto10.centerYAnchor).active = true
//        viewController.indicator10.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto10.centerXAnchor).active = true
//        viewController.indicator11.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto11.centerYAnchor).active = true
//        viewController.indicator11.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto11.centerXAnchor).active = true
//        viewController.indicator12.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto12.centerYAnchor).active = true
//        viewController.indicator12.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto12.centerYAnchor).active = true
//        viewController.indicator13.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto13.centerXAnchor).active = true
//        viewController.indicator13.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto13.centerYAnchor).active = true
//        viewController.indicator14.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto14.centerXAnchor).active = true
//        viewController.indicator14.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto14.centerYAnchor).active = true
//        viewController.indicator15.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto15.centerXAnchor).active = true
//        viewController.indicator15.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto15.centerYAnchor).active = true
//        viewController.indicator16.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto16.centerYAnchor).active = true
//        viewController.indicator16.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto16.centerXAnchor).active = true
//        viewController.indicator17.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto17.centerYAnchor).active = true
//        viewController.indicator17.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto17.centerXAnchor).active = true
//        viewController.indicator18.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto18.centerYAnchor).active = true
//        viewController.indicator18.centerXAnchor.constraintEqualToAnchor(viewController.userPhoto18.centerXAnchor).active = true
//        viewController.indicator19.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto19.centerYAnchor).active = true
//        viewController.indicator19.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto19.centerYAnchor).active = true
//        viewController.indicator20.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto20.centerYAnchor).active = true
//        viewController.indicator20.centerYAnchor.constraintEqualToAnchor(viewController.userPhoto20.centerYAnchor).active = true
//        
//        viewController.buyButtonbackground.bottomAnchor.constraintEqualToAnchor(viewController.view.bottomAnchor).active = true
//        viewController.buyButtonbackground.widthAnchor.constraintEqualToAnchor(viewController.view.widthAnchor).active = true
//        viewController.buyButtonbackground.heightAnchor.constraintEqualToConstant(64).active = true
//        
//        viewController.buyButton.centerYAnchor.constraintEqualToAnchor(viewController.buyButtonbackground.centerYAnchor).active = true
//        viewController.buyButton.centerXAnchor.constraintEqualToAnchor(viewController.buyButtonbackground.centerXAnchor).active = true
//        viewController.buyButton.widthAnchor.constraintEqualToAnchor(viewController.buyButtonbackground.widthAnchor, constant: -100).active = true
//        viewController.buyButton.heightAnchor.constraintEqualToConstant(40).active = true


        
        print(viewController.view.isAccessibilityElement)
        
    }
    
}