//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class ExchangesDetailInfoTableViewCell: UITableViewCell,
                                           NibLoadable,
                                           ReusableCell {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var vwContainer: UIView! {
        didSet {
            self.vwContainer.layer.cornerRadius = 8
            self.vwContainer.layer.setShadow()
        }
    }
    
    @IBOutlet weak var lblNameTitle: UILabel! {
        didSet {
            self.lblNameTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblNameTitle.textColor = .defaultText
            self.lblNameTitle.text = "exchange_detail_info_cell_name_title".localized
        }
    }
    
    @IBOutlet weak var lblNameDetail: UILabel! {
        didSet {
            self.lblNameDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblNameDetail.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var ivLogo: UIImageView!
    
    @IBOutlet weak var lblCountryTitle: UILabel! {
        didSet {
            self.lblCountryTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblCountryTitle.textColor = .defaultText
            self.lblCountryTitle.text = "exchange_detail_info_cell_country_title".localized
        }
    }
    
    @IBOutlet weak var lblCountryDetail: UILabel! {
        didSet {
            self.lblCountryDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblCountryDetail.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var lblYearTitle: UILabel! {
        didSet {
            self.lblYearTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblYearTitle.textColor = .defaultText
            self.lblYearTitle.text = "exchange_detail_info_cell_year_title".localized
        }
    }
    
    @IBOutlet weak var lblYearDetail: UILabel! {
        didSet {
            self.lblYearDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblYearDetail.textColor = .defaultText
            
        }
    }
    
    @IBOutlet weak var lblCentralizedTitle: UILabel! {
        didSet {
            self.lblCentralizedTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblCentralizedTitle.textColor = .defaultText
            self.lblCentralizedTitle.text = "exchange_detail_info_cell_centralized_title".localized
        }
    }
    
    @IBOutlet weak var lblCentralizedDetail: UILabel! {
        didSet {
            self.lblCentralizedDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblCentralizedDetail.textColor = .defaultText
        }
    }
    
    // MARK: - Properties
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .x00FFFFFF
    }
    
    // MARK: - Bind
    
    func bind(item: ExchangesDetailInfoCellModel) {
        self.lblNameDetail.text = item.name
        self.ivLogo.loadThumbnail(urlSting: item.image)
        self.lblCountryDetail.text = item.country
        self.lblYearDetail.text = String(item.year)
        self.lblCentralizedDetail.text = item.centralized ? "literal_yes".localized : "literal_no".localized
    }
}
