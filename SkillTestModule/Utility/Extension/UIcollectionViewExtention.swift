//
//  UIcollectionViewExtention.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 04/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionView
{
    func registerCellWith(Identifier:String)
    {
        self.register(UINib(nibName: Identifier, bundle:nil), forCellWithReuseIdentifier: Identifier)
    }
}
