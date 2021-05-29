//
//  changePasswordModel.swift
//  البناء العلمي
//
//  Created by apple on 4/7/20.
//  Copyright © 2020 Softagi. All rights reserved.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let changePasswordModel = try? newJSONDecoder().decode(ChangePasswordModel.self, from: jsonData)

import Foundation

// MARK: - ChangePasswordModel
struct ChangePasswordModel: Codable {
    let status: Bool?
    let message: String?
    let messages: Errors?
}
struct Errors: Codable {
    let currentPassword, newPassword, passwordConfirmation: [String]?

    enum CodingKeys: String, CodingKey {
        case currentPassword = "current_password"
        case newPassword = "new_password"
        case passwordConfirmation = "password_confirmation"
    }
}
