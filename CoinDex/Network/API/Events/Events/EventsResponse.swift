//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

struct EventsResponse: Codable {
    let data: [EventsItemResponse]
    let count: Int
    let page: Int
}

struct EventsItemResponse: Codable {
    let type: String
    let title: String
    let description : String
    let organizer: String
    let startDate: String
    let endDate: String
    let website: String
    let email: String
    let venue: String
    let address: String
    let city: String
    let country: String
    let screenshot: String
}
