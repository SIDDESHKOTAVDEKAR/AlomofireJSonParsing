//
//  genderizeModel.swift
//  AlomofireJSonParsing
//
//  Created by Siddhesh Kotavdekar on 11/22/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Welcome
struct genderizeModel: Codable {
    let name, gender: String
    let probability: Double
    let count: Int
}
