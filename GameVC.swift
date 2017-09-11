//
//  GameVC.swift
//  psychicTest
//
//  Created by Muhammad Noaman on 13/07/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire

class GameVC: UIViewController {
    
    @IBOutlet weak var tapCutainLable: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightTap: UIButton!
    @IBOutlet weak var leftTap: UIButton!
    var imageArray = [String]()
    var grayImageCount = 0
    var imageCount = 0
    var heroPick = 0
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //leftImage.isHidden = true
        
        // Do any additional setup after loading the view.
        getHero()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Right Button
    
    @IBAction func button0(_ sender: UIButton) {
        randomImage(value: heroPick)

    }
    
    // MARK: - Left Button
    
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
        imageCount = imageCount + 1
        print ("imagecount value \(imageCount)")
        if value == 1 {
            UIView.animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
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
            }
            
            if (imageCount == 36)
            {
                print ("36 Images Displayed")
                backImage.image = UIImage(named: "Relaxation")
                rightTap.isHidden = true
                leftTap.isHidden = true
                print ("grey Image Count:\(grayImageCount)")
                print ("image count: \(imageCount)")
                let resultInPercent = Int(resultInPercentage(value: grayImageCount))
                
                
                let alert = UIAlertController(title: "Result", message: "Your Score is \(resultInPercent)%", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { _ in
                    self.performSegue(withIdentifier: "goBack", sender: nil)
                    let sex1 =  (self.defaults.value(forKey: "sex")!)
                    let firstName1 = (self.defaults.value(forKey: "firstName")!)
                    let lastName1 = (self.defaults.value(forKey: "lastName")!)
                    let age1 = (self.defaults.value(forKey: "age")!)
                    self.pushData(sex: sex1 as! String, firstName: firstName1 as! String, lastName: lastName1 as! String, age: age1 as! String, score: resultInPercent)
                }))
                self.present(alert, animated: true, completion: nil)
  
            }else {
                
                backImage.image = UIImage(named: imageName)
                rightTap.isHidden = true
                leftTap.isHidden = true
                
                self.perform(#selector(HideImage), with: backImage, afterDelay: 2.0)
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
    
    // MARK: - Saving Data
    func pushData(sex: String, firstName: String, lastName: String, age: String, score: Int) {
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        var score1 = String(describing: score)

        let parameters: Parameters = [
            "fname": firstName,
            "lname": lastName,
            "age": age,
            "result": score1,
            "arotic": grayImageCount,
            "nonarotic": (imageCount - grayImageCount - 1)
        ]
        
        //        print(parameters)
        
        Alamofire.request("http://swatshawls.com/psychic/Apis/savedata", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil ).responseJSON{ response in
            switch response.result {
            case .success:
                print("0: \(response)")
                if let value = response.result.value {
                    print (value)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Calculate Result
    
    func resultInPercentage(value: Int) -> Double {
        
        let x : Double = Double (36 - value)
        return Double((x / 36 ) * 100)
    }
    
    // MARK: - Image Processing
    
    func HideImage(){
       // self.rightImage.isHidden = false
       // self.leftImage.isHidden = false
        
        let screenSize: CGRect = UIScreen.main.bounds
//        let screenWidth = screenSize.width
        var screenHeight = screenSize.height
        print (screenHeight)
        if screenHeight == 736 {
            screenHeight = 340
        } else if screenHeight == 667 {
            screenHeight = 315
        } else {
            screenHeight = 275
        }
        let button = leftTap.frame.width
        print (button)
        
        
        UIView.animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.rightImage.alpha = 1
            self.leftImage.alpha = 1
            self.rightImage.center.y = +350
            self.leftImage.center.y = +screenHeight
        }, completion: {_ in
            self.tapCutainLable.isHidden = false
            self.rightTap.isHidden = false
            self.leftTap.isHidden = false
        })

    }

}
