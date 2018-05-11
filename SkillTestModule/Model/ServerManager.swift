//
//  ServerManager.swift
//  SkillTest
//
//  Created by Swapnil Katkar on 04/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ServerManager: NSObject
{
    func loadProfileResponceFor(request: String, finished: @escaping (ProfileMapper,Error?) -> ()) {
        // set up web service url
        let url = URL(string: "\(request)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request)
        {  (data, response, error) in
            if error == nil
            {
                let strData = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.isoLatin1.rawValue))
                let data = strData!.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                do {
                    if let data = data,
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)as? [String: Any]
                    {
                        let profileInfo = ProfileMapper(profileDict: json)
                        finished(profileInfo,error)
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                }
            }
            else
            {
                finished(ProfileMapper(profileDict:[:]), error)
            }
        }
        dataTask.resume()
    }
}
