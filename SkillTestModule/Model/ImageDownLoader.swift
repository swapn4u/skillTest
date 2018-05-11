//
//  ImageDownLoader.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 07/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

class ImageDownLoader:NSObject
{
    var image_cache = NSCache<AnyObject, AnyObject>()
    
    func manage(path : String?, imageView : UIImageView)  {
        
        DispatchQueue.main.async {
            if let path = path {
                if let img = self.image_cache.object(forKey: path as AnyObject) as? UIImage {
                    imageView.image = img
                    return
                }
              
                guard let url = URL.init(string : path) else {
                    return
                }
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    guard let data = data , error == nil , response != nil else {
                        return
                    }
                    DispatchQueue.main.async {
                        let img = UIImage(data: data)
                        imageView.image = img
                        self.image_cache.setObject(img as AnyObject, forKey: path as AnyObject)
                    }
                    
                }).resume()
                
            }
         
        }
        
    }
}
