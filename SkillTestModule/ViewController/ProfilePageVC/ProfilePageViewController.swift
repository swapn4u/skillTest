//
//  ViewController.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 04/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var ProfileHandler: ViewModel!
    
    var isCompleted = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load profile details
        Loader.load.startLoader(view: self.view, withTitle:"Please wait a moment")
        ProfileHandler.getProfileUpdateFor(request:PROFILE_LOADER_URL) { (completed) in
            DispatchQueue.main.async
                {
                    //set navigation title
                    self.ProfileHandler.setMyNavigationTitle(self)
                    
                    //Update profile UI
                    self.collectionView.reloadData()
                    self.collectionView.layoutIfNeeded()
                    
                    //stop loader
                    Loader.load.dimissLoader(view: self.view)
            }
        }
    }
}

//Handle profile info UI
extension ProfilePageViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileHandler.totalProfile()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PROFILE_CELL_IDENTIFIER, for: indexPath) as! ProfileInfoCell
        cell.tag=indexPath.item
        ProfileHandler.updateInfoForCell(cell: cell)
       return cell
    }

//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//   {
//     return CGSize(width: collectionView.frame.size.width, height:400)
//   }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as! ProfileInfoCell
       let detailsViewController = self.loadViewController(DETAILVIEWCONTROLLER_IDENTIFIER) as! DetailsViewController
        let data = ProfileHandler.getProfileData()
        detailsViewController.showdata(image: cell.profileImageView.image!,title:data.profileData![indexPath.row].title, descriptionText:data.profileData![indexPath.row].description)
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
    }
}

