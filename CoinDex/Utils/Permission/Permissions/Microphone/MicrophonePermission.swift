//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import AVFoundation

public extension Permission {

    static var microphone: MicrophonePermission {
        return MicrophonePermission()
    }
}

public class MicrophonePermission: Permission {

    open override var type: PermissionTypeEnum { .microphone }

    open var usageDescriptionKey: String? { "NSMicrophoneUsageDescription" }

    public override var status: PermissionStatusEnum {
        switch  AVAudioSession.sharedInstance().recordPermission {
        case .granted: return .authorized
        case .denied: return .denied
        case .undetermined: return .notDetermined
        @unknown default: return .denied
        }
    }

    public override func request(completion: @escaping () -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission {
            granted in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
