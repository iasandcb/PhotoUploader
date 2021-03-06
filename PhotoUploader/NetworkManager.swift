//
//  NetworkManager.swift
//  Catalog
//
//  Created by SDT2 on 2015. 10. 29..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let sharedManager = NetworkManager()
    
    let manager: Manager
    
    init() {
        var defaultHeaders = Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["X-Parse-REST-API-Key"] = ""
        defaultHeaders["X-Parse-Application-Id"] = ""
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        manager = Alamofire.Manager(configuration: configuration)
    }
    
    func upload(image: UIImage) {
        // Fetch Request
        let data = UIImageJPEGRepresentation(image, 0.5)
        manager.upload(.POST, "https://api.parse.com/1/files/pic.jpg", headers:["Content-Type": "image/jpeg"], data:data!).responseJSON { response in
            let json = JSON(response.result.value!)
            print(json)
            let bodyParameters = [
                "image": [
                    "name": json["name"].stringValue,
                    "__type": "File"
                ]
            ]
            
            let encoding = Alamofire.ParameterEncoding.JSON
            self.manager.request(.POST, "https://api.parse.com/1/classes/Post", parameters: bodyParameters, encoding: encoding).validate(statusCode: 200..<300).responseJSON { response in
            }
            
        }
    }
    
}