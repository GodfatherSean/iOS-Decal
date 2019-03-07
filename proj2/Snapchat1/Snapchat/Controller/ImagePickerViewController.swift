//
//  ImagePickerViewController.swift
//  Snapchat
//
//  Created by @GodfatherSean on 2019/3/5.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imagePickerCollectionView: UICollectionView!
    let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerCollectionView.delegate = self
        imagePickerCollectionView.dataSource = self
    }
    
    // returns the number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.images.count
    }
    
    // returns the corrresponding element at given index.
    // note that index path is an object that specifies some element in a nested array.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCell {
            cell.cellImageView.image = UIImage(named: data.images[indexPath.item])
            cell.cellImageLabel = data.images[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    // return the dimension of the image
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = self.imagePickerCollectionView.frame.size.width / 2.1;
        return CGSize(width: dimension, height: dimension)
    }
    
    // navigation preparation.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "goToFeedbackSelector" {
                if let dest = segue.destination as? FeedPickerViewController {
                    if let cell = sender as? ImageCell {
                        dest.selectedImage = cell.cellImageLabel
                    }
                }
            }
        }
    }

}
