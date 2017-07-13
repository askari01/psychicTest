//
//  GameVC.swift
//  psychicTest
//
//  Created by Muhammad Noaman on 13/07/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var gameScreen: UIImageView!
    @IBOutlet weak var rightTap: UIButton!
    @IBOutlet weak var leftTap: UIButton!
    let randomNum2:Int = Int(arc4random_uniform(2))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button0(_ sender: UIButton) {
        gameScreen.isHidden = true
        let randomNum:Int = Int(arc4random_uniform(116))
        let imageName = "image_\(randomNum)"
        backImage.image = UIImage(named: imageName)
        rightTap.isHidden = true
        leftTap.isHidden = true
        self.perform(#selector(HideImage), with: backImage, afterDelay: 1.0)
    }
    
    @IBAction func button1(_ sender: UIButton) {
        gameScreen.isHidden = true
        backImage.image = UIImage(named:"GrayRec")
        rightTap.isHidden = true
        leftTap.isHidden = true
        self.perform(#selector(HideImage), with: backImage, afterDelay: 1.0)
    }

    func HideImage(){
        self.gameScreen.isHidden = false
        rightTap.isHidden = false
        leftTap.isHidden = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
