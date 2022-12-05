//
//  FollowinFollowersTest.swift
//  SB ChallengeTests
//
//  Created by George Kiplagat on 05/12/2022.
//

import XCTest

@testable import SB_Challenge

final class FollowinFollowersTest: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testJSONDecoding() {
            
            
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "followers_sample", ofType: "json")
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else {
            fatalError("Data is nil")
        }
            
        let resource = try! JSONDecoder().decode([User].self, from: data)
            
        XCTAssertEqual(resource.first?.login, "rubiojr")
    }
    
    

}
