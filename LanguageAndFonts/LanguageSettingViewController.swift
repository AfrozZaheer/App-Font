//
//  LanguageSettingViewController.swift
//  LanguageAndFonts
//
//  Created by Afroz on 07/04/2020.
//  Copyright © 2020 AF. All rights reserved.
//

import UIKit

class LanguageSettingViewController: UIViewController {

    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var txtChangeLanguage: UITextField!
    
    let languages = ["-", "en", "ar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension LanguageSettingViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.inputView = pickerView
    }
}

extension LanguageSettingViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if languages[row] == "-" {return}
        txtChangeLanguage.text = languages[row]
        Utility.setAppleLAnguageTo(lang: languages[row])
        self.view.endEditing(true)
        
        let alert = UIAlertController(title: "Reset", message: "Exiting app.\n Re-run app to see all fonts changes", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let _ = self else {return}
            alert.dismiss(animated: true) {
                exit(0)
            }
        }
    }
    
}
