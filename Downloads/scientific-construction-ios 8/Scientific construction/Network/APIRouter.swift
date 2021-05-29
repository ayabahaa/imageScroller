//
//  APIRouter.swift
//  FoodDelivery
//
//  Created by Osama on 10/28/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation
import Alamofire

let userID = UserDefaults.standard.value(forKey: "key") as? String

enum APIRouter: URLRequestConvertible {
    
    case login(email: String , password : String)
    case changepassword (token: String, old_password : String ,password : String ,  password_confirmation :String )
    case Register(name: String, email: String, mobile: String, password :String, password_confirmation: String  , countryId: String, cityId: String, agreement : String , gender : String)
    case updateAccount(name: String, email: String, mobile: String, countryId: String, cityId: String, agreement : String , gender : String,token :String)
    case allCountry
    case citiesByCountry(countryId: Int)
    case userInformation(token : String)
    case teachers(token : String )
    case avalibleiCourses(token: String ,type : String , depertment : String)
 
    
    var method: HTTPMethod {
        switch self {
        case .login, .changepassword, .Register , .updateAccount:
            return .post
        case .allCountry, .citiesByCountry , .userInformation, .teachers, .avalibleiCourses:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return ["email": email , "password" : password]
        case .changepassword( let token, let old_password, let password, let password_confirmation):
            return ["api_token": token,"current_password": old_password, "new_password" : password , "password_confirmation" : password_confirmation]
        case .Register( let name, let email, let mobile , let password , let password_confirmation, let countryId , let cityId , let agreement , let gender):
            return ["name": name, "email": email, "mobile": mobile, "password" :password, "password_confirmation": password_confirmation, "country_id": countryId, "city_id": cityId, "agreement" : agreement, "gender" : gender]
        case .updateAccount(let name, let email, let mobile, let countryId , let cityId , let agreement , let gender, let token):
            return ["name": name, "email": email, "mobile": mobile, "country_id": countryId, "city_id": cityId, "agreement" : agreement, "gender" : gender, "api_token" : token]
        
        case .citiesByCountry(let countryId):
            return ["country_id" : countryId]
        case .userInformation(let token):
            return ["api_token" : token]
        case .teachers(let token):
            return ["api_token" : token]
        case .avalibleiCourses(let token, let type, let department):
            return ["api_token" : token, "type" : type , "department" : department ]
        default:
            return nil
        }
    }
    
    var path: String {
        switch self{
        case .login :
            return "login"
        case .changepassword:
            return "change/password"
        case .Register:
            return "register"
        case .updateAccount:
            return "update/account"
        case .allCountry:
            return "get/city/country"
        case .citiesByCountry:
            return "get/city/country"
        case .userInformation:
            return "user"
        case .teachers:
            return "teachers"
        case .avalibleiCourses:
            return "courses"
        }
    }
    
//    var encoding: ParameterEncoding{
//        switch self{
//        default:
//            return URLEncoding.default
//        }
//
//    }
    
//    var headers: HTTPHeaders {
//        switch self {
//        case .teachers:
//            let head = HTTPHeaderField.acceptType
//            return  [HTTPHeaderField.acceptType : ""]
//        default:
//            return nil
//        }
//
//    }
//    var AuthRequired: Bool {
//         switch self {
//         case .allCountry:
//             return true
//         default:
//             return true
//         }
//     }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        // Common Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
//      if(AuthRequired){
//            if(AuthManager.loggedIn) {
//                request.addValue(AuthManager.authKey(), forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
//            }
//        }
        
        if let parameters = parameters {
            return try URLEncoding.default.encode(request, with: parameters)
            
        }
       
        
        return request
    }

    
}
