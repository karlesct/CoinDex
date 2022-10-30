//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Contacts

public extension Permission {
    
    static var contacts: ContactsPermission {
        return ContactsPermission()
    }
}

public class ContactsPermission: Permission {
    
    open override var type: PermissionTypeEnum { .contacts }
    open var usageDescriptionKey: String? { "NSContactsUsageDescription" }
    
    public override var status: PermissionStatusEnum {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: { (granted, error) in
            DispatchQueue.main.async {
                completion()
            }
        })
    }
}
