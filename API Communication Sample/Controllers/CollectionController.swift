//
//  CollectionController.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class CollectionController: UIViewController , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var contentView: UICollectionView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var errorView: UIView!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var state: State = .progress {
        didSet {
            updateViewForState()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        contentView.dataSource = self
        
        reloadData()
    }
    
    func updateViewForState() {
        contentView.isHidden = state != .content
        progressView.isHidden = state != .progress
        errorView.isHidden = state != .error
    }
    
    @IBAction func reload(_ sender: Any) {
        reloadData()
    }
    
    func reloadData() {
        state = .progress
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        fatalError("Should be overriden")
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("Should be overriden")
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Should be overriden")
    }

    enum State {
        case progress
        case content
        case error
    }
}
