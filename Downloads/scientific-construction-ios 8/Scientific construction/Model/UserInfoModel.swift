//
//  GetUserInfoModel.swift
//  Scientific construction
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getUserInfoModel = try? newJSONDecoder().decode(GetUserInfoModel.self, from: jsonData)

import Foundation

// MARK: - GetUserInfoModel
struct UserInfoModel: Codable {
    let status: Bool?
    let data: DataClass4?
}

// MARK: - DataClass
struct DataClass4: Codable {
    let id: Int?
    let name: String?
    let jobTitle, aboutTeacher: String?
    let email, accountType, gender, adminID: String?
    let photo: String?
    let countryID: [CountryID1]?
    let cityID: [CityID1]?
    let mobile, accountStatus: String?
    let fbID, twitterID, googleID: String?
    let apiToken: String?
    let activeMailHash, deletedAt: String?
    let rememberToken, createdAt, updatedAt: String?

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
struct CityID1: Codable {
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
struct CountryID1: Codable {
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




