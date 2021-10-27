//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct StatusUpdateResponse: Codable {
    let statusUpdates: [StatusUpdateItem]
}

// MARK: - StatusUpdate
struct StatusUpdateItem: Codable {
    let description: String
    let category: StatusUpdateItemCategory
    let createdAt: String
    let user: String?
    let userTitle: String
    let pin: Bool
    let project: StatusUpdateItemProject
}

enum StatusUpdateItemCategory: String, Codable {
    case exchangeListing = "exchange_listing"
    case general = "general"
    case milestone = "milestone"
    case softwareRelease = "software_release"
}

// MARK: - Project
struct StatusUpdateItemProject: Codable {
    let type: StatusUpdateItemProjectType
    let id, name: String
    let image: StatusUpdateItemProjectImage
    let symbol: String?
}

// MARK: - Image
struct StatusUpdateItemProjectImage: Codable {
    let thumb: String
    let small: String
    let large: String
}

enum StatusUpdateItemProjectType: String, Codable {
    case coin = "Coin"
    case market = "Market"
}
