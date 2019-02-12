//
//  JSONDeserializer.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 28.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

// TODO: Errorhandling

import Foundation

class JSONDeserializer {
    func toArray<T: Decodable>(fromFile fileName: String) -> [T] {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
//        let path = Bundle.main.path(forResource: fileName, ofType: fileExtension)!
        let data = try! Data(contentsOf: url)
        let importedRecords = try! decoder.decode([T].self, from: data)
        
        return importedRecords
    }
}
