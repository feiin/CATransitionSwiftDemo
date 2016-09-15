//
//  ViewController.swift
//  CATransitionSwiftDemo
//
//  Created by yangyin on 14/12/26.
//  Copyright (c) 2014年 swiftmi. All rights reserved.
//

import UIKit


enum AnimationType:Int {
    case fade = 1,                   //淡入淡出
    push,                       //推挤
    reveal,                     //揭开
    moveIn,                     //覆盖
    cube,                       //立方体
    suckEffect,                 //吮吸
    oglFlip,                    //翻转
    rippleEffect,               //波纹
    pageCurl,                   //翻页
    pageUnCurl,                 //反翻页
    cameraIrisHollowOpen,       //开镜头
    cameraIrisHollowClose,      //关镜头
    curlDown,                   //下翻页
    curlUp,                     //上翻页
    flipFromLeft,               //左翻转
    flipFromRight             //右翻转
    
}

class ViewController: UIViewController {

    let duration = 0.7
    
    let image1 = "01.jpg"
    let image2 = "02.jpg"
    
    var imageType = 0
    
    var _subtype = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addBgImageWithImageName(image2)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapButton(_ sender: AnyObject) {
        
        let button = sender as! UIButton
        
        let animationType = AnimationType(rawValue: button.tag)!
        
        
        var subTypeString:String
        
        switch(_subtype){
            
        case 0:
            subTypeString = kCATransitionFromLeft
        case 1:
            subTypeString = kCATransitionFromBottom
        case 2:
            subTypeString = kCATransitionFromRight
        case 3:
            subTypeString = kCATransitionFromTop
        default:
             subTypeString = kCATransitionFromLeft
            
        }
        
        _subtype += 1
        
        if(_subtype > 3){
            
            _subtype = 0
        }
        
        switch(animationType){
        case .fade:
            self.transitionWithType(kCATransitionFade, withSubType: subTypeString, forView: self.view)
          
        case .push:
            self.transitionWithType(kCATransitionPush, withSubType: subTypeString, forView: self.view)
        case .reveal:
            self.transitionWithType(kCATransitionReveal, withSubType: subTypeString, forView: self.view)
        case .moveIn:
            self.transitionWithType(kCATransitionMoveIn, withSubType: subTypeString, forView: self.view)
           
            
        case .cube:
            self.transitionWithType("cube", withSubType: subTypeString, forView: self.view)
            
        case .suckEffect:
            self.transitionWithType("suckEffect", withSubType: subTypeString, forView: self.view)
            
        case .oglFlip:
            self.transitionWithType("oglFlip", withSubType: subTypeString, forView: self.view)
            
        case .rippleEffect:
            self.transitionWithType("rippleEffect", withSubType: subTypeString, forView: self.view)
            
        case .pageCurl:
            self.transitionWithType("pageCurl", withSubType: subTypeString, forView: self.view)
            
        case .pageUnCurl:
            self.transitionWithType("pageUnCurl", withSubType: subTypeString, forView: self.view)
         
            
        case .cameraIrisHollowOpen:
            self.transitionWithType("cameraIrisHollowOpen", withSubType: subTypeString, forView: self.view)
        case .cameraIrisHollowClose:
            self.transitionWithType("cameraIrisHollowClose", withSubType: subTypeString, forView: self.view)
            
        case .curlDown:
            
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.curlDown)
           
        case .curlUp:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.curlUp)
            
        case .flipFromLeft:
      
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.flipFromLeft)
            

            
        case .flipFromRight:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.flipFromRight)
            
        }
        
        if (imageType == 0) {
            self.addBgImageWithImageName(image1)
            imageType = 1
        }
        else
        {
            self.addBgImageWithImageName(image2)
            imageType = 0
        }

    }

    
    // MARK: CATransition动画实现
    func transitionWithType(_ type:String,withSubType subType:String,forView view:UIView){
        
        //创建CATransition对象
        let animation = CATransition()
        
         //设置运动时间
        animation.duration = duration
        
        //设置运动type
        animation.type = type;
        
        if (!subType.isEmpty) {
            
            //设置子类
            animation.subtype = subType;
        }
        
        //设置运动速度
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        view.layer.add(animation, forKey: "animation")
        
    }
    
    // MARK: UIView实现动画
    func animationWithView(_ view:UIView,withAnimationTransition transition:UIViewAnimationTransition){
        
        UIView.animate(withDuration: duration, animations: {
            
            UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
            UIView.setAnimationTransition(transition, for: view, cache: true)
        
        })
    }
    
     // MARK: 给View添加背景图
    func addBgImageWithImageName(_ imageName:String){
        
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: imageName)!)
        
    }


}

