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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let progressView = PiCircularProgressView.init(frame: CGRect.init(x: 50, y: 200, width: 300, height: 300))
        self.view.addSubview(progressView)
        self.progressV = progressView;
        
        progressView.thicknessRatio = 0.1
        
        
    
        let timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        timer.fire()

        
    }
    
    func action(){
    
        
        progressV.progress = (progressV.progress + 0.001);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

