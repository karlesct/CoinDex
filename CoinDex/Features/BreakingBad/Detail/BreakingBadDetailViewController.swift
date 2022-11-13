//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import Combine

protocol BreakingBadDetailViewControllerDelegate: AnyObject {
    func favorite(charId: Int?, didChangeValue value: Bool)
}

class BreakingBadDetailViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 8
            self.containerView.layer.setShadow()
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var nickTitleLabel: UILabel! {
        didSet {
            self.nickTitleLabel.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.nickTitleLabel.textColor = .defaultText
            self.nickTitleLabel.text = "breaking_bad_detail_nickname_title".localized
        }
    }
    @IBOutlet weak var nickDetailLabel: UILabel! {
        didSet {
            self.nickDetailLabel.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var nameTitleLabel: UILabel! {
        didSet {
            self.nameTitleLabel.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.nameTitleLabel.textColor = .defaultText
            self.nameTitleLabel.text = "breaking_bad_detail_name_title".localized
        }
    }
    @IBOutlet weak var nameDetailLabel: UILabel! {
        didSet {
            self.nameDetailLabel.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var categoryTitleLabel: UILabel! {
        didSet {
            self.categoryTitleLabel.font = .systemFont(ofSize: 17,
                                            weight: .bold)
            self.categoryTitleLabel.textColor = .defaultText
            self.categoryTitleLabel.text = "breaking_bad_detail_category_title".localized
        }
    }
    @IBOutlet weak var categoryDetailLabel: UILabel! {
        didSet {
            self.categoryDetailLabel.textColor = .defaultText
        }
    }
    
    @IBOutlet weak var actionButton: FavoriteButton! {
        didSet {
            self.actionButton.delegate = self
        }
    }
    
    // MARK: - Properties
    
    var viewModel: BreakingBadDetailViewModelProtocol?
    weak var delegate: BreakingBadDetailViewControllerDelegate?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel?.fillData()
    }
    
    // MARK: - Methods
    
    func setupUI() {
        self.title = self.viewModel?.title
        self.view.backgroundColor = .xF6F6F6
    }
    
    func setupBindings() {
        self.viewModel?.urlPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.image.loadThumbnail(urlSting: value)
            })
            .store(in: &subscriptions)
        
        self.viewModel?.nicknamePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.nickDetailLabel.text = value
            })
            .store(in: &subscriptions)
        
        self.viewModel?.namePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.nameDetailLabel.text = value
            })
            .store(in: &subscriptions)
        
        self.viewModel?.categoryPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.categoryDetailLabel.text = value
            })
            .store(in: &subscriptions)

    }
    
}

extension BreakingBadDetailViewController: FavoriteButtonDelegate {
    func favoriteButton(_ favoriteButton: FavoriteButton,
                        didChangeValue value: Bool) {
        self.delegate?.favorite(charId: self.viewModel?.charId,
                                didChangeValue: value)
    }
}
