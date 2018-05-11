//
//  view+Extention.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 07/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
extension UIView
{
    func applyShadow()
    {
        self.layer.cornerRadius=14
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
    }
}
