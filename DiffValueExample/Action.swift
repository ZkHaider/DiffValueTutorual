//
//  Action.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

public protocol Action {}

public protocol CodableAction: Action, Codable {}
