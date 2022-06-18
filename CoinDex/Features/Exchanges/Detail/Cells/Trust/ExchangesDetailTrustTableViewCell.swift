//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

class ExchangesDetailTrustTableViewCell: UITableViewCell,
                                           NibLoadable,
                                           ReusableCell {
    
    // MARK: - IBoutlets
    @IBOutlet weak var vwContainer: UIView! {
        didSet {
            self.vwContainer.layer.cornerRadius = 8
            self.vwContainer.layer.setShadow()
        }
    }
    
    @IBOutlet weak var lblTrustScoreRankTitle: UILabel! {
        didSet {
            self.lblTrustScoreRankTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblTrustScoreRankTitle.textColor = .defaultText
            self.lblTrustScoreRankTitle.text = "exchange_detail_trust_cell_score_rank_title".localized
        }
    }
    
    @IBOutlet weak var lblTrustScoreRankDetail: UILabel! {
        didSet {
            self.lblTrustScoreRankDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblTrustScoreRankDetail.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var lblTrustScoreTitle: UILabel! {
        didSet {
            self.lblTrustScoreTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblTrustScoreTitle.textColor = .defaultText
            self.lblTrustScoreTitle.text = "exchange_detail_trust_cell_trust_score_title".localized
        }
    }
    
    @IBOutlet weak var lblTrustScoreDetail: UILabel! {
        didSet {
            self.lblTrustScoreDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblTrustScoreDetail.textColor = .defaultText
            
        }
    }
    
    @IBOutlet weak var lblTradeVolumeTitle: UILabel! {
        didSet {
            self.lblTradeVolumeTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblTradeVolumeTitle.textColor = .defaultText
            self.lblTradeVolumeTitle.text = "exchange_detail_trust_cell_trade_volume_title".localized
        }
    }
    
    @IBOutlet weak var lblTradeVolumeDetail: UILabel! {
        didSet {
            self.lblTradeVolumeDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblTradeVolumeDetail.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var lblTradeVolumeNormalizedTitle: UILabel! {
        didSet {
            self.lblTradeVolumeNormalizedTitle.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.lblTradeVolumeNormalizedTitle.textColor = .defaultText
            self.lblTradeVolumeNormalizedTitle.text = "exchange_detail_trust_cell_trade_volume_normalized_title".localized
        }
    }
    
    @IBOutlet weak var lblTradeVolumeNormalizedDetail: UILabel! {
        didSet {
            self.lblTradeVolumeNormalizedDetail.font = .systemFont(ofSize: 17,
                                            weight: .regular)
            self.lblTradeVolumeNormalizedDetail.textColor = .defaultText
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
    
    func bind(item: ExchangesDetailTrustCellModel) {
        self.lblTrustScoreRankDetail.text =  String(item.scoreRank)
        self.lblTrustScoreDetail.text =  String(item.trustScore)
        self.lblTradeVolumeDetail.text =  String(item.tradeVolumeBtc)
        self.lblTradeVolumeNormalizedDetail.text =  String(item.tradeVolumeNormalizedBtc)
    }
}

