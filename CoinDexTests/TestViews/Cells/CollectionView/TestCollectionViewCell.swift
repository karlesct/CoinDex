//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
@testable import CoinDexRelease

internal final class TestCollectionViewCell: UICollectionViewCell,
                                             NibLoadable,
                                             ReusableCell {

    // MARK: - IBOutlets
    @IBOutlet weak var testLabel: UILabel!
}
