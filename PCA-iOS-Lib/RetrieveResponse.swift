//
//  RetrieveResponse.swift
//  PCA-iOS-Lib
//
//  Created by Henrik on 6/27/17.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class RetrieveResponse: Mappable {
    var Items: [RetrieveResponseItem]?;
    
    required init(map: Map) {
        
    }
    
    init(){
        self.Items = [];
    }
    
    func mapping(map: Map) {
        Items <- map["Items"];
    }
    
}
