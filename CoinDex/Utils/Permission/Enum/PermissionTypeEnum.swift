//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public enum PermissionTypeEnum: Int {

    case camera = 0
    case photoLibrary = 1
    case notification = 2
    case microphone = 3
    case calendar = 4
    case contacts = 5
    case reminders = 6
    case speech = 7
    case locationWhenInUse = 9
    case locationAlways = 10
    case motion = 11
    case mediaLibrary = 12
    case bluetooth = 13
    case tracking = 14
    case faceID = 15
    case siri = 16
    case health = 17

    public var name: String {
        switch self {
        case .camera:
            return "Camera"
        case .photoLibrary:
            return "Photo Library"
        case .microphone:
            return "Microphone"
        case .calendar:
            return "Calendar"
        case .contacts:
            return "Contacts"
        case .reminders:
            return "Reminders"
        case .speech:
            return "Speech"
        case .locationAlways:
            return "Location Always"
        case .motion:
            return "Motion"
        case .mediaLibrary:
            return "Media Library"
        case .bluetooth:
            return "Bluetooth"
        case .notification:
            return "Notification"
        case .locationWhenInUse:
            return "Location When In Use"
        case .tracking:
            return "Tracking"
        case .faceID:
            return "FaceID"
        case .siri:
            return "Siri"
        case .health:
            return "Health"
        }
    }
}
