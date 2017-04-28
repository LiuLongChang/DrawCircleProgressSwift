//
//  PiCircularProgressView.swift
//  TestCircleDemo
//
//  Created by zzzsw on 2017/4/27.
//  Copyright © 2017年 zzzsw. All rights reserved.
//

import UIKit

extension PiCircularProgressView{
    
    func Degrees_To_Radians(angle:CGFloat)->CGFloat{
        return angle / 180.0 * CGFloat.pi
    }

}


class PiCircularProgressView: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var _progress : Double! = 0
    var progress : Double!{
        set{
            _progress = min(1.0, max(0, newValue))
            self.setNeedsDisplay()
        }
        get{
            return _progress
        }
    }
    //Should be Bools, but iOS doesn‘t allow as UI_APPERANCE_SELECTOR

    var _showText : Bool!
    var showText : Bool! {
        set{
            _showText = newValue
            self.setNeedsDisplay()
        }
        get{
            return _showText
        }
    }


    var _roundHead : Bool!
    var roundedHead : Bool!{
        set{
            _roundHead = newValue
            self.setNeedsDisplay()
        }
        get{
            return _roundHead;
        }
    }


    var _showShadow : Bool!
    var showShadow : Bool!{
        set{
            _showText = newValue
            self.setNeedsDisplay()
        }
        get{
            return _showText;
        }
    }


    var _thicknessRatio : CGFloat!
    var thicknessRatio : CGFloat!{
        set{
            _thicknessRatio = newValue
            self.setNeedsDisplay()
        }
        get{
            return _thicknessRatio
        }
    }


    var _innerBackgroundColor : UIColor!
    var innerBackgroundColor : UIColor!{
        set{
            _innerBackgroundColor = newValue
            self.setNeedsDisplay()
        }
        get{
            return _innerBackgroundColor
        }
    }


    var _outerBackgroundColor : UIColor!
    var outerBackgroundColor : UIColor!{
        set{
            _outerBackgroundColor = newValue
            self.setNeedsDisplay()
        }
        get{
            return _outerBackgroundColor
        }
    }


    var _textColor : UIColor!
    var textColor : UIColor!{
        set{
            _textColor = newValue
            self.setNeedsDisplay()
        }
        get{
            return _textColor
        }
    }




    //var font : UIFont!





    var _progressFillColor : UIColor!
    var progressFillColor : UIColor!{
        set{
            _progressFillColor = newValue
            self.setNeedsDisplay()
        }
        get{
            return _progressFillColor
        }
    }


    var _progressTopGradientColor : UIColor!
    var progressTopGradientColor : UIColor!{
        set{
            _progressFillColor = newValue
            self.setNeedsDisplay()
        }
        get{
            return _progressFillColor;
        }
    }




    var _progressBottomGradientColor : UIColor!
    var progressBottomGradientColor : UIColor!{
        set{
          _progressBottomGradientColor = newValue
          self.setNeedsDisplay()
        }
        get{
            return _progressBottomGradientColor
        }
    }



    var centerCircle : UIView! = nil;
    var selfCenter : CGPoint! = nil;


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.showText = true
        self.roundedHead = true
        self.showShadow = true

        self.thicknessRatio = 0.37

        self.innerBackgroundColor = UIColor.clear
        self.outerBackgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        //self.outerBackgroundColor = UIColor.red

        self.textColor = UIColor.black
        self.progressFillColor = UIColor.blue


        self.progressTopGradientColor = UIColor.green
        self.progressBottomGradientColor = UIColor.init(red: 114/255.0, green: 174/255.0, blue: 235/255.0, alpha: 1.0)

        self.progressBottomGradientColor = UIColor.red

        self.backgroundColor = UIColor.clear
        //121   40
        //74    54
        self.selfCenter = CGPoint.init(x: frame.minX + frame.width/2, y: frame.minY + frame.height/2)
        self.center = self.selfCenter;
    }


    func makeCenterView(){

        let widthOfCenter = frame.size.width/74.0*54.0
        let heightOfCenter = frame.size.width/74.0*54.0


        let centerView = UIView.init(frame: .zero);
        self.superview?.addSubview(centerView);centerView.layer.cornerRadius = widthOfCenter/2;
        centerView.backgroundColor = UIColor.init(white: 0.8, alpha: 0.8);

        centerView.center = CGPoint.init(x: self.selfCenter.x, y: self.selfCenter.y);
        centerView.isUserInteractionEnabled = false;

        centerView.bounds = CGRect.init(x: 0, y: 0, width: widthOfCenter, height: heightOfCenter);
        self.centerCircle = centerView;

    }

    

    func rescureAction(){

        UIView.animate(withDuration: 0.3, animations: {

            self.bounds = CGRect(x:0, y: 0, width: 74.0, height: 74.0)

            let widthOfCenter = 54
            let heightOfCenter = 54

            self.centerCircle.bounds = CGRect.init(x: 0, y: 0, width: widthOfCenter, height: heightOfCenter);
            self.centerCircle.layer.cornerRadius = self.centerCircle.bounds.width/2

            
        }) { (finish) in
            
            
        }

    }

    func beginChange(){

        UIView.animate(withDuration: 0.1, animations: { 



            self.bounds = CGRect(x:0, y: 0, width: 121.0, height: 121.0)

            let widthOfCenter = 40.0
            let heightOfCenter = 40.0

            self.centerCircle.bounds = CGRect.init(x: 0, y: 0, width: widthOfCenter, height: heightOfCenter);
            self.centerCircle.layer.cornerRadius = self.centerCircle.bounds.width/2;


        }) { (finish) in


        }

    }


    override func draw(_ rect: CGRect) {
        
        let progressAngle = progress * 360.0 - 90;
        let center = CGPoint.init(x: rect.size.width/2.0, y: rect.size.height / 2.0)
        let radius = min(rect.size.width, rect.size.height)/2.0

        var square : CGRect!
        if rect.size.width > rect.size.height {
            square = CGRect.init(x: rect.size.width/2 - rect.size.height/2, y: 0, width: rect.size.height, height: rect.size.height)
        }else{
            square = CGRect.init(x: 0.0, y: rect.size.height/2 - rect.size.width/2.0, width: rect.size.width, height: rect.size.width)
        }


        let circleWidth = radius * thicknessRatio

        let context = UIGraphicsGetCurrentContext()
        
        context?.saveGState()
        if innerBackgroundColor != nil {
            //Fill innerCircle with innerBackgroundColor
            let innerCircle = UIBezierPath.init(arcCenter: center, radius: radius - circleWidth, startAngle: CGFloat(2*Double.pi), endAngle: 0.0, clockwise: true)
            innerBackgroundColor.setFill()
            innerCircle.fill()
        }

        if outerBackgroundColor != nil {
            //Fill outerCircle with outerBackgroundColor
            let outerCircle = UIBezierPath.init(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
            outerCircle.addArc(withCenter: center, radius: radius - circleWidth, startAngle: CGFloat(2*Double.pi), endAngle: 0.0, clockwise: true)
            outerBackgroundColor.setFill()
            outerCircle.fill()
        }


        if showShadow != nil {
            //Draw shadows
            let locations = [CGFloat(0.0),CGFloat(0.33),CGFloat(0.66),CGFloat(1.0)]
            let gredientColors = [UIColor.init(white: 0.3, alpha: 0.5).cgColor,
            UIColor.init(white: 0.9, alpha: 0.0).cgColor,
            UIColor.init(white: 0.9, alpha: 0.0).cgColor,
            UIColor.init(white: 0.3, alpha: 0.5).cgColor,]

            let rgb = CGColorSpaceCreateDeviceRGB()
            let gradient = CGGradient.init(colorsSpace: rgb, colors: gredientColors as CFArray, locations: locations)

            context?.drawRadialGradient(gradient!, startCenter: center, startRadius: radius-circleWidth, endCenter: center, endRadius: radius, options:CGGradientDrawingOptions.drawsBeforeStartLocation)
        }





        if showText != nil && textColor != nil {

//            let strUse = String.init(format: "%.02f", progress*100.0)
//            let progressString = strUse;let fontSize : CGFloat = 10;
//            var expectedSize = (progressString as NSString).size(attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: fontSize)]);
//
//            expectedSize = NSString(string: progressString).size(attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: fontSize)])
//
//            let origin = CGPoint.init(x: center.x - expectedSize.width / 2.0, y: center.y - expectedSize.height / 2.0)
//
//            textColor.setFill()
//
//            NSString(string: progressString).draw(at: origin, withAttributes: [NSFontAttributeName:UIFont.systemFont(ofSize: fontSize)])

        }

        let path = UIBezierPath()
        path.append(UIBezierPath.init(arcCenter: center, radius: radius, startAngle: Degrees_To_Radians(angle: -90), endAngle: Degrees_To_Radians(angle: CGFloat(progressAngle)), clockwise: true))

        if roundedHead == true {

            var point : CGPoint! = CGPoint();

            point.x = cos(Degrees_To_Radians(angle: CGFloat(progressAngle)))*(radius - circleWidth/2) + center.x
                
            point.y = sin(Degrees_To_Radians(angle: CGFloat(progressAngle))) * (radius-circleWidth/2) + center.y;
            
            path.addArc(withCenter: point, radius: circleWidth/2, startAngle: Degrees_To_Radians(angle: CGFloat(progressAngle)), endAngle: Degrees_To_Radians(angle: CGFloat(270.0)+CGFloat(progressAngle)-CGFloat(90)), clockwise: true)
            
        }

        
        
        let angle1 = Degrees_To_Radians(angle: CGFloat(progressAngle))
        let angle2 = Degrees_To_Radians(angle: CGFloat(-90))

        path.addArc(withCenter: center, radius: radius - circleWidth, startAngle: CGFloat(angle1), endAngle: CGFloat(angle2), clockwise: false)


        if(roundedHead == true){
            var point : CGPoint! = CGPoint()
            point.x = cos(Degrees_To_Radians(angle: -90)) * (radius - circleWidth/2) + center.x
            point.y = sin(Degrees_To_Radians(angle: -90))*(radius - circleWidth/2) + center.y
            let angle1 = Degrees_To_Radians(angle: 90)
            let angle2 = Degrees_To_Radians(angle: -90)
            path.addArc(withCenter: point, radius: circleWidth/2, startAngle: CGFloat(angle1), endAngle: CGFloat(angle2), clockwise: false)
        }
        path.close()


        if (progressFillColor != nil) {
            progressFillColor.setFill()
            path.fill()
        }else if((progressTopGradientColor != nil) && (progressBottomGradientColor != nil)){

            path.addClip()
            let backgroundColors = [progressTopGradientColor.cgColor,progressBottomGradientColor.cgColor]

            let backgroundColorLocations = [CGFloat(0.0),CGFloat(1.0)]
            let rgb = CGColorSpaceCreateDeviceRGB()
            let backgroundGradient = CGGradient.init(colorsSpace: rgb, colors: backgroundColors as CFArray, locations: backgroundColorLocations)

            context?.drawLinearGradient(backgroundGradient!, start: CGPoint.init(x: 0.0, y: square.origin.y), end: CGPoint.init(x: 0.0, y: square.size.height), options: CGGradientDrawingOptions(rawValue:0))
        }

        context?.restoreGState()

    }




    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    


}
