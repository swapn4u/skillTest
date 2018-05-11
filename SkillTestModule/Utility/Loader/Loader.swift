//
//  Loader.swift
//  NeoStore
//
//  Created by Vikas on 23/11/17.
//  Copyright © 2017 Neosoft. All rights reserved.
//

import Foundation
import UIKit

class Loader {
    
    static let load = Loader()
    
    func startLoader(view:UIView ,withTitle:String)
    {
        let loadingNotification : MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
      loadingNotification.label.text = withTitle
    }
    
    func dimissLoader(view:UIView)
    {
        DispatchQueue.main.async
            {
           MBProgressHUD.hideAllHUDs(for: view, animated: true)
        }
        
    }
}
