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
        defaultHeaders["X-Parse-REST-API-Key"] = "d0zRCiGFS2Becr3fVDlV9UDwnnCjLofWlIyPBbEq"
        defaultHeaders["X-Parse-Application-Id"] = "Jrfrtb7blTPVKEPKS2OC0QgE0RTKqQzZHNxKrfoR"
        
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
            
        }
    }
    
}