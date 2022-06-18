//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

protocol ExchangesListMasterTableViewCellDelegate: AnyObject {
    func selectedCell(id: String?)
}

class ExchangesListMasterTableViewCell: UITableViewCell,
                                   NibLoadable,
                                   ReusableCell {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var vwContainer: UIView! {
        didSet {
            self.vwContainer.layer.cornerRadius = 8
            self.vwContainer.layer.setShadow()
        }
    }
    
    @IBOutlet weak var ivLogo: UIImageView!
    
    @IBOutlet weak var lblName: UILabel! {
        didSet {
            self.lblName.font = .systemFont(ofSize: 17, weight: .medium)
            self.lblName.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var ivIndicator: UIImageView! {
        didSet {
            self.ivIndicator.image = .common.disclousureIcon
            self.ivIndicator.tintColor = .x555555
        }
    }
    
    // MARK: - Properties
    
    weak var delegate: ExchangesListMasterTableViewCellDelegate?
    
    var id: String?
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .x00FFFFFF
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(self.handleTap))
        
        self.addGestureRecognizer(tap)
        
    }
    
    // MARK: - Bind
    
    func bind(item: ExchangesListMasterCellModel,
              delegate: ExchangesListMasterTableViewCellDelegate) {
        self.lblName.text = item.name
        self.ivLogo.loadThumbnail(urlSting: item.image)
        
        self.delegate = delegate
        self.id = item.id
    }
    
    @objc func handleTap() {
        self.delegate?.selectedCell(id: self.id)
    }
}
