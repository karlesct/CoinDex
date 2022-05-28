//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol CountryPickerTableViewCellDelegate: AnyObject {
    func cellSelected(item: CountryPickerCellModel?)
}

class CountryPickerTableViewCell: UITableViewCell,
                                  NibLoadable,
                                  ReusableCell {
    // MARK: - IBoutlets
    @IBOutlet weak var countryFlagImageView: UIImageView! {
        didSet {
            self.countryFlagImageView.layer.cornerRadius = 5
        }
    }

    @IBOutlet weak var countryNameLabel: UILabel!

    // MARK: - Properties

    weak var delegate: CountryPickerTableViewCellDelegate?

    var item: CountryPickerCellModel?

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGestureRecognizer)

    }

    // MARK: - Methods

    func bind(with item: CountryPickerCellModel,
              delegate: CountryPickerTableViewCellDelegate) {
        self.item = item
        self.delegate = delegate
        self.countryNameLabel.text = item.countryName //item.flag + " (+\(item.phoneCode)) " + item.countryName

        self.countryFlagImageView.image = item.flagImage
    }

    @objc func handleTap() {
        self.delegate?.cellSelected(item: self.item)
    }
}

