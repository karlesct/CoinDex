//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol TutorialViewModelProtocol: TitleProtocol,
                                    DatasourceProtocol {
    var view: TutorialViewProtocol? { get set }
}

protocol TutorialViewProtocol: AnyObject {
}

class TutorialViewModel: TutorialViewModelProtocol {

    // MARK: - Properties
    
    var title: String = "tutorial_title".localized

    var dataSource: [TModel]? = [
        TutorialPageModel(imageName: "tutorial_image_page_1".localized,
                          title: "tutorial_title_page_1".localized,
                          body: "tutorial_body_page_1".localized),
        TutorialPageModel(imageName: "tutorial_image_page_2".localized,
                          title: "tutorial_title_page_2".localized,
                          body: "tutorial_body_page_2".localized),
        TutorialPageModel(imageName: "tutorial_image_page_3".localized,
                          title: "tutorial_title_page_3".localized,
                          body: "tutorial_body_page_3".localized),
        TutorialPageModel(imageName: "tutorial_image_page_4".localized,
                          title: "tutorial_title_page_4".localized,
                          body: "tutorial_body_page_4".localized),
    ]
    
    weak var view: TutorialViewProtocol?

    // MARK: - Init
    
    init() {
    }

    // MARK: - Methods

}
