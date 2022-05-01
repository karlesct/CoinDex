//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation

protocol LoggingServiceProtocol: AnyObject {

    func log(_ format: String, _ args: CVarArg...)
    func log(_ message: String)
    func log(_ error: Error)
}

public final class LoggingService: NSObject {

    // MARK: - Init

    public override init() {}

}

extension LoggingService: LoggingServiceProtocol {

    func log(_ format: String, _ args: CVarArg...) {
        #if DEBUG
            NSLog(format, args)
        #endif
    }
    
    func log(_ message: String) {
        #if DEBUG
            NSLog(message)
        #endif
    }


    func log(_ error: Error) {
        #if DEBUG
            NSLog(error.localizedDescription)
        #endif
    }

}
