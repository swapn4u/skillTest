//
//  ProfileInfoCell.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 04/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ProfileInfoCell: UICollectionViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      self.applyShadow()
    }
}
