//
//  ScoresController.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

private let reuseIdentifier = "ScoreCell"

class ScoresController: CollectionController {
    
    var apiRoute: APIRouter? { return .scores }
    
    var dataRequest: DataRequest? {
        didSet {
            dataRequest?.responseObject(completionHandler: responseHandler)
        }
    }
    
    var scores: [ScoreItem]?
    var expandedScores: Set<IndexPath> = Set()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.register(UINib(nibName: "ScoreCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func reloadData() {
        super.reloadData()
        
        dataRequest = apiRoute?.dataRequest()
    }
    
    func responseHandler(_ response: DataResponse<Data<ScoresData>>) {
        if response.value != nil {
            scores = response.value?.data.items
            state = .content
            contentView.reloadData()
        } else {
            errorMessageLabel.text = response.error?.localizedDescription ?? "Unknown error"
            state = .error
        }
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scores?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScoreCell
        let score = scores![indexPath.row]
        cell.isExpanded = expandedScores.contains(indexPath)
        
        cell.titleLabel.text = score.type.title
        cell.colorView.backgroundColor = score.type.color
        
        cell.setScore(score.score)
        
        cell.setVideoScore(score.video?.score)
        cell.setPhotoScore(score.photo?.score)
        cell.setLinkScore(score.link?.score)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: expandedScores.contains(indexPath) ? 140.0 : 60.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if expandedScores.contains(indexPath) {
            expandedScores.remove(indexPath)
        } else {
            expandedScores.insert(indexPath)
        }
        collectionView.reloadData()
    }
}
