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
            self.pageContainer.backgroundColor = .clear
            self.pageContainer.addFullSubview(view: self.pageViewController?.view ?? UIView())
        }
    }

    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            self.closeButton.tintColor = .xFFFFFF
            self.closeButton.isHidden = true
            self.closeButton.setImage(.common.closeIcon,
                                      for: .normal)
            self.closeButton.addTarget(self,
                                       action: #selector(self.closeButtonAction),
                                       for: .touchUpInside)
        }
    }


    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private var pageViewController: UIPageViewController?  {
        didSet {
            self.pageViewController?.dataSource = self
            self.pageViewController?.delegate = self

            let pageControl = UIPageControl.appearance()
            pageControl.pageIndicatorTintColor = .xFFFFFF.withAlphaComponent(0.5)
            pageControl.currentPageIndicatorTintColor = .xFFFFFF

            guard let pages = self.pages,
                  let firstViewController = pages.first else { return }

            self.pageViewController?.setViewControllers([firstViewController],
                                                        direction: .forward,
                                                        animated: false,
                                                        completion: nil)
        }
    }

    private var pages: [UIViewController]?
    private var currentPageIndex: Int = 0

    var presenter: TutorialPresenterProtocol? {
        didSet {
            var viewControllers: [UIViewController]? = []
            self.presenter?.dataSource?.forEach { item in
                if let model = item as? TutorialPageModel {
                    let assembler = TutorialPageAssembler(model: model)
                    viewControllers?.append(assembler.viewController())
                }
            }
            self.pages = viewControllers
        }
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    // MARK: - Methods

    func setupUI() {
        self.view.setGradient(start: .center,
                              end: .bottomCenter,
                              colors: [.primary,
                                       .secondary])
        self.presenter?.view = self
        
        self.title = self.presenter?.title
    }
    
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

extension TutorialViewController: TutorialViewProtocol {

}
