//
//  AllTeachersModel.swift
//  Scientific construction
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allTeachersModel = try? newJSONDecoder().decode(AllTeachersModel.self, from: jsonData)

import Foundation

// MARK: - AllTeachersModel
struct AllTeachersModel: Codable {
    let status: Bool?
    let data: DataClass2?
}

// MARK: - DataClass
struct DataClass2: Codable {
    let currentPage: Int?
    let data: [Datum2]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let nextPageURL: String?
    let path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct Datum2: Codable {
    let id: Int?
    let name, jobTitle, aboutTeacher, email: String?
    let accountType, gender, adminID, photo: String?
    let countryID, cityID, mobile, accountStatus: String?
    let fbID, twitterID, googleID, apiToken: String?
    let activeMailHash, deletedAt, rememberToken: String?
    let createdAt, updatedAt, coursesCount: String?

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
        case coursesCount = "courses_count"
    }
}


// MARK: - Encode/decode helpers


