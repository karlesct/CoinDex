//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol PermissionProtocol {
    var authorized: Bool { get }
    var denied: Bool { get }
    var notDetermined: Bool { get }
    func openSettingPage()

    var type: PermissionTypeEnum { get }
    var status: PermissionStatusEnum { get }
    func request(completion: @escaping () -> Void)
}


open class Permission: PermissionProtocol {

    open var authorized: Bool {
        return status == .authorized
    }

    open var denied: Bool {
        return status == .denied
    }

    open var notDetermined: Bool {
        return status == .notDetermined
    }

    open func openSettingPage() {
        DispatchQueue.main.async {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: nil)
            }
        }
    }

    // MARK: Must Ovveride

    open var type: PermissionTypeEnum {
        preconditionFailure("This method must be overridden.")
    }

    open var status: PermissionStatusEnum {
        preconditionFailure("This method must be overridden.")
    }

    open func request(completion: @escaping () -> Void) {
        preconditionFailure("This method must be overridden.")
    }

    // MARK: - Init

    public init() {}
}

extension Permission: Equatable {
    public static func == (lhs: Permission, rhs: Permission) -> Bool {
        return lhs.type == rhs.type
    }
}
