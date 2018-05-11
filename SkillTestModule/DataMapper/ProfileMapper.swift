//
//  ProfileMapper.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 04/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
struct ProfileMapper
{
    var name : String?
    var profileData : [profileDetails]?
    init(profileDict:[String:Any])
    {
        self.name = profileDict["title"] as? String ?? ""
        let profileArr = profileDict["rows"] as? [[String:Any]] ?? [[:]]
        self.profileData = profileArr.flatMap({profileDetails(dict: $0)})
    }
    init() {
        
    }
}
struct profileDetails
{
    var title : String
    var description : String
    var imageURL : String
    init(dict:[String:Any])
    {
        self.title = dict["title"] as? String ?? ""
        self.description = dict["description"] as? String ?? ""
        self.imageURL = dict["imageHref"] as? String ?? ""
    }
}
