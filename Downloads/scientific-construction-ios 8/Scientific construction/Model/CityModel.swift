//
//  CityModel.swift
//  Scientific construction
//
//  Created by apple on 4/9/20.
//  Copyright © 2020 Softagi. All rights reserved.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryModel = try? newJSONDecoder().decode(CountryModel.self, from: jsonData)

import Foundation

// MARK: - CountryModel
struct CityModel: Codable {
    let status: Bool?
    let data: [Datum1]?
}

// MARK: - Datum
struct Datum1: Codable {
    let cityName: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case id
    }
}
