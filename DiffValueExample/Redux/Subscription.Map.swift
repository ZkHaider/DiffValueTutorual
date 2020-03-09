//
//  Subscription.Map.swift
//  DiffValueExample
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import Foundation

internal final class SubscriptionMap {
    var map: [String: WeakKeyDictionary<AnyObject, AnyListener>] = [:]
}
