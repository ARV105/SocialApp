//
//  FancyBtn.swift
//  SocialApp
//
//  Created by Auriel on 6/15/17.
//  Copyright © 2017 Sphexis. All rights reserved.
//

import UIKit

@IBDesignable
class FancyBtn: UIButton {
    
override func awakeFromNib() {
    super.awakeFromNib()
    
    layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6) .cgColor
    layer.shadowOpacity = 0.8
    layer.shadowRadius = 5
    layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    layer.cornerRadius = 2.0
    
}

}
