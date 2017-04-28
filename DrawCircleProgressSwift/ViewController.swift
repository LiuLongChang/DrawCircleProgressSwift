//
//  ViewController.swift
//  DrawCircleProgressSwift
//
//  Created by 刘隆昌 on 17/4/27.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressV : PiCircularProgressView! = nil
    var time : Int = 0;
    var timer : Timer! = nil

    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.purple;
        // Do any additional setup after loading the view, typically from a nib.

        let progressView = PiCircularProgressView.init(frame: CGRect.init(x: 50, y: 200, width: 74, height: 74))
        self.view.addSubview(progressView)
        progressView.makeCenterView()
        self.progressV = progressView;
        progressView.thicknessRatio = 0.1;
        progressV.progress = 0.0;
        progressView.addGestureRecognizer(UILongPressGestureRecognizer.init(target: self, action: #selector(ViewController.longPressAction(_:))))
        

    }



    func longPressAction(_ gestureRecognizer:UILongPressGestureRecognizer){

        //let point = gestureRecognizer.location(in: self.progressV)

        switch gestureRecognizer.state {
        case .began:

            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true);
            self.progressV.beginChange()

        case .changed: break


        case .ended:

            self.timer.invalidate()
            progressV.progress = 0
            self.progressV.rescureAction()

        case .cancelled :

            self.timer.invalidate()
            progressV.progress = 0;
            self.progressV.rescureAction()

        default:
            break;
        }

    }




    func action(){
        time += 1;print("\(time)");
        progressV.progress = (progressV.progress + 0.001);
        if progressV.progress == 1.0 {
            self.timer.invalidate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

