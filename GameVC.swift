//
//  GameVC.swift
//  psychicTest
//
//  Created by Muhammad Noaman on 13/07/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var tapCutainLable: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightTap: UIButton!
    @IBOutlet weak var leftTap: UIButton!
    var imageArray = [String]()
    var imageCount = 0
    var heroButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button0(_ sender: UIButton) {
       // rightImage.isHidden = true
       // leftImage.isHidden = true
        
        randomImage(value: heroButton)
        
//        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
//            self.rightImage.alpha = 1
//            self.leftImage.alpha = 1
//            self.rightImage.center.y = -350
//            self.leftImage.center.y = -350
//        }, completion: nil)
//        tapCutainLable.isHidden = true
//        
//        
//        let randomNum:Int = Int(arc4random_uniform(116))
//        let imageName = "image_\(randomNum)"
//        if imageArray.contains(imageName){
//            
//            return
//         
//        }else if (imageArray.count == 36) {
//            print ("36 Images Displayed")
//            backImage.image = UIImage(named: "Relaxation")
//            
//        
//        }else {
//        
//            backImage.image = UIImage(named: imageName)
//            rightTap.isHidden = true
//            leftTap.isHidden = true
//            
//            self.perform(#selector(HideImage), with: backImage, afterDelay: 1.0)
//        }
//
//        imageArray.append(imageName)
//        
//        

    }
    
 
    
    @IBAction func button1(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
//            self.rightImage.alpha = 1
//            self.leftImage.alpha = 1
//            self.rightImage.center.y = -350
//            self.leftImage.center.y = -350
//        }, completion: nil)
//
//        tapCutainLable.isHidden = true
//        backImage.image = UIImage(named:"GrayRec")
//        rightTap.isHidden = true
//        leftTap.isHidden = true
//        self.perform(#selector(HideImage), with: backImage, afterDelay: 2.0)
    }

    func randomImage(value: Int) {
        if value == 1 {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.rightImage.alpha = 1
                self.leftImage.alpha = 1
                self.rightImage.center.y = -350
                self.leftImage.center.y = -350
            }, completion: nil)
            tapCutainLable.isHidden = true
            
            
            let randomNum:Int = Int(arc4random_uniform(116))
            let imageName = "image_\(randomNum)"
            if imageArray.contains(imageName){
                
                return
                
            }else if (imageArray.count == 36) {
                print ("36 Images Displayed")
                backImage.image = UIImage(named: "Relaxation")
                
                
            }else {
                
                backImage.image = UIImage(named: imageName)
                rightTap.isHidden = true
                leftTap.isHidden = true
                
                self.perform(#selector(HideImage), with: backImage, afterDelay: 1.0)
            }
            
            imageArray.append(imageName)
            
        } else {
            UIView.animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.rightImage.alpha = 1
                self.leftImage.alpha = 1
                self.rightImage.center.y = -350
                self.leftImage.center.y = -350
            }, completion: nil)
            
            tapCutainLable.isHidden = true
            backImage.image = UIImage(named:"GrayRec")
            rightTap.isHidden = true
            leftTap.isHidden = true
            self.perform(#selector(HideImage), with: backImage, afterDelay: 2.0)
        }
    }
    
    func HideImage(){
       // self.rightImage.isHidden = false
       // self.leftImage.isHidden = false
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.rightImage.alpha = 1
            self.leftImage.alpha = 1
            self.rightImage.center.y = +310
            self.leftImage.center.y = +310
        }, completion: nil)

        tapCutainLable.isHidden = false
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
