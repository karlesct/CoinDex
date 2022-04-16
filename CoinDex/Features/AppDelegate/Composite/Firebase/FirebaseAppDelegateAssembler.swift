//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation


final class FirebaseAppDelegateAssembler {
    
    // MARK: - Init
    
    init() {}
    
    // MARK: - Methods
    
    func delegate() -> AppDelegateType {
        let delegate = FirebaseAppDelegate(logging: loggingService())
        return delegate
    }
    
    private func loggingService() -> LoggingServiceProtocol {
        return LoggingServiceAssembler().logging()
    }
    
}
