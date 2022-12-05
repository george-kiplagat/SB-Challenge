//
//  HTTPMethod.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
