//
//  EmojiTracker.swift
//  LunchTracker
//
//  Created by Todd Thomas on 2/4/21.
//

import Foundation

/// Service which tracks the location of nearby instances of a specified subset of emoji.
///
/// `EmojiTracker` can only track one emoji at a time, and it might decide to track a different emoji at
/// any time. Position updates for the currently-tracked emoji are provided to the specified
/// delegate at irregular intervals.
///
/// `EmojiTracker` can identify the emoji it is currently tracking. Emoji identification is
/// computationally expensive, and thus is performed asynchronously.
class EmojiTracker {
    private var emojiToTrack: Array<String>
    
    public var delegate: EmojiTrackerDelegate?

    init(emojiToTrack: Array<String>) {
        self.emojiToTrack = emojiToTrack
    }

    public func startTracking() {
        DispatchQueue.global(qos: .background).async {
            while true {
                sleep(UInt32.random(in: (1...4)))
                let randomFloatInZeroToOne = { Float.random(in: (0.0...1.0)) }
                let x = randomFloatInZeroToOne()
                let y = randomFloatInZeroToOne()
                self.delegate?.updatePosition(x: x, y: y)
            }
        }
    }

    public func identifyCurrentTarget(_ callback: @escaping (String) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(UInt32.random(in: (1...4)))
            callback(self.emojiToTrack.randomElement() ?? "?")
        }
    }
}
