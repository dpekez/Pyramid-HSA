//
//  JSON_Import_Test.swift
//  Pyramid HSA Tests
//
//  Created by Dejan Pekez on 11.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

@testable import Pyramid_HSA
import XCTest

class JSON_Import_Test: XCTestCase {
    
    let fileName = "CompanyDetails"
    var companies = [CompanyDetail]()
    var rearrangedCompanies = [CompanyDetailRearranged]()

    override func setUp() {
        companies.removeAll()
        rearrangedCompanies.removeAll()
    }

    func testPlainImport() {
        XCTAssertNoThrow(companies = JSONDeserializer().toArray(fromFile: fileName))
    }
    
    func testRearrangedImport() {
        companies = JSONDeserializer().toArray(fromFile: fileName)
        rearrangedCompanies = companies.map { CompanyDetailRearranged(from: $0) }
        XCTAssertTrue(type(of: rearrangedCompanies[0].id) == Int.self)
    }

    func testPlainPerformance() {
        self.measure {
            companies = JSONDeserializer().toArray(fromFile: fileName)
        }
    }
    
    func testMappingPerformance() {
        companies = JSONDeserializer().toArray(fromFile: fileName)
        self.measure {
            _ = companies.map { CompanyDetailRearranged(from: $0) }
        }
    }

}
