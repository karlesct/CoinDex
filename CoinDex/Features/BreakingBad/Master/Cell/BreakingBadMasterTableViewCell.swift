//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

protocol BreakingBadMasterTableViewCellDelegate: AnyObject {
    func selectedCell(item: FavoritableCharactersItemResponse?)
}

class BreakingBadMasterTableViewCell: UITableViewCell,
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
    
    @IBOutlet weak var ivFavorite: UIImageView! {
        didSet {
            self.ivFavorite.image = .common.favoriteIcon
        }
    }
    
    @IBOutlet weak var ivIndicator: UIImageView! {
        didSet {
            self.ivIndicator.image = .common.disclousureIcon
            self.ivIndicator.tintColor = .x555555
        }
    }
    
    // MARK: - Properties
    
    weak var delegate: BreakingBadMasterTableViewCellDelegate?
    
    private var item: FavoritableCharactersItemResponse?
    
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
    
    func bind(item: FavoritableCharactersItemResponse,
              delegate: BreakingBadMasterTableViewCellDelegate) {
        self.lblName.text = item.data.name
        self.ivLogo.loadThumbnail(urlSting: item.data.img)
        self.ivFavorite.layer.opacity = item.favorite ? 1 : 0.3
        
        self.item = item
        self.delegate = delegate
    }
    
    @objc func handleTap() {
        self.delegate?.selectedCell(item: self.item)
    }
}
