//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol ChatViewModelProtocol {
    var dataSource: [TModel]? { get set }
}

class ChatViewModel: ChatViewModelProtocol {

    // MARK: - Properties

    var useCase: ChatUseCaseProtocol?

    var dataSource: [TModel]?
    // MARK: - Init

    init() {
        self.dataSource = [
            Message(sender: Sender(senderId: UUID(),
                                   senderName: "Test"),
                    messageId: UUID(),
                    sentDate: Date(),
                    kind: .text("Hola"))
        ]
    }

    // MARK: - Methods

}
