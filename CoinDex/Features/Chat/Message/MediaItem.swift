//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol MediaItemProtocol {
    var url: URL? { get }                   // The url where the media is located.
    var image: UIImage? { get }             // The image.
    var placeholderImage: UIImage { get }   // A placeholder image for when the image is obtained asynchronously.
    var size: CGSize { get }                // The size of the media item.
}

struct MediaItem: MediaItemProtocol {
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
    var senderName: String
}
