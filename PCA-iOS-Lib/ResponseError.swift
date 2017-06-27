//
//  ResponseError.swift
//  PCA-iOS-Lib
//
//  Created by Henrik on 6/27/17.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation

class ResponseError: NSObject{
    var
    Error: String?,
    Description: String?,
    Cause: String?,
    Resolution: String?;
    
    init(findResponseItem: FindResponseItem) {
        self.Error = findResponseItem.Error;
        self.Description = findResponseItem.Description;
        self.Cause = findResponseItem.Cause;
        self.Resolution = findResponseItem.Resolution;
    }
    
    init(retrieveResponseItem: RetrieveResponseItem) {
        self.Error = retrieveResponseItem.Error;
        self.Description = retrieveResponseItem.Description;
        self.Cause = retrieveResponseItem.Cause;
        self.Resolution = retrieveResponseItem.Resolution;
    }
    
}
