//
//  Copyright © 2022 CCT. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self,
                                 tableName: "Localizables",
                                 bundle: Bundle.main,
                                 value: "**\(self)**",
            comment: "")
    }

}
