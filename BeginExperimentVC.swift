//
//  BeginExperimentVC.swift
//  psychicTest
//
//  Created by Muhammad Noaman on 16/07/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class BeginExperimentVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var ageError: UILabel!
    @IBOutlet weak var secondNameError: UILabel!
    @IBOutlet weak var firstNameError: UILabel!
    @IBOutlet weak var preferSelected: UILabel!
    @IBOutlet weak var femaleSwitch: UISwitch!
    @IBOutlet weak var maleSwitch: UISwitch!
    @IBOutlet weak var preferDataPicker: UIPickerView!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var secondNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    var type = ["Male/Female", "Male/Male"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        preferDataPicker.dataSource = self
        preferDataPicker.delegate = self
        firstNameTF.delegate = self
        secondNameTF.delegate = self
        ageTF.delegate = self
        let tapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BeginExperimentVC.dismissKeyboard))
        view.addGestureRecognizer(tapped)
        let tap = UITapGestureRecognizer(target: self, action: #selector(BeginExperimentVC.tapFunction))
        preferSelected.isUserInteractionEnabled = true
        preferSelected.addGestureRecognizer(tap)
        firstNameError.isHidden = true
        secondNameError.isHidden = true
        ageError.isHidden = true
        
        
    }
    
    // MARK: - Gender Selection

    @IBAction func switchSelected(_ sender: UISwitch) {
       
        switch sender {
            
            case maleSwitch:
                print ("Male selected")
                femaleSwitch.isOn = false
                //femaleSwitch.isEnabled = false
            
            case femaleSwitch:
                print ("Female selected")
                maleSwitch.isOn = false
                //maleSwitch.isEnabled = false
            
            default:
                break
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextField Empty Check
    
    @IBAction func beginExperimentBtn(_ sender: UIButton) {
        if firstNameTF.text != "" && secondNameTF.text != "" && ageTF.text != "" {
            if preferSelected.text == ""{
                preferSelected.text = "Male/Female"
                preferDataPicker.isHidden = true
            }
        }
        
        if (firstNameTF.text == "" && secondNameTF.text == "" && ageTF.text == "") {
            firstNameError.isHidden = false
            secondNameError.isHidden = false
            ageError.isHidden = false
            
            
        }else {
            
            performSegue(withIdentifier: "beginExperimentSegue", sender: sender)
        }
        
        
        
    }
    
    // MARK: - DataPicker Configuration
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        preferSelected.isHidden = false
        preferDataPicker.isHidden = true
        preferSelected.text = type[row]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - TextField Empty Error Check
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if firstNameTF.text != "" {
            firstNameError.isHidden = true
        }
        if secondNameTF.text != "" {
            secondNameError.isHidden = true
        }
        if ageTF.text != "" {
            ageError.isHidden = true
        }
        
    }
    // MARK: - Keyboard Dismiss
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.firstNameTF.resignFirstResponder()
        self.secondNameTF.resignFirstResponder()
        self.ageTF.resignFirstResponder()
        return true
    }
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    // MARK: - What you prefer Lable Set
    
    func tapFunction(sender:UITapGestureRecognizer) {
        preferDataPicker.isHidden = false
        preferSelected.isHidden = true
    }
    
  /*  func checkPreviousTextField(value: Int) {
        if value == 1 {
            if firstNameTF.text != ""{
                firstNameError.isHidden = true
            }
        }else if value == 2 {
            if secondNameTF.text != ""{
                secondNameError.isHidden = true
            }
        }
    }
  */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
