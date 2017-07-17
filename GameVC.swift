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
    var grayImageCount = 0
    var heroPick = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getHero()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button0(_ sender: UIButton) {
        randomImage(value: heroPick)

    }
    
 
    
    @IBAction func button1(_ sender: UIButton) {
        randomImage(value: heroPick)
    }

    
    // MARK: - Random Button Setup
    func getHero() {
        heroPick = Int(arc4random_uniform(2))
        print (heroPick)
    }
    
    
    // MARK: Random Image picker for imageView
    
    func randomImage(value: Int) {
        if value == 1 {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.rightImage.alpha = 1
                self.leftImage.alpha = 1
                self.rightImage.center.y = -350
                self.leftImage.center.y = -350
            }, completion: { _ in
                self.getHero()
            })
            tapCutainLable.isHidden = true
            
            
            let randomNum:Int = Int(arc4random_uniform(116))
            let imageName = "image_\(randomNum)"
            if imageArray.contains(imageName){
                
                return
                
            }else if (imageArray.count == 35) {
                print ("36 Images Displayed")
                backImage.image = UIImage(named: "Relaxation")
                rightTap.isHidden = true
                leftTap.isHidden = true
                print (grayImageCount)
                let resultInPercent = Int(resultInPercentage(value: grayImageCount))
                
                
                let alert = UIAlertController(title: "Result", message: "Your Score is \(resultInPercent)%", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { _ in
                    self.performSegue(withIdentifier: "goBack", sender: nil)
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
                
                
                
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
            }, completion: { _ in
                self.getHero()
            })
            
            tapCutainLable.isHidden = true
            backImage.image = UIImage(named:"GrayRec")
            grayImageCount += 1
            rightTap.isHidden = true
            leftTap.isHidden = true
            self.perform(#selector(HideImage), with: backImage, afterDelay: 2.0)
        }
    }
    
    func resultInPercentage(value: Int) -> Double {
        
        let x : Double = Double (36 - value)
        return Double((x / 36 ) * 100)
        
    
    }
    // MARK: - Image Processing
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
