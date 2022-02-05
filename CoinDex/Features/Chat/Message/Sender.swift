//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol SenderProtocol {
    var senderId: UUID { get }          // The identifier for the sender.
    var senderName: String { get }      // The sender name
}

struct Sender: SenderProtocol {
    var senderId: UUID
    var senderName: String
}
