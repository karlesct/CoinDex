//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class TutorialPageViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.font = .systemFont(ofSize: 22,
                                               weight: .medium)
            self.titleLabel.numberOfLines = 0
            self.titleLabel.textColor = .xFFFFFF
        }
    }

    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            self.bodyLabel.font = .systemFont(ofSize: 16)
            self.bodyLabel.numberOfLines = 0
            self.bodyLabel.textColor = .xFFFFFF
        }
    }

    // MARK: - Properties

    var model: TutorialPageModel?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear

        imageView?.isHidden = model?.imageName == nil
        imageView.image = model?.imageName?.textToImage(with: .systemFont(ofSize: 300))  //UIImage(named: model?.imageName ?? .empty)

        titleLabel?.isHidden = model?.title == nil
        titleLabel?.text = model?.title

        bodyLabel?.isHidden = model?.body == nil
        bodyLabel?.text = model?.body
    }

}
