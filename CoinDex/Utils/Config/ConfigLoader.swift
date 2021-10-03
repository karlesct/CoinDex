//
//  Copyright © 2021 CCT. All rights reserved.
//


import Foundation

class ConfigLoader {
    static let ConfigName = "Config.plist"
    static func parseFile(named fileName: String = ConfigName) -> Configuration {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
              let fileData = FileManager.default.contents(atPath: filePath)
        else {
            fatalError("Config file '\(fileName)' not loadable!")
        }
        do {
            let config = try PropertyListDecoder().decode(Configuration.self, from: fileData)
            return config
        } catch {
            fatalError("Configuration not decodable from '\(fileName)': \(error)")
        }
    }
}

struct Configuration: Decodable {
    let API: configs?
//    let testFlags: TestFlags?
}

struct configs: Decodable {
    let Scheme: String
    let Host: String
    let Port: String
    let Path: String
}
