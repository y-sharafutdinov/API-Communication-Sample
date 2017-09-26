//
//  AudienceController.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import Alamofire

private let demographicsCellIdentifier = "DemographicsCell"
private let audienceCellIdentifier = "AudienceCell"

class AudienceController: CollectionController {

    var audienceData: AudienceData?
    var requestGroup: DispatchGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.register(UINib(nibName: "DemographicsCell", bundle: .main), forCellWithReuseIdentifier: demographicsCellIdentifier)
        contentView.register(UINib(nibName: "AudienceCell", bundle: .main), forCellWithReuseIdentifier: audienceCellIdentifier)
    }
    
    override func reloadData() {
        super.reloadData()
    
        guard self.requestGroup == nil else { return }
        
        let group = DispatchGroup()
        requestGroup = group
        
        var audienceValuesResponse: DataResponse<Data<AudienceValues>>? = nil
        var audienceGrowthResponse: DataResponse<DataArray<AudienceGrowth>>? = nil
        var demographicsAgeResponse: DataResponse<DataArray<DemographicsAge>>? = nil
        var demographicsGenderResponse: DataResponse<Data<DemographicsGender>>? = nil
        
        if let request = APIRouter.audienceValues.dataRequest() {
            group.enter()
            request.responseObject(completionHandler: { (response: DataResponse<Data<AudienceValues>>) in
                audienceValuesResponse = response
                group.leave()
            })
        }
        
        if let request = APIRouter.audienceGrowth.dataRequest() {
            group.enter()
            request.responseObject(completionHandler: { (response: DataResponse<DataArray<AudienceGrowth>>) in
                audienceGrowthResponse = response
                group.leave()
            })
        }
        
        if let request = APIRouter.demographicsAge.dataRequest() {
            group.enter()
            request.responseObject(completionHandler: { (response: DataResponse<DataArray<DemographicsAge>>) in
                demographicsAgeResponse = response
                group.leave()
            })
        }
        
        if let request = APIRouter.demographicsGender.dataRequest() {
            group.enter()
            request.responseObject(completionHandler: { (response: DataResponse<Data<DemographicsGender>>) in
                demographicsGenderResponse = response
                group.leave()
            })
        }
        
        group.notify(queue: .main) {
            if let values = audienceValuesResponse?.value?.data,
                let growth = audienceGrowthResponse?.value?.data,
                let age = demographicsAgeResponse?.value?.data,
                let gender = demographicsGenderResponse?.value?.data {
                self.audienceData = AudienceData(values: values, growth: growth, age: age, gender: gender)
                self.contentView.reloadData()
                self.state = .content
            } else {
                self.errorMessageLabel.text = "Server Error"
                self.state = .error
            }
            
            self.requestGroup = nil
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return audienceData == nil ? 0 : 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: contentView.frame.width, height: 400.0)
        } else {
            return CGSize(width: contentView.frame.width, height: 150.0)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: demographicsCellIdentifier, for: indexPath) as! DemographicsCell
            if let audienceData = audienceData {
                cell.setMalePercentage(audienceData.gender.male)
                cell.setFemalePercentage(audienceData.gender.male)
                cell.setDemographicsAge(audienceData.age)
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: audienceCellIdentifier, for: indexPath) as! AudienceCell
            if let audienceData = audienceData {
                if let minDate = audienceData.growth.first?.date,
                    let maxDate = audienceData.growth.last?.date {
                    
                    let calendar = NSCalendar.current
                    let date1 = calendar.startOfDay(for: minDate.parseDateWithFormat("yyyy-MM-dd")!)
                    let date2 = calendar.startOfDay(for: maxDate.parseDateWithFormat("yyyy-MM-dd")!)
                    
                    var flags: Set<Calendar.Component> = Set()
                    flags.insert(Calendar.Component.day)
                    
                    let components = calendar.dateComponents(flags, from: date1, to: date2)
                    cell.daysLabel.text = "Last \(components.day!) days"
                } else {
                    cell.daysLabel.text = "Last days"
                }
                
                cell.goalLabel.attributedText = NSMutableAttributedString()
                    .bold("\(audienceData.values.menaPercentage!)%")
                    .normal(" of goal")
                
                let difference: Float = {
                    if audienceData.growth.count >= 2 {
                        return (audienceData.growth.last!.mena.size! - audienceData.growth.first!.mena.size!)  / 1000.0
                    }
                    return 0.0
                }()
                
                let differenceString = NSMutableAttributedString().normal(String(format: "%.1f", audienceData.values.menaSize / 100000.0) + "m ")
                if (difference > 0) {
                    differenceString.normal(String(format: "\(difference > 0 ? "+" : "")%.0fk", difference), color: difference > 0 ? UIColor.green : UIColor.red)
                }
                cell.difference.attributedText = differenceString
            }
            return cell
        }
    }
}
