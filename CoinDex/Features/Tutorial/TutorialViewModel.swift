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
                          title: "Get a date",
                          body: "Swipe right to get a match with people you likefrom your area."),
        TutorialPageModel(imageName: "🥶",
                          title: "Private Message",
                          body: "Chat privately with people you match"),
        TutorialPageModel(imageName: "🥵",
                          title: "Send Photos",
                          body: "have fun with your matches by sending photos and videos to each other"),
        TutorialPageModel(imageName: "🤢",
                          title: "Get Notified",
                          body: "Receive notifications when you get messages and matches"),
    ]

    // MARK: - Init

    // MARK: - Methods

}
