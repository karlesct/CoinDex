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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .x555555
        label.backgroundColor = .red
        label.numberOfLines = 0
        label.text = "Test"
        return label
    }()
    
    private lazy var sutitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .x555555
        label.backgroundColor = .red
        label.numberOfLines = 0
        label.text = "This is an example of sample text that goes on for a long time. This is an example of sample text that goes on for a long time."
        return label
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
        
        stackView.addArrangedSubview(self.buttonHorizontalContainerStackView)
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
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.red, for: .normal)
        button.setTitle("ACEPTAR", for: .normal)
        return button
    }()
    
    private lazy var buttonCancel: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.red, for: .normal)
        button.setTitle("CANCELAR", for: .normal)
        return button
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "iconEmoji")
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
//
//    init() {
//        self.setupUI()
//    }
    
    private func setupUI() {
        self.view.addFullSubview(view: self.backgroundView)
        
        self.backgroundView.addSubview(self.containerView)
        
        NSLayoutConstraint.activate([
            self.containerView
                .centerXAnchor
                .constraint(equalTo: self.backgroundView
                    .centerXAnchor),
            self.containerView
                .centerYAnchor
                .constraint(equalTo: self.backgroundView
                    .centerYAnchor),
            self.containerView
                .leadingAnchor
                .constraint(lessThanOrEqualTo: self.backgroundView
                    .leadingAnchor,
                            constant: 20),
            self.containerView
                .trailingAnchor
                .constraint(lessThanOrEqualTo: self.backgroundView
                    .trailingAnchor,
                            constant: -20)
        ])
        
        self.containerView
            .addSubview(self.containerStackView)
        
        
        
        NSLayoutConstraint.activate([
            self.containerStackView
                .topAnchor
                .constraint(equalTo: self.containerView
                    .topAnchor,
                            constant: 20),
            self.containerStackView
                .bottomAnchor
                .constraint(equalTo: self.containerView
                    .bottomAnchor,
                            constant: -20),
            self.containerStackView
                .leadingAnchor
                .constraint(equalTo: self.containerView
                    .leadingAnchor,
                            constant: 20),
            self.containerStackView
                .trailingAnchor
                .constraint(equalTo: self.containerView
                    .trailingAnchor,
                            constant: -20)
        ])
        
        self.containerStackView.addArrangedSubview(self.titleLabel)
        self.containerStackView.addArrangedSubview(self.sutitleLabel)
        self.containerStackView.addArrangedSubview(self.image)
        self.containerStackView.addArrangedSubview(self.buttonVerticalContainerStackView)
        self.buttonHorizontalContainerStackView.addArrangedSubview(self.button)
        self.buttonHorizontalContainerStackView.addArrangedSubview(self.buttonCancel)
        
        
    }
    
}

