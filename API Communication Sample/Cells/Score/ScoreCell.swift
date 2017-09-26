//
//  ScoreCell.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

private let dash = "‒"

class ScoreCell: UICollectionViewCell {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var videoScoreLabel: UILabel!
    @IBOutlet weak var photoScoreLabel: UILabel!
    @IBOutlet weak var linkScoreLabel: UILabel!
    
    @IBOutlet weak var expandedView: UIView!
    
    var isExpanded: Bool = false {
        didSet {
            expandedView.isHidden = !isExpanded
        }
    }
    
    func setScore(_ score: Float?) {
        setScore(score: score, label: scoreLabel)
    }
    
    func setVideoScore(_ score: Float?) {
        setScore(score: score, label: videoScoreLabel)
    }
    
    func setPhotoScore(_ score: Float?) {
        setScore(score: score, label: photoScoreLabel)
    }
    
    func setLinkScore(_ score: Float?) {
        setScore(score: score, label: linkScoreLabel)
    }
    
    private func setScore(score: Float?, label: UILabel) {
        if let score = score {
            label.text = String(format: "%.1f", arguments: [score])
        } else {
            label.text = dash
        }
    }
}
