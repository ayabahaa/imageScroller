//
//  AllCoursesModel.swift
//  Scientific construction
// This file was generated from JSON Schema using quicktype, do not modify it
import Foundation

// MARK: - AllCoursesModel
struct AllCoursesModel: Codable {
    let status: Bool?
    let data: DataClass3?
}

// MARK: - DataClass
struct DataClass3: Codable {
    let departments: [Department]?
    let byDepartment: Int?
    let availableCourse: AvailableCourse?

    enum CodingKeys: String, CodingKey {
        case departments
        case byDepartment = "by_department"
        case availableCourse = "available_course"
    }
}

// MARK: - AvailableCourse
struct AvailableCourse: Codable {
    let currentPage: Int?
    let data: [Datum3]?
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
struct Datum3: Codable {
    let id: Int?
    let adminID: String?
    let userID: UserID?
    let departmentID: Department?
    let forumID: String?
    let courseName, scorePercentage, questionCount, courseImg: String?
    let courseBrife, haveForum, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case adminID = "admin_id"
        case userID = "user_id"
        case departmentID = "department_id"
        case forumID = "forum_id"
        case courseName = "course_name"
        case scorePercentage = "score_percentage"
        case questionCount = "question_count"
        case courseImg = "course_img"
        case courseBrife = "course_brife"
        case haveForum = "have_forum"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Department
struct Department: Codable {
    let id: Int?
    let departmentName: String?
    let icon, color, parent: String?
    let adminID: String?
    let deletedAt: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case departmentName = "department_name"
        case icon, color, parent
        case adminID = "admin_id"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - UserID
struct UserID: Codable {
    let id: Int?
    let name, jobTitle, aboutTeacher, email: String?
    let accountType, gender, adminID, photo: String?
    let countryID, cityID, mobile, accountStatus: String?
    let fbID, twitterID, googleID, apiToken: String?
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
