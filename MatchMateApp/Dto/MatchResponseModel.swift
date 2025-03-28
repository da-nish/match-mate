//
//  MatchResponseModel.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import Foundation

// MARK: - MatchResponseModel
struct MatchResponseModel: Codable {
    let mateList: [MateModel]
//    let info: Info
    
    enum CodingKeys: String, CodingKey {
        case mateList = "results" // Map server's "mate_list" to your "mateList"
    }
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct MateModel: Codable, Identifiable {
    let id = UUID()
    let gender: Gender
    let name: Name
    let location: Location?
    let email: String
//    let login: Login
    let dob: Dob
    let phone, cell: String?
//    let id: ID
    let picture: Picture
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

//// MARK: - ID
//struct ID: Codable {
//    let name: String
//    let value: String?
//}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city: String? = ""
    let state: String? = ""
    let country: String? = ""
//    let postcode: Int
}



// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}
