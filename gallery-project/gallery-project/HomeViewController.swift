//
//  HomeViewController.swift
//  gallery-project
//
//  Created by Ankush Sharma on 12/04/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    var imageData = [UIImage(named: "dear"), UIImage(named: "eagle"), UIImage(named: "horse"),UIImage(named: "parrot"),UIImage(named: "tiger"),UIImage(named: "dear"), UIImage(named: "eagle"), UIImage(named: "horse"),UIImage(named: "parrot"),UIImage(named: "tiger"),UIImage(named: "dear"), UIImage(named: "eagle"), UIImage(named: "horse"),UIImage(named: "parrot"),UIImage(named: "tiger")]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomViewCell", for: indexPath) as! CustomViewCell
        UICollectionView.animate(withDuration: 8000, delay: 20000,
                       options: [.repeat, .autoreverse , .curveEaseOut], animations: {
          

            }, completion: nil)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cell.setImageData(image: imageData[indexPath.row]!)
        return cell
    
    }
    
    
}


class CustomViewCell : UICollectionViewCell{
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var profileView: UIImageView!
    
    
    func setImageData(image: UIImage){
        self.profileView.image = image
    }
}
