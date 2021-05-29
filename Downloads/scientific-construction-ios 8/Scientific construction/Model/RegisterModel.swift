//
//  RegisterModel.swift
//  البناء العلمي
//
//  Created by apple on 4/7/20.
//  Copyright © 2020 Softagi. All rights reserved.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let registerModel = try? newJSONDecoder().decode(RegisterModel.self, from: jsonData)

import Foundation

// MARK: - RegisterModel
struct RegisterModel: Codable {
    let status: Bool?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int?
    let name: String?
    let jobTitle, aboutTeacher: JSONNull?
    let email, accountType, gender: String?
    let adminID, photo: JSONNull?
    let countryID: [CountryID]?
    let cityID: [CityID]?
    let mobile, accountStatus: String?
    let fbID, twitterID, googleID: JSONNull?
    let apiToken, activeMailHash: String?
    let deletedAt, rememberToken: JSONNull?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case jobTitle = "job_title"
        case aboutTeacher = "about_teacher"
        case email
        case accountType = "account_type"
        case gender
        case adminID = "admin_id"
        case photo
        case countryID = "country_id"
        case cityID = "city_id"
        case mobile
        case accountStatus = "account_status"
        case fbID = "fb_id"
        case twitterID = "twitter_id"
        case googleID = "google_id"
        case apiToken = "api_token"
        case activeMailHash = "active_mail_hash"
        case deletedAt = "deleted_at"
        case rememberToken = "remember_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - CityID
struct CityID: Codable {
    let id: Int?
    let adminID, countryID, cityName, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case adminID = "admin_id"
        case countryID = "country_id"
        case cityName = "city_name"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - CountryID
struct CountryID: Codable {
    let id: Int?
    let adminID, countryName: String?
    let flag: String?
    let code, symbol, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case adminID = "admin_id"
        case countryName = "country_name"
        case flag, code, symbol
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
