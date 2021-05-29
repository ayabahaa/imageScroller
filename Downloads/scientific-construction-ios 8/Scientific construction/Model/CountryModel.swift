//
//  CountryModel.swift
//  Scientific construction
//
//  Created by apple on 4/9/20.
//  Copyright © 2020 Softagi. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryModel = try? newJSONDecoder().decode(CountryModel.self, from: jsonData)

import Foundation

// MARK: - CountryModel
struct CountryModel: Codable {
    let status: Bool?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let countryName: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case countryName = "country_name"
        case id
    }
}
