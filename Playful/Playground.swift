//
//  Playground.swift
//  play
//
//  Created by Derrick Hathaway on 10/22/16.
//  Copyright © 2016 Derrick Hathaway. All rights reserved.
//

import Foundation


struct Playground {
    var url: URL
    
    init(named name: String, inDirectory directory: URL) throws {
        guard let templateURL = Bundle.playful.url(forResource: "Play", withExtension: "playground") else {
            throw PlayfulError.failedToLoadTemplate
        }
        
        let url = directory
            .appendingPathComponent(name)
            .appendingPathExtension("playground")
        
        try FileManager.default.copyItem(at: templateURL, to: url)
        
        self.url = url
    }
    
    
    var contentsDotSwiftURL: URL {
        return url.appendingPathComponent("Contents.swift")
    }

    func append(code: String) throws {
        let contentsURL = contentsDotSwiftURL
        print(contentsURL.path)
        guard FileManager.default.fileExists(atPath: contentsURL.path) else {
            throw PlayfulError.malformedPlayground
        }
        
        let contentsDotSwift = try FileHandle(forWritingTo: contentsURL)
        
        contentsDotSwift.seekToEndOfFile()
        
        guard let codeData = "\n\(code)\n"
                .data(using: .utf8) else {
            throw PlayfulError.failedToAppendCode
        }
        contentsDotSwift.write(codeData)
        contentsDotSwift.closeFile()
    }
}
