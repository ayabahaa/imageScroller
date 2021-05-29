//
//  loginModel.swift
//  البناء العلمي

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? newJSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let status: Bool?
    let message : String?
    let messages: Messages?
    let data: DataClass1?
}
struct Messages: Codable {
    let email, password: [String]?
}
// MARK: - DataClass
struct DataClass1: Codable {
    let id: Int?
    let name: String?
    let jobTitle, aboutTeacher: JSONNull1?
    let email, accountType, gender, adminID: String?
    let photo: JSONNull1?
    let countryID, cityID, mobile, accountStatus: String?
    let fbID, twitterID, googleID: JSONNull1?
    let apiToken: String?
    let activeMailHash, deletedAt: JSONNull1?
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

// MARK: - Encode/decode helpers

class JSONNull1: Codable, Hashable {

    public static func == (lhs: JSONNull1, rhs: JSONNull1) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull1.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
