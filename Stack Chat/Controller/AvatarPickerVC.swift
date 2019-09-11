//
//  AvatarPickerVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 11/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func segmentControlChanged(_ sender: Any) {
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            return cell
        }
        return AvatarCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
}
