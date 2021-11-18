/**
*  * *****************************************************************************
*  * Filename: NetworkReachabilityTests.swift
*  * Author  : Shivam Singh
*  * Creation Date: 17/11/21
*  * *
*  * *****************************************************************************
*  * Description:
*  * This class contains the unittestcases for network reachability
*  *                                                                             *
*  * *****************************************************************************
*/

import XCTest
@testable import AssignmentProject

class NetworkReachabilityTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    func testNetworkAvailableStatus() {
        let networkStatus = NetworkReachability.isConnectedToNetwork()
        if networkStatus {
            XCTAssertEqual(networkStatus, true)
        }
    }

    func testNetworkNotAvailableStatus() {
        let networkStatus = NetworkReachability.isConnectedToNetwork()
        if !networkStatus {
            XCTAssertEqual(networkStatus, true)
        }
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
