//
//  Utility.swift
//  LanguageAndFonts
//
//  Created by Afroz on 08/04/2020.
//  Copyright © 2020 AF. All rights reserved.
//

import UIKit

let appLanguagesKey        = "AppleLanguages"

class Utility: NSObject {
    
    static func iscurrentLanguageEnglish() -> Bool {
        if currentAppleLanguage() == "en" {
            return true
        }
        return false
    }
    
    static func setAppleLAnguageTo(lang: String) {
        let userdef = UserDefaults.standard
        userdef.set([lang,currentAppleLanguage()], forKey: appLanguagesKey)
        userdef.synchronize()
    }

    static func currentAppleLanguage() -> String {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: appLanguagesKey) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let currentWithoutLocale = current.substring(to: current.index(endIndex, offsetBy: 2))
        return currentWithoutLocale
    }
    
}
