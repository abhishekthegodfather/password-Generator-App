//
//  ViewController.swift
//  passwordMaker
//
//  Created by Cubastion on 27/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordAppLabel: UILabel!
    @IBOutlet weak var clearallbtn: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var generateBtn: UIButton!
    @IBOutlet weak var genratelabel: UILabel!
    @IBOutlet weak var copyBtn: UIButton!
    @IBOutlet weak var natureofpass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupvc()
    }
    
    func setupvc(){
        self.view.backgroundColor = .systemBackground
        self.passwordAppLabel.text = "Password Generator"
        self.passwordAppLabel.font = UIFont.systemFont(ofSize: 24)
        self.label1.text = "Length of Password (Default = 6)"
        self.label2.text = "Num of CAP Letter (Default = 1)"
        self.label3.text = "Num of SPL Letter (Default = 1)"
        self.clearallbtn.setTitle("Clear All", for: .normal)
        self.generateBtn.setTitle("Generate Password", for: .normal)
        self.copyBtn.setTitle("Tap to Copy Password", for: .normal)
        self.genratelabel.text = "Tap Generate Button for password"
        self.natureofpass.text = "It's Show after generation of password"
        self.clearallbtn.addTarget(self, action: #selector(clearAllFunc(_ :)), for: .touchUpInside)
        self.generateBtn.addTarget(self, action: #selector(generateAction(_ :)), for: .touchUpInside)
        self.copyBtn.addTarget(self, action: #selector(copyAction(_ :)), for: .touchUpInside)
        self.textfield1.keyboardType = .numberPad
        self.textfield2.keyboardType = .numberPad
        self.textfield3.keyboardType = .numberPad
    }
    
    @objc func clearAllFunc(_ sender: UIButton){
        self.textfield1.text = ""
        self.textfield2.text = ""
        self.textfield3.text = ""
        self.genratelabel.text = "Tap Generate Button for password"
        self.natureofpass.text = "It's Show after generation of password"
    }
    
    @objc func generateAction(_ sender: UIButton){
        self.validateThing()
    }
    
    func validateThing(){
        let lbl1 = Int(textfield1.text!) ?? 0
        let lbl2 = Int(textfield2.text!) ?? 0
        let lbl3 = Int(textfield3.text!) ?? 0
        
        if lbl1 == 0 {
            simpleAlert(msg: "password length is 0", title: "Incorrect Format")
        }else if lbl2 > lbl1 || lbl3 > lbl1 {
            simpleAlert(msg: "put proper value", title: "Incorrect Format")
        }else{
            if lbl1 == 0 && lbl2 == 0 && lbl3 == 0 {
                simpleAlert(msg: "put proper value", title: "Incorrect Format")
            }else{
                if textfield1.text!.count <= 6 && textfield2.text!.count <= 1 && textfield3.text!.count <= 1{
                    self.simpleAlert(msg: "Creating password of length 6", title: "Default password making")
                    self.generateThing()
                }
            }
        }
    }
    
    func generateThing(){
        let lbl1 = Int(textfield1.text!)
        let lbl2 = Int(textfield2.text!)
        let lbl3 = Int(textfield3.text!)
        let result = passGen(lbl1!, lbl3!, lbl2!)
        self.genratelabel.text = result
        let natureRes = printStrongNess(result)
        self.natureofpass.text = "Nature of password: \(natureRes)"
    }
    
    func simpleAlert(msg: String, title: String){
        let createAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        self.present(createAlert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                createAlert.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func copyAction(_ sender: UIButton){
        let getPass = self.genratelabel.text
        if getPass != "Tap Generate Button for password"{
            UIPasteboard.general.string = getPass
        }
    }
}



