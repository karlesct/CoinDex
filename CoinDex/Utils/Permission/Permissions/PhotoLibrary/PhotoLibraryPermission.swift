//
//  Copyright © 2022 CCT. All rights reserved.
//


import Photos

public extension Permission {

    static var photoLibrary: PhotoLibraryPermission {
        return PhotoLibraryPermission()
    }
}

public class PhotoLibraryPermission: Permission {

    open override var type: PermissionTypeEnum { .photoLibrary }

    open var fullAccessUsageDescriptionKey: String? {
        "NSPhotoLibraryUsageDescription"
    }

    open var addingOnlyUsageDescriptionKey: String? {
        "NSPhotoLibraryAddUsageDescription"
    }

    public override var status: PermissionStatusEnum {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .limited: return .authorized
        @unknown default: return .denied
        }
    }

    public override func request(completion: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization({
            finished in
            DispatchQueue.main.async {
                completion()
            }
        })
    }
}
