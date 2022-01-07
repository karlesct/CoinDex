//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import UIKit

class TutorialViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var pageContainer: UIView! {
        didSet {
            self.pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                           navigationOrientation: .horizontal,
                                                           options: nil)
            self.pageContainer.addFullSubview(self.pageViewController?.view ?? UIView())
        }
    }

    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            self.closeButton.addTarget(self,
                                       action: #selector(self.closeButtonAction),
                                       for: .touchUpInside)
        }
    }


    // MARK: - Properties

    private var pageViewController: UIPageViewController?  {
        didSet {
            self.pageViewController?.dataSource = self
            self.pageViewController?.delegate = self

            let pageControl = UIPageControl.appearance()
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.currentPageIndicatorTintColor = .red

            guard let pages = pages,
                  let firstViewController = pages.first else { return }

            self.pageViewController?.setViewControllers([firstViewController],
                                                        direction: .forward,
                                                        animated: false,
                                                        completion: nil)
        }
    }

    private var pages: [UIViewController]?
    private var currentPageIndex: Int = 0

    var viewModel: TutorialViewModelProtocol? {
        didSet {
            var viewControllers: [UIViewController]? = []
            self.viewModel?.datasource?.forEach { item in
                if let model = item as? TutorialPageModel {
                    let assembler = TutorialPageAssembler(model: model)
                    viewControllers?.append(assembler.viewController())
                }
            }
            self.pages = viewControllers
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methods

    @objc func closeButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }

}


extension TutorialViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let pageIndex = self.currentPageIndex - 1
        if let pageCount = self.pages?.count, 0 ... pageCount - 1 ~= pageIndex {
            return self.pages?[pageIndex]
        } else {
            return nil
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageIndex = self.currentPageIndex + 1
        if let pageCount = self.pages?.count, 0 ... pageCount - 1 ~= pageIndex {
            return self.pages?[pageIndex]
        } else {
            return nil
        }
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages?.count ?? 0
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentPageIndex
    }
}

extension TutorialViewController: UIPageViewControllerDelegate {

    private struct NavigationPage {
        static var pendingIndex: Int = 0
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            willTransitionTo pendingViewControllers: [UIViewController]) {
        NavigationPage.pendingIndex = self.pages?.firstIndex{ $0 == pendingViewControllers.first } ?? NSNotFound
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {

        guard completed else {
            return
        }

        self.currentPageIndex = NavigationPage.pendingIndex
    }
}
