//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

//public protocol ImagePickerDelegate: AnyObject {
//    func didSelect(image: UIImage?)
//}

//final class ImagePicker: NSObject {
//
//    private let pickerController: UIImagePickerController
//    private weak var presentationController: UIViewController?
//    private weak var delegate: ImagePickerDelegate?
//
//    public init(presentationController: UIViewController,
//                delegate: ImagePickerDelegate) {
//
//        self.pickerController = UIImagePickerController()
//
//        super.init()
//
//        self.pickerController.delegate = self
//        self.pickerController.navigationController?.delegate = self
//        self.pickerController.mediaTypes = ["public.image"]
//
//        self.presentationController = presentationController
//        self.delegate = delegate
//    }
//
//    public func present(from sourceView: UIView) {
//
//        var alertController = UIAlertController.Builder().withPreferredStyle(.actionSheet)
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            alertController = alertController.addActionWithTitle("Take photo") { _ in
//                self.pickerController.sourceType = .camera
//
//                DispatchQueue.main.async {
//                    self.presentationController?.present(self.pickerController,
//                                                         animated: true)
//                }
//            }
//        }
//
//        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
//            alertController = alertController.addActionWithTitle("Camera roll") { _ in
//                self.pickerController.sourceType = .savedPhotosAlbum
//                DispatchQueue.main.async {
//                    self.presentationController?.present(self.pickerController,
//                                                         animated: true)
//                }
//            }
//        }
//
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            alertController = alertController.addActionWithTitle("Photo library") { _ in
//                self.pickerController.sourceType = .photoLibrary
//                DispatchQueue.main.async {
//                    self.presentationController?.present(self.pickerController,
//                                                         animated: true)
//                }
//            }
//        }
//
//        alertController = alertController.addActionWithTitle("Cancel",
//                                                             alertActionStyle: .cancel)
//
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            alertController = alertController.withSourceView(sourceView)
//                .withSourceRect(sourceView.bounds)
//                .withpermittedArrowDirections([.down, .up])
//        }
//        DispatchQueue.main.async {
//            self.presentationController?.present(alertController.build(),
//                                                 animated: true)
//        }
//
//    }
//
//    private func pickerController(_ controller: UIImagePickerController,
//                                  didSelect image: UIImage?) {
//        controller.dismiss(animated: true, completion: nil)
//
//        self.delegate?.didSelect(image: image)
//    }
//}
//
//extension ImagePicker: UIImagePickerControllerDelegate {
//
//    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        self.pickerController(picker,
//                              didSelect: nil)
//    }
//
//    public func imagePickerController(_ picker: UIImagePickerController,
//                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        if let image = info[.editedImage] as? UIImage {
//            return self.pickerController(picker,
//                                         didSelect: image)
//        }
//        if let image = info[.originalImage] as? UIImage {
//            return self.pickerController(picker,
//                                         didSelect: image)
//        }
//        self.pickerController(picker,
//                              didSelect: nil)
//    }
//}
//
//extension ImagePicker: UINavigationControllerDelegate {}

import UIKit
import AVFoundation
import Photos

protocol ImagePickerDelegate: AnyObject {
    func imagePicker(_ imagePicker: ImagePicker, grantedAccess: Bool,
                     to sourceType: UIImagePickerController.SourceType)
    func imagePicker(_ imagePicker: ImagePicker, didSelect image: UIImage)
    func cancelButtonDidClick(on imageView: ImagePicker)
}

class ImagePicker: NSObject {

    private weak var controller: UIImagePickerController?
    weak var delegate: ImagePickerDelegate? = nil

    func dismiss() { controller?.dismiss(animated: true, completion: nil) }
    func present(parent viewController: UIViewController, sourceType: UIImagePickerController.SourceType) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = sourceType
        self.controller = controller
        DispatchQueue.main.async {
            viewController.present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: Get access to camera or photo library

extension ImagePicker {

    private func showAlert(targetName: String, completion: ((Bool) -> Void)?) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alertVC = UIAlertController(title: "Access to the \(targetName)",
                                            message: "Please provide access to your \(targetName)",
                                            preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
                guard   let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                        UIApplication.shared.canOpenURL(settingsUrl) else { completion?(false); return }
                UIApplication.shared.open(settingsUrl, options: [:]) { [weak self] _ in
                    self?.showAlert(targetName: targetName, completion: completion)
                }
            }))
            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in completion?(false) }))
            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?
                .rootViewController?.present(alertVC, animated: true, completion: nil)
        }
    }

    func cameraAsscessRequest() {
        if delegate == nil { return }
        PermissionsProvider.request(permission: .camera) { result in
            let source = UIImagePickerController.SourceType.camera
            self.delegate?.imagePicker(self, grantedAccess: result,
                                       to: source)
        }
    }

    func photoGalleryAsscessRequest() {
        if delegate == nil { return }
        PermissionsProvider.request(permission: .notification) { result in
            let source = UIImagePickerController.SourceType.camera
            self.delegate?.imagePicker(self, grantedAccess: result,
                                       to: source)
        }


        PHPhotoLibrary.requestAuthorization { [weak self] result in
            guard let self = self else { return }
            let source = UIImagePickerController.SourceType.photoLibrary
            if result == .authorized {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.delegate?.imagePicker(self, grantedAccess: result == .authorized, to: source)
                }
            } else {
                self.showAlert(targetName: "photo gallery") { self.delegate?.imagePicker(self, grantedAccess: $0, to: source) }
            }
        }
    }
}

// MARK: UINavigationControllerDelegate

extension ImagePicker: UINavigationControllerDelegate { }

// MARK: UIImagePickerControllerDelegate

extension ImagePicker: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            delegate?.imagePicker(self, didSelect: image)
            return
        }

        if let image = info[.originalImage] as? UIImage {
            delegate?.imagePicker(self, didSelect: image)
        } else {
            print("Other source")
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.cancelButtonDidClick(on: self)
    }
}
