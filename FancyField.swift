//
//  FancyField.swift
//  SocialApp
//
//  Created by Auriel on 6/15/17.
//  Copyright © 2017 Sphexis. All rights reserved.
//

import UIKit

@IBDesignable
class FancyField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
    }
    
    
    override func firstRect(for range: UITextRange) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
}


