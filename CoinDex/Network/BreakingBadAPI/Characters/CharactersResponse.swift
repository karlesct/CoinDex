//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

typealias CharactersResponse = [CharactersResponseElement]

protocol CharactersResponseElementType {
    var charId: Int { get }
    var name: String { get }
    var birthday: String { get }
    var occupation: [String] { get }
    var img: String { get }
    var status: CharactersStatus { get }
    var nickname: String { get }
    var appearance: [Int] { get }
    var portrayed: String { get }
    var category: CharactersCategory { get }
    var betterCallSaulAppearance: [Int] { get }
}

struct CharactersResponseElement: Codable, CharactersResponseElementType {
    let charId: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: CharactersStatus
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: CharactersCategory
    let betterCallSaulAppearance: [Int]
}

enum CharactersStatus: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
}

enum CharactersCategory: String, Codable {
    case betterCallSaul = "Better Call Saul"
    case breakingBad = "Breaking Bad"
    case breakingBadBetterCallSaul = "Breaking Bad, Better Call Saul"
    case unknown = "Unknown"
}
