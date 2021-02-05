# LunchTracker

This is a simple and silly UIKit-based iOS app that demonstrates how you might render a view of an external, asynchronous data stream.

[`EmojiTracker`](LunchTracker/Models/EmojiTracker.swift) uses cutting-edge sensors to track nearby emoji matching a client-specified list. It can only track one emoji at a time, but it may decide to track a different emoji at any time. It sends position updates for the currently-tracked emoji at irregular intervals to its delegate, via the [`EmojiTrackerDelegate`](LunchTracker/Models/EmojiTrackerDelegate.swift) protocol.

Initially, `EmojiTracker` doesn't know which one of the specified emoji it is tracking, but it is able to identify it via computationally-expensive and patented algorithms. A client may request identification of the currently-tracked emoji by calling `EmojiTracker`'s `identifyCurrentTarget(callback:)` method. A callback is used because the identification takes an unpredictably lengthy amount of time.

LunchTracker uses `EmojiTracker` to plot the location of nearby lunch-item emoji, and provides a button to initiate emoji identification. Remember, `EmojiTracker` may decide to track another emoji at any time, so initiate identification frequently!
