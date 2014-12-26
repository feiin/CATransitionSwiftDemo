CATransitionSwiftDemo
=====================

Swift语言版本CALayer下的CATransition各种动画实现效果

实现的效果有



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


demo效果

![demo](./demo.gif)