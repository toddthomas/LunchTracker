//
//  EmojiTrackerDelegate.swift
//  LunchTracker
//
//  Created by Todd Thomas on 2/4/21.
//

import Foundation

protocol EmojiTrackerDelegate {
    /// Most recent position of the currently-tracked emoji. Both `x` and `y` are in the range
    /// [0.0, 1.0].
    func updatePosition(x: Float, y: Float)
}
