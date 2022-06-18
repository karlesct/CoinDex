//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit
@testable import CoinDexRelease

internal final class TestCell: UITableViewCell,
                               NibLoadable,
                               ReusableCell {

    // MARK: - IBOutlets
    @IBOutlet weak var testLabel: UILabel!
}
