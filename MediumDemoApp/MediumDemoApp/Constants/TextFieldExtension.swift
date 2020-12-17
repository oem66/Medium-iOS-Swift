//
//  TextFieldExtension.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 12/14/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

extension UITextField {
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil{
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}
