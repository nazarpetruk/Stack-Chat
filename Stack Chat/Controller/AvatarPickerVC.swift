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
        if segmentControl.selectedSegmentIndex == 0{
            avatarType = .dark
        }else{
            avatarType = .light
        }
        collectionView.reloadData()
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //MARK: VArs
    var avatarType = AvatarType.dark
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            cell.configCell(index: indexPath.item, type: avatarType)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark{
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
