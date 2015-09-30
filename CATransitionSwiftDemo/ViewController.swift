//
//  ViewController.swift
//  CATransitionSwiftDemo
//
//  Created by yangyin on 14/12/26.
//  Copyright (c) 2014年 swiftmi. All rights reserved.
//

import UIKit


enum AnimationType:Int {
    case Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight             //右翻转
    
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
    
    
    @IBAction func tapButton(sender: AnyObject) {
        
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
        case .Fade:
            self.transitionWithType(kCATransitionFade, withSubType: subTypeString, forView: self.view)
          
        case .Push:
            self.transitionWithType(kCATransitionPush, withSubType: subTypeString, forView: self.view)
        case .Reveal:
            self.transitionWithType(kCATransitionReveal, withSubType: subTypeString, forView: self.view)
        case .MoveIn:
            self.transitionWithType(kCATransitionMoveIn, withSubType: subTypeString, forView: self.view)
           
            
        case .Cube:
            self.transitionWithType("cube", withSubType: subTypeString, forView: self.view)
            
        case .SuckEffect:
            self.transitionWithType("suckEffect", withSubType: subTypeString, forView: self.view)
            
        case .OglFlip:
            self.transitionWithType("oglFlip", withSubType: subTypeString, forView: self.view)
            
        case .RippleEffect:
            self.transitionWithType("rippleEffect", withSubType: subTypeString, forView: self.view)
            
        case .PageCurl:
            self.transitionWithType("pageCurl", withSubType: subTypeString, forView: self.view)
            
        case .PageUnCurl:
            self.transitionWithType("pageUnCurl", withSubType: subTypeString, forView: self.view)
         
            
        case .CameraIrisHollowOpen:
            self.transitionWithType("cameraIrisHollowOpen", withSubType: subTypeString, forView: self.view)
        case .CameraIrisHollowClose:
            self.transitionWithType("cameraIrisHollowClose", withSubType: subTypeString, forView: self.view)
            
        case .CurlDown:
            
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.CurlDown)
           
        case .CurlUp:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.CurlUp)
            
        case .FlipFromLeft:
      
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.FlipFromLeft)
            

            
        case .FlipFromRight:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.FlipFromRight)
            
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
    func transitionWithType(type:String,withSubType subType:String,forView view:UIView){
        
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
        
        view.layer.addAnimation(animation, forKey: "animation")
        
    }
    
    // MARK: UIView实现动画
    func animationWithView(view:UIView,withAnimationTransition transition:UIViewAnimationTransition){
        
        UIView.animateWithDuration(duration, animations: {
            
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            UIView.setAnimationTransition(transition, forView: view, cache: true)
        
        })
    }
    
     // MARK: 给View添加背景图
    func addBgImageWithImageName(imageName:String){
        
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: imageName)!)
        
    }


}

