//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class TutorialPageViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.font = .systemFont(ofSize: 17,
                                               weight: .medium)
        }
    }

    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            self.bodyLabel.font = .systemFont(ofSize: 15)
            self.bodyLabel.numberOfLines = 0
        }
    }

    // MARK: - Properties

    var model: TutorialPageModel?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView?.isHidden = model?.imageName == nil
        imageView.image = model?.imageName?.textToImage(with: .systemFont(ofSize: 300))  //UIImage(named: model?.imageName ?? .empty)

        titleLabel?.isHidden = model?.title == nil
        titleLabel?.text = model?.title

        bodyLabel?.isHidden = model?.body == nil
        bodyLabel?.text = model?.body
    }

}
