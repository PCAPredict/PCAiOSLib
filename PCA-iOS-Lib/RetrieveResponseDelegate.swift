//
//  RetrieveResponseDelegate.swift
//  PCA-iOS-Lib
//
//  Created by Henrik on 6/27/17.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation
import UIKit


@objc protocol PCALookupViewDelegate: class {
    func didRecieveAddress(address: RetrieveResponseItem)
    @objc optional func pca_didRecieveError(error: ResponseError);
    @objc optional func pca_cellForFindResponse(findResponse: FindResponseItem) -> UITableViewCell
    @objc optional func pca_cellBackgroundColor(findResponse: FindResponseItem) -> UIColor
    @objc optional func pca_cellTextColor(findResponse: FindResponseItem) -> UIColor
    @objc optional func pca_backgroundColor() -> UIColor
    @objc optional func pca_extraFieldFormats() -> [String]
}