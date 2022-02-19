//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import WebKit

class TAndCViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var containerView: UIView!

    // MARK: - Properties

    private var wkWebView: WKWebView? = WKWebView()

    var stringURL: String?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []

        self.wkWebView = WKWebView(frame: .zero,
                                   configuration: webConfiguration)

        self.containerView.addFullSubview(view: self.wkWebView)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.wkWebView?.load(stringURL: stringURL)
    }


    // MARK: - Methods

}
