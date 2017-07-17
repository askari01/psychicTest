//
//  BeginExperimentVC.swift
//  psychicTest
//
//  Created by Muhammad Noaman on 16/07/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class BeginExperimentVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

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
        preferDataPicker.dataSource = self
        preferDataPicker.delegate = self
        firstNameTF.delegate = self
        secondNameTF.delegate = self
        ageTF.delegate = self
        

        // Do any additional setup after loading the view.
    }

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
    

    @IBAction func beginExperimentBtn(_ sender: UIButton) {
        if (firstNameTF.text != "" && secondNameTF.text != "" && ageTF.text != "" && preferSelected.text != "") {
            performSegue(withIdentifier: "beginExperimentSegue", sender: sender)
            

        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        preferDataPicker.isHidden = true
        preferSelected.text = type[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.firstNameTF.resignFirstResponder()
        self.secondNameTF.resignFirstResponder()
        self.ageTF.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
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
