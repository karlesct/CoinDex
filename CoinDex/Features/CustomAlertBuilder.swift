//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

class CustomAlert: UIViewController {
    //MARK: - Properties
    
    public lazy var backgroundView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .x80000000
        return view
    }()
    
    private lazy var containerView: UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .xFFFFFF
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var buttonVerticalContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .trailing
        
        
        return stackView
    }()
    
    private lazy var buttonHorizontalContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .trailing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class Builder {
        
        private var titleLabel: UILabel?
        private var bodyLabel: UILabel?
        private var views: [UIView] = []
        private var buttons: [UIButton] = []
        
        // MARK: - Init

        init() {
        }

        // MARK: - Methods
        
        func with(titleLabel: UILabel?) -> Builder {
            self.titleLabel = titleLabel
            return self
        }
        
        func with(bodyLabel: UILabel?) -> Builder {
            self.bodyLabel = bodyLabel
            return self
        }
        
        func with(view: UIView) -> Builder {
            self.views.append(view)
            return self
        }
        
        func with(button: UIButton) -> Builder {
            self.buttons.append(button)
            return self
        }
        
        func build() -> CustomAlert {
            
            let customAlert = CustomAlert()
            
            customAlert.view.addFullSubview(view: customAlert.backgroundView)
            
            customAlert.backgroundView.addSubview(customAlert.containerView)
            
            NSLayoutConstraint.activate([
                customAlert.containerView
                    .centerXAnchor
                    .constraint(equalTo: customAlert.backgroundView
                        .centerXAnchor),
                customAlert.containerView
                    .centerYAnchor
                    .constraint(equalTo: customAlert.backgroundView
                        .centerYAnchor),
                customAlert.containerView
                    .leadingAnchor
                    .constraint(lessThanOrEqualTo: customAlert.backgroundView
                        .leadingAnchor,
                                constant: 20),
                customAlert.containerView
                    .trailingAnchor
                    .constraint(lessThanOrEqualTo: customAlert.backgroundView
                        .trailingAnchor,
                                constant: -20)
            ])
            
            customAlert.containerView
                .addSubview(customAlert.containerStackView)
            
            
            
            NSLayoutConstraint.activate([
                customAlert.containerStackView
                    .topAnchor
                    .constraint(equalTo: customAlert.containerView
                        .topAnchor,
                                constant: 20),
                customAlert.containerStackView
                    .bottomAnchor
                    .constraint(equalTo: customAlert.containerView
                        .bottomAnchor,
                                constant: -20),
                customAlert.containerStackView
                    .leadingAnchor
                    .constraint(equalTo: customAlert.containerView
                        .leadingAnchor,
                                constant: 20),
                customAlert.containerStackView
                    .trailingAnchor
                    .constraint(equalTo: customAlert.containerView
                        .trailingAnchor,
                                constant: -20)
            ])
            
            if let titleLabel = self.titleLabel {
                customAlert.containerStackView.addArrangedSubview(titleLabel)
            }
            
            if let bodyLabel = self.bodyLabel {
                customAlert.containerStackView.addArrangedSubview(bodyLabel)
            }
            
            self.views.forEach {
                customAlert.containerStackView.addArrangedSubview($0)
            }
            
            customAlert.containerStackView.addArrangedSubview(customAlert.buttonVerticalContainerStackView)
            customAlert.buttonVerticalContainerStackView.addArrangedSubview(customAlert.buttonHorizontalContainerStackView)
            
            self.buttons.forEach {
                customAlert.buttonHorizontalContainerStackView.addArrangedSubview($0)
            }

            return customAlert

        }
        
    }
    
}
