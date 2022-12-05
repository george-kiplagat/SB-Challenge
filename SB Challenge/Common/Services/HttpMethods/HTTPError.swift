//
//  HTTPError.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation

enum HTTPError: String, Error  {
    case urlFailed = "Url failed"
    case noData = "No data"
    case requestError = "Request error"
    case parsingFailed = "parsing failed"
}
