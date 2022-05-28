//
//  Copyright © 2022 CCT. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView! {
        didSet {
            self.scrollView.delegate = self
            self.scrollView.isPagingEnabled = true
            self.scrollView.showsHorizontalScrollIndicator = false
        }
    }
    let stackView = UIStackView()

    private var pages: [UIView]?
    @IBOutlet var pageControl: ScrollingPageControl! {
        didSet {
            self.pageControl.backgroundColor = .clear
        }
    }
    var viewModel: TutorialViewModelProtocol? {
        didSet {
            var viewControllers: [UIView]? = []
            self.viewModel?.datasource?.forEach { item in
                if let model = item as? TutorialPageModel {
                    let assembler = TutorialPageAssembler(model: model)
                    viewControllers?.append(assembler.viewController().view)
                }
            }
            self.pages = viewControllers
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setGradient(start: .center,
                              end: .bottomCenter,
                              colors: [.primary,
                                       .secondary])


        pageControl.pages = pages?.count ?? 0
//        pageControl.delegate = self

        view.addSubview(scrollView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear

        scrollView.addSubview(stackView)

        pages?.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
            item.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        }

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }

}

extension TestViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.selectedPage = Int(page)
    }
}

extension TestViewController: ScrollingPageControlDelegate {
    func viewForDot(at index: Int) -> UIView? {
        guard index == 0 else { return nil }
        let view = TriangleView()
        view.isOpaque = false
        return view
    }
}

import UIKit

class TriangleView: UIView {

    override func tintColorDidChange() {
        super.tintColorDidChange()
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.close()

        tintColor?.setFill()
        path.fill()
    }

}
