//
//  ViewController.swift
//  LunchTracker
//
//  Created by Todd Thomas on 2/4/21.
//

import UIKit

class ViewController: UIViewController {
    let tracker = EmojiTracker(
        emojiToTrack: ["🥪", "🥙", "🌮", "🌯", "🍕", "🥗", "🍔", "🍱", "🌭", "🧆", "🥡", "🫔"]
    )

    @IBOutlet weak var emojiView: UILabel!
    @IBOutlet weak var identifyButton: UIButton!
    @IBOutlet weak var trackerView: UIView!
    
    @IBAction func identify(_ sender: Any) {
        identifyButton.setTitle("Identifying...", for: .normal)
        identifyButton.isEnabled = false
        emojiView.text = "?"
        tracker.identifyCurrentTarget { id in
            DispatchQueue.main.async {
                self.emojiView.text = id
                self.identifyButton.setTitle("Identify Lunch Item", for: .normal)
                self.identifyButton.isEnabled = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tracker.delegate = self
        tracker.startTracking()
    }
}

extension ViewController: EmojiTrackerDelegate {
    func updatePosition(x: Float, y: Float) {
        DispatchQueue.main.async {
            let viewX = self.trackerView.bounds.size.width * CGFloat(x)
            let viewY = self.trackerView.bounds.size.height * CGFloat(y)
            UIView.animate(withDuration: 0.5) {
                self.emojiView.center = CGPoint(x: viewX, y: viewY)
            }
        }
    }
}
