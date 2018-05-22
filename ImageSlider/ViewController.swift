//
//  ViewController.swift
//  ImageSlider
//
//  Created by 有本淳吾 on 2018/05/22.
//  Copyright © 2018年 有本淳吾. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let gesture = UIPanGestureRecognizer(target: self, action: #selector(tapAction))
//        gesture.minimumPressDuration = 0
        circle.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //表示されている画像のタップ座標用変数
    var tapPoint = CGPoint(x: 0, y: 0)
    //元の画像のタップ座標用変数
    var originalTapPoint = CGPoint(x: 0, y: 0)
    
    //画像のどこの座標をタップしたかを取得する関数
    @objc func tapAction(sender:UIPanGestureRecognizer){
        //ImageView上のタップ座標を取得
        tapPoint = sender.location(in: circle)
        
        //サイズの倍率を算出し、UIImage上でのタップ座標を求める
        originalTapPoint.x = (circle.image?.size.width)!/circle.frame.width * tapPoint.x
        originalTapPoint.y = (circle.image?.size.height)!/circle.frame.height * tapPoint.y
        
        print("\(tapPoint)")
        print("\(originalTapPoint)")

    }
}

