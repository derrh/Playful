//
//  PlaygroundError.swift
//  Playful
//
//  Created by Derrick Hathaway on 10/22/16.
//  Copyright © 2016 Derrick Hathaway. All rights reserved.
//

import Foundation

enum PlayfulError: Error {
    case failedToLoadTemplate
    case failedToAppendCode
    case malformedPlayground
}
