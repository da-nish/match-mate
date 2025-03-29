//
//  MatchMateModel.swift
//  MatchMateApp
//
//  Created by PropertyShare on 29/03/25.
//

import Foundation

enum MatchStatus{
    case accepted
    case rejected
    case none
    
    static func getType(value: String?) -> MatchStatus{
        switch value {
        case "accepted":
            return .accepted
        case "rejected":
            return .rejected
        default:
            return .none
        }
    }
    static func getValue(value: MatchStatus?) -> String{
        switch value {
        case .accepted:
            return "accepted"
        case .rejected:
            return "rejected"
        default:
            return "none"
        }
    }
}

struct MatchMateModel{
    let uuid: String
    let name: String
    let age: Int
    let gender: String
    let image: String
    var matchStatus: MatchStatus
    let street: String
    
}
