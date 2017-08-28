//
//  keyboardViewController.swift
//  keyboard
//
//  Created by MC-MG57035 on 8/28/2560 BE.
//  Copyright © 2560 MC-MG57035. All rights reserved.
//

import UIKit

class keyboardViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Scrollview:UIScrollView?
    var isKeyboardShowing  = Bool()
    var invisButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func keyboardWillShow(note:NSNotification){
        if isKeyboardShowing {
            return
        }
        
        self.isKeyboardShowing = true
        var keyboardBounds:CGRect = note.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        
        keyboardBounds = self.view .convert(keyboardBounds, to: self.Scrollview)
        
        var keyboardSize:CGSize = keyboardBounds.size
        
        if keyboardSize.width < keyboardSize.height {
            let height = keyboardSize.height
            keyboardSize.height = keyboardSize.width
            keyboardSize.width = height
        }
        
        invisButton = UIButton.init(type: UIButtonType.custom)
        invisButton.addTarget(self, action: #selector(self.endEditNow), for: .touchUpInside)
        invisButton.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - keyboardBounds.size.height)
        self.view .addSubview(invisButton)
        
    }
    
    func keyboardWillHide(note:NSNotification){
        self.isKeyboardShowing = false
        var keyboardBounds:CGRect = note.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        
        keyboardBounds = self.view .convert(keyboardBounds, to: self.Scrollview)
        
        var keyboardSize:CGSize = keyboardBounds.size
        
        if keyboardSize.width < keyboardSize.height {
            let height = keyboardSize.height
            keyboardSize.height = keyboardSize.width
            keyboardSize.width = height
        }
        
        
        invisButton.removeFromSuperview()
        
    }
    
    func endEditNow(){
        self.view.endEditing(true)
        
    }
    
    
    //MARK textfielddelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.Scrollview?.setContentOffset(CGPoint(x:0, y: textField.frame.origin.y - textField.frame.size.height), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.Scrollview?.setContentOffset(CGPoint(x:0, y: textField.frame.origin.y - textField.frame.size.height), animated: true)
        //            self.Scrollview?.setContentOffset(CGPoint.zero, animated: true)
        
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        if textField == self.Mes_nametitletextfield {
        //            self.Mes_nametextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_nametextfield {
        //            self.Mes_surnametextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_surnametextfield{
        //            self.Mes_idcardtextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_idcardtextfield{
        //            self.Mes_teltextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_teltextfield{
        //            self.Mes_emailtextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_emailtextfield{
        //            self.Mes_address_hometextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_address_hometextfield{
        //            self.Mes_alleytextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_alleytextfield{
        //            self.Mes_roadtextfield?.becomeFirstResponder()
        //        }
        //        else if textField == self.Mes_roadtextfield{
        //            textField.resignFirstResponder()
        //        }
        //        else {
        textField.resignFirstResponder()
        //        }
        
        return true
    }
    
    //MARK number telephone and cedite
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textField {
            
            if textField.text?.characters.count == 2 && string.characters.count != 0 {
                textField.text = textField.text! + "_"
            }
            else if textField.text?.characters.count == 4 && string.characters.count == 0 {
                print("sadasdasd")
                textField.text = String(textField.text!.characters.dropLast())
            }
            else if textField.text?.characters.count == 6 && string.characters.count != 0 {
                textField.text = textField.text! + "-"
            }
            else if textField.text?.characters.count == 8 && string.characters.count == 0 {
                textField.text = String(textField.text!.characters.dropLast())
            }
            else if textField.text?.characters.count == 11 && string.characters.count != 0 {
                textField.text = textField.text! + "-"
            }
            else if textField.text?.characters.count == 13 && string.characters.count == 0{
                textField.text = String(textField.text!.characters.dropLast())
            }
            if textField.text?.characters.count == 17 && string.characters.count != 0 {
                return false
            }
            
//            cadite_id += string
//            
//            print(cadite_id)
            return true
        }
            
        else{
            return true
        }
    }


}
