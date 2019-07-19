//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 白樫芳昭 on 2019/07/19.
//  Copyright © 2019 yoshiaki.sjirakashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slideShowImage: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var imageIndex = 0
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    var timer:Timer!
    let images = ["1.jpg","2.jpg","3.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let img:UIImage = UIImage(named: images[imageIndex])!
        slideShowImage.image=img
    }

    @IBAction func nextImage(_ sender: Any) {
        if imageIndex < 1 {
            imageIndex += 1
        } else if imageIndex < 2 {
            imageIndex += 1
        } else if imageIndex < 3 {
            imageIndex -= 2
        }
        let img:UIImage = UIImage(named: images[imageIndex])!
        slideShowImage.image=img
    }
   
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        let img:UIImage = UIImage(named: images[imageIndex])!
        slideShowImage.image=img
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        if imageIndex < 1 {
            imageIndex += 1
        } else if imageIndex < 2 {
            imageIndex += 1
        } else if imageIndex < 3 {
            imageIndex -= 2
        }
        let img:UIImage = UIImage(named: images[imageIndex])!
        slideShowImage.image=img
    }
    
    @IBAction func StartStop(_ sender: Any) {
    // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            prevButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            stopSlideShow()
        }
    }
    func stopSlideShow(){
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
        prevButton.isEnabled = true
        backButton.isEnabled = true
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
//何もしないで待つ
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        stopSlideShow()
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController = segue.destination as! ImageViewController
        // 遷移先のImageViewControllerで宣言しているgazouIndexに値を代入して渡す
        imageViewController.gazouIndex = imageIndex
    }
    
}

