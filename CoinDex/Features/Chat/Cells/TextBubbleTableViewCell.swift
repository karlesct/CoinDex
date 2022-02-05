//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class TextBubbleTableViewCell: UITableViewCell, NibLoadable, ReusableCell {
    // MARK: - IBoutlets

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    // MARK: - Internal
}
