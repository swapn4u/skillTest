//
//  DetailsViewController.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 07/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var statckView: UIStackView!
    @IBOutlet weak var profileDetailImageview: UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    //varible
  var profileImage  = UIImage()
    var descriptionTxt = ""
    var profileTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileDetailImageview.image=profileImage
        profileDetailImageview.applyShadow()
        self.title = profileTitle
        descriptionLabel.text = descriptionTxt
        descriptionLabel.applyShadow()
    }

    func showdata(image: UIImage,title:String, descriptionText:String)
    {
        profileImage = image
       descriptionTxt = descriptionText
        profileTitle = title
    }
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval)
    {
        switch UIDevice.current.orientation{
        case .portrait:
            statckView.axis = .vertical
        case .portraitUpsideDown:
            statckView.axis = .vertical
        case .landscapeLeft:
            statckView.axis = .horizontal
        case .landscapeRight:
            statckView.axis = .horizontal
        default:
            statckView.axis = .vertical
        }
    }
}
