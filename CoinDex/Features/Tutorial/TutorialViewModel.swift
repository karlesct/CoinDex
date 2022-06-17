//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol TutorialViewModelProtocol {
    var datasource: [TModel]? { get set }
}

class TutorialViewModel: TutorialViewModelProtocol {

    // MARK: - Properties

    var datasource: [TModel]? = [
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

    // MARK: - Init

    // MARK: - Methods

}
