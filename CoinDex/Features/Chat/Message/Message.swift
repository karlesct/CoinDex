//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// Represents the object message
protocol MessageProtocol: TModel {
    var sender: SenderProtocol { get }  // The sender of the message.
    var messageId: UUID { get }       // The identifier for the message. UUID or String?
    var sentDate: Date { get }          // The date the message was sent.
    var kind: MessageKind { get }       // The kind of message
}

struct Message: MessageProtocol {
    var sender: SenderProtocol
    var messageId: UUID
    var sentDate: Date
    var kind: MessageKind
}


