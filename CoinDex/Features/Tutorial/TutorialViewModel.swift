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
        TutorialPageModel(imageName: "👽",
                          title: "Title1",
                          body: "Body1"),
        TutorialPageModel(imageName: "🥶",
                          title: "Title2",
                          body: "Body2"),
        TutorialPageModel(imageName: "🥵",
                          title: "Title3",
                          body: "Body3"),
        TutorialPageModel(imageName: "🤢",
                          title: "Title4",
                          body: "Body4"),
    ]

    // MARK: - Init

    // MARK: - Methods

}
