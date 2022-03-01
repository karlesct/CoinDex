//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit


public protocol PermissionsProviderProtocol {

    static func request(permission: Permission,
                        completion: @escaping (Bool) -> Void)

}

class PermissionsProvider: PermissionsProviderProtocol {

    public static func request(permission: Permission,
                               completion: @escaping (Bool) -> Void)  {
        permission.request(completion: {
            if permission.authorized {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
}
