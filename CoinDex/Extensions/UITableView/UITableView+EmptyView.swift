//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit

extension UITableView {
    func setEmptyView(body: String,
                      btTitle: String,
                      btAction: UIButton.ButtonAction) {
        let emptyView = UIView(frame: CGRect(x: self.center.x,
                                             y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))

        let label = UILabel.Builder()
            .with(text: body)
            .with(numberOfLines: 0)
            .with(textAlignment: .center)
            .build()

        let button = UIButton.Builder()
            .with(text: btTitle)
            .with(textColor: .xFFFFFF)
            .with(font: .systemFont(ofSize: 16, weight: .black))
            .with(rightInset: 50)
            .with(leftInset: 50)
            .with(height: 36)
            .with(buttonAction: btAction)
            .build()

        let stackview = UIStackView.Builder()
            .with(alignment: .center)
            .with(spacing: 50)
            .with(arrangedSubviews: [
                label,
                button
            ])
            .build()

        emptyView.addSubview(stackview)

        NSLayoutConstraint.activate([
            stackview
                .centerXAnchor
                .constraint(equalTo: emptyView
                    .centerXAnchor),
            stackview
                .centerYAnchor
                .constraint(equalTo: emptyView
                    .centerYAnchor),
            stackview
                .leadingAnchor
                .constraint(lessThanOrEqualTo: emptyView
                    .leadingAnchor,
                            constant: 20),
            stackview
                .trailingAnchor
                .constraint(lessThanOrEqualTo: emptyView
                    .trailingAnchor,
                            constant: -20)
        ])

        // The only tricky part is here:
        self.backgroundView = emptyView
    }

    func restore() {
        self.backgroundView = nil
    }
}
