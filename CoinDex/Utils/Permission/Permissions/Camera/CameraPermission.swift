//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import AVFoundation

public extension Permission {

    static var camera: CameraPermission {
        return CameraPermission()
    }
}

public class CameraPermission: Permission {

    open override var type: PermissionTypeEnum { .camera }
    open var usageDescriptionKey: String? { "NSCameraUsageDescription" }

    public override var status: PermissionStatusEnum {
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }

    public override func request(completion: @escaping () -> Void) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {
            finished in
            DispatchQueue.main.async {
                completion()
            }
        })
    }
}
