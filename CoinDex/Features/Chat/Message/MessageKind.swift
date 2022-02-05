//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

enum MessageKind {
    case text(String)
    case image(MediaItem)
}

extension MessageKind: Equatable {}
