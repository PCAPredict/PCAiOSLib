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

public class RetrieveResponse: Mappable {
    public var Items: [RetrieveResponseItem]?;
    
    required public init(map: Map) {
        
    }
    
    init(){
        self.Items = [];
    }
    
    public func mapping(map: Map) {
        Items <- map["Items"];
    }
    
}
