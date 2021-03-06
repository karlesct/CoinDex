//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation

public final class LoggingServiceAssembler {

    // MARK: - Properties

    // MARK: - Init

    init() {}

    // MARK: - Methods

    func logging() -> LoggingServiceProtocol {

        let logging = LoggingService()
        return logging
    }

}
