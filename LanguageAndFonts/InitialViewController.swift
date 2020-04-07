//
//  ViewController.swift
//  LanguageAndFonts
//
//  Created by Afroz on 07/04/2020.
//  Copyright © 2020 AF. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "App Language is " + Utility.currentAppleLanguage().capitalized
    }
    
}

