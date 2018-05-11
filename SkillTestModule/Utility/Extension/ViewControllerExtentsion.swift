//
//  ViewControllerExtentsion.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 07/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController
{
    func loadViewController(_ viewController:String)->UIViewController
    {
        return (self.storyboard?.instantiateViewController(withIdentifier: viewController))!
    }
}
