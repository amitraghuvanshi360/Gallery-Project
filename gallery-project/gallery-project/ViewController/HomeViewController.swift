//
//  HomeVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 13/04/23.
//


import UIKit

class HomeViewController: UIViewController{

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var imageData = [UIImage(named: "dear"), UIImage(named: "eagle"), UIImage(named: "horse"),UIImage(named: "parrot"),UIImage(named: "tiger"),UIImage(named: "dear"), UIImage(named: "eagle"), UIImage(named: "horse"),UIImage(named: "parrot"),UIImage(named: "tiger"),UIImage(named: "dear"), UIImage(named: "eagle"), UIImage(named: "horse"),UIImage(named: "parrot"),UIImage(named: "tiger")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
}


// MARK: CollectionView delegate methods
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.setImageData(image: imageData[indexPath.row]!)
        return cell
    
    }
    
    
}

// MARK: Initial layout setup
extension HomeViewController{
    func setLayout(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.borderColor = ColorCode.greenColor.cgColor
        
    }
}


// MARK: Collection view cell class

class CollectionViewCell : UICollectionViewCell{

    @IBOutlet private weak var imageView: UIImageView!

    func setImageData(image: UIImage){
        self.imageView.image = image
    }
}
