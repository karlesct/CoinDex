//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class ChatViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var emojiButton: UIButton! {
        didSet {
            self.emojiButton.addTarget(self,
                                          action: #selector(self.emojiButtonAction),
                                          for: .touchUpInside)
            self.emojiButton.imageView?.image = UIImage(named: "iconEmoji")
            self.emojiButton.imageView?.tintColor = .primaryColor
        }
    }

    @IBOutlet weak var clipButton: UIButton! {
        didSet {
            self.clipButton.layer.cornerRadius = self.clipButton.frame.height / 2
            self.clipButton.setBackgroundColor(color: .x555555,
                                               for: .normal)
            self.clipButton.imageView?.image = UIImage(named: "iconClip")
            self.clipButton.imageView?.tintColor = .xFFFFFF
        }
    }
    @IBOutlet weak var messageTextViewContainer: UIView! {
        didSet {
            self.messageTextViewContainer.layer.borderWidth = 1
            self.messageTextViewContainer.layer.borderColor = UIColor.xE2E2E2.cgColor
            self.messageTextViewContainer.layer.cornerRadius = self.messageTextViewContainer.frame.height / 2
        }
    }

    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            self.sendButton.layer.cornerRadius = self.sendButton.frame.height / 2
            self.sendButton.setBackgroundColor(color: .primaryColor,
                                                for: .normal)
            self.sendButton.imageView?.image = UIImage(named: "iconSend")
            self.sendButton.imageView?.tintColor = .xFFFFFF
        }
    }

    @IBOutlet weak var messageTextView: EmojiTextView!

    // MARK: - Properties

    let safeInsets = UIApplication.shared.windows[0].safeAreaInsets


    var viewModel: ChatViewModelProtocol?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        self.hideKeyboardWhenTappedAround()
    }

    // MARK: - Methods

}


// MARK: - Button actions

extension ChatViewController {

    @objc func emojiButtonAction() {
        self.messageTextView.becomeFirstResponder()
    }

}

extension ChatViewController {

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height

        self.bottomConstraint?.constant = -keyboardHeight
        self.view.layoutIfNeeded()
    }

    //down
//    view.contentOffset = CGPoint(x: view.contentOffset.x, y: view.contentOffset.y - keyboardSize.height + safeInsets.bottom)
    //up
//    view.contentOffset = CGPoint(x: view.contentOffset.x, y: view.contentOffset.y + keyboardSize.height - safeInsets.bottom)


    @objc func keyboardWillHide(notification: NSNotification) {
        self.bottomConstraint?.constant = 0
        self.view.layoutIfNeeded()
    }
}

class EmojiTextView: UITextView {
    override var textInputMode: UITextInputMode? {
        .activeInputModes.first(where: { $0.primaryLanguage == "emoji" })
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
