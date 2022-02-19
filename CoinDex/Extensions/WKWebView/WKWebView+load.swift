//
//  Copyright © 2022 CCT. All rights reserved.
//


import WebKit

extension WKWebView {

    func load(fileName: String) {
        guard let bundleURL = Bundle.main.resourceURL?.absoluteURL else {
            return
        }
        let file = bundleURL.appendingPathComponent(fileName)
        self.loadFileURL(file, allowingReadAccessTo: bundleURL)
    }

    func load(stringURL: String?) {
        guard let stringURL = stringURL,
            let url = URL(string: stringURL) else {
                  return
              }
        let request = URLRequest(url: url)
        DispatchQueue.main.async {
            self.load(request)
        }
    }
}
