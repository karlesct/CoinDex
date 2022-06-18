//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
@testable import CoinDexRelease

internal final class TestHeaderFooterCell: UITableViewHeaderFooterView,
                                           NibLoadable,
                                           ReusableCell {

    // MARK: - IBOutlets
    @IBOutlet weak var testLabel: UILabel!
}

internal final class TestNotHeaderFooterCell: UITableViewHeaderFooterView {

    // MARK: - IBOutlets
    @IBOutlet weak var testLabel: UILabel!
}
