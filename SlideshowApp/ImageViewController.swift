//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 白樫芳昭 on 2019/07/20.
//  Copyright © 2019 yoshiaki.sjirakashi. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var kakudaiView: UIImageView!
    let images = ["1.jpg","2.jpg","3.jpg"]
    var gazouIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gazou:UIImage = UIImage(named: images[gazouIndex])!
        kakudaiView.image=gazou
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
