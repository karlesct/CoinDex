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
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension CustomAlert {
    class Builder {
        private var view: UIView?
        
        // MARK: - Init

        init() {
        }

        // MARK: - Methods
        
        func with(view: UIView) -> Builder {
            self.view = view
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
            
            guard let view = self.view else {
                return customAlert
            }
            
            customAlert.containerView
                .addSubview(view)
            
            NSLayoutConstraint.activate([
                view
                    .topAnchor
                    .constraint(equalTo: customAlert.containerView
                        .topAnchor,
                                constant: 20),
                view
                    .bottomAnchor
                    .constraint(equalTo: customAlert.containerView
                        .bottomAnchor,
                                constant: -20),
                view
                    .leadingAnchor
                    .constraint(equalTo: customAlert.containerView
                        .leadingAnchor,
                                constant: 20),
                view
                    .trailingAnchor
                    .constraint(equalTo: customAlert.containerView
                        .trailingAnchor,
                                constant: -20)
            ])
            
            return customAlert

        }
        
    }
}
