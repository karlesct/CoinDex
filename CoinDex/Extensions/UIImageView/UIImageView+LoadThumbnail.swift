//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

// MARK: - UIImageView extension
extension UIImageView {
    
    /// This loadThumbnail function is used to download thumbnail image using urlString
    /// This method also using cache of loaded thumbnail using urlString as a key of cached thumbnail.
    func loadThumbnail(urlSting: String) {
        guard let url = URL(string: urlSting) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            
            if let _ = error {
                DispatchQueue.main.async {
                    self?.image = .common.noImageIcon
                }
                return
            }
            
            guard let data = data,
                  error == nil else {
                return
            }
            
            guard let imageToCache = UIImage(data: data) else { return }
            imageCache.setObject(imageToCache,
                                 forKey: urlSting as AnyObject)
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }).resume()
    }
}
