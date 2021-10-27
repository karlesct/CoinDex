//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

/// Get events, paginated by 100
struct EventsRequest: DataRequest {

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    var url: String {
        return baseURL + path
    }

    var path: String {
        return "/events"
    }

    var headers: [HTTPHeaderKey: HTTPHeaderValue] {
        [
            .accept: .applicationJson
        ]
    }

    var method: HTTPMethod {
        .get
    }

    var queryItems: [String : String]? {
        [
            "country_code" : "US",              // country_code of event (eg. 'US'). use /api/v3/events/countries for list of country_codes
            "type" : "Conference",              // type of event (eg. 'Conference'). use /api/v3/events/types for list of types
            //"page" : "100",                     // page of results (paginated by 100)
            "upcoming_events_only" : "false",    // lists only upcoming events. true, false (defaults to true, set to false to list all events)
            "from_date" : "2019-10-30",         // lists events after this date yyyy-mm-dd
            "to_date" : "2020-09-01",           // lists events before this date yyyy-mm-dd (set upcoming_events_only to false if fetching past events)

        ]
    }

    func decode(_ data: Data) throws -> EventsResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(EventsResponse.self, from: data)
        return response
    }
}
