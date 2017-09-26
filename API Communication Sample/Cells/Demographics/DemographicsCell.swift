//
//  DemographicsCell.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class DemographicsCell: UICollectionViewCell {

    @IBOutlet weak var malePercentageLabel: UILabel!
    @IBOutlet weak var femalePercentageLabel: UILabel!
    
    @IBOutlet weak var group1PercentageLabel: UILabel!
    @IBOutlet weak var group2PercentageLabel: UILabel!
    @IBOutlet weak var group3PercentageLabel: UILabel!
    @IBOutlet weak var group4PercentageLabel: UILabel!
    @IBOutlet weak var group5PercentageLabel: UILabel!
    @IBOutlet weak var group6PercentageLabel: UILabel!
    
    @IBOutlet weak var groupsPercentageView: UIView!
    
    @IBOutlet weak var group1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var group2HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var group3HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var group4HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var group5HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var group6HeightConstraint: NSLayoutConstraint!

    func setMalePercentage(_ percentage: Float) {
        setPercentage(percentage, label: malePercentageLabel)
    }
    
    func setFemalePercentage(_ percentage: Float) {
        setPercentage(percentage, label: femalePercentageLabel)
    }
    
    func setDemographicsAge(_ ages: [DemographicsAge]) {
        let percentageMax = ages.sorted(by: { $0.0.value > $0.1.value}).first?.value ?? 0
        for age in ages {
            let labelConstraint: (label: UILabel, constarint: NSLayoutConstraint)? = {
                guard let ageGroup = age.ageGroup else { return nil }
                switch (ageGroup) {
                case .group1:
                    return (group1PercentageLabel, group1HeightConstraint)
                case .group2:
                    return (group2PercentageLabel, group2HeightConstraint)
                case .group3:
                    return (group3PercentageLabel, group3HeightConstraint)
                case .group4:
                    return (group4PercentageLabel, group4HeightConstraint)
                case .group5:
                    return (group5PercentageLabel, group5HeightConstraint)
                case .group6:
                    return (group6PercentageLabel, group6HeightConstraint)
                }
            }()
            
            if let labelConstraint = labelConstraint {
                setPercentage(age.value, label: labelConstraint.label)
                setPercentage(age.value, percentageMax: percentageMax, constraint: labelConstraint.constarint)
            }
        }
        
    }
    
    private func setPercentage(_ percentage: Float, label: UILabel) {
        label.text = "\(Int(percentage))%"
    }
    
    private func setPercentage(_ percentage: Float, percentageMax: Float, constraint: NSLayoutConstraint) {
        constraint.constant = (CGFloat(Int(percentage / percentageMax * 100)) / 100 - 1.0) * groupsPercentageView.frame.height
    }
}
