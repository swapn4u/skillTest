//
//  ViewModel.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 04/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SDWebImage
class ViewModel: NSObject
{
    //outlet collections
    @IBOutlet weak var serverManager: ServerManager!
    @IBOutlet weak var imageHandler: ImageDownLoader!
    
    //varibles
    var profileCollector = ProfileMapper()
    
    
    func getProfileUpdateFor(request:String,completed:@escaping (Bool)->())
    {
        serverManager.loadProfileResponceFor(request: request) { (profileDetails, error) in
            if error == nil
            {
                self.profileCollector=profileDetails
                completed(true)
            }
        }
    }
    func totalProfile()->Int
    {
        if let data = self.profileCollector.profileData
        {
            return data.count
        }
        return  0
    }
    func setMyNavigationTitle(_ viewcontroller:UIViewController)
    {
        viewcontroller.title=self.profileCollector.name
    }
    func updateInfoForCell(cell:ProfileInfoCell)
    {
        cell.profileNameLabel.text=profileCollector.profileData![cell.tag].title
        let url = URL(string: profileCollector.profileData![cell.tag].imageURL)

        cell.profileImageView.sd_setImage(with:url , placeholderImage: #imageLiteral(resourceName: "no_imege_to_preview"), completed: { (image, error, cacheType, url) -> Void in
            if ((error) != nil) {
                cell.profileImageView.image =  #imageLiteral(resourceName: "no_imege_to_preview")
            //cell.profileImageView.frame.size.height=200
            } else {
                cell.profileImageView.image = image
                //cell.profileImageView.frame.size.height=(image?.size.height)!
            }
        })
    }
    func getHeightFor(indexPath:Int)-> CGFloat
    {
        if let url = URL(string: profileCollector.profileData![indexPath].imageURL)
        {
        if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) {
            if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
                let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! Int
                let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! Int
                print("the image width is: \(pixelWidth)")
                print("the image height is: \(pixelHeight)")
                return CGFloat(pixelHeight)
            }
        }
        }
       return 100
    }
    func getProfileData()-> ProfileMapper
    {
        return profileCollector
    }

}
