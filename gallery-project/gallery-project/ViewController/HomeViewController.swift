//
//  HomeVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 13/04/23.
//


import UIKit

class HomeViewController: UIViewController{

    //@IBOutlet weak var headerTitleLbl: UILabel!
    @IBOutlet private weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var uploadBttn: UIButton!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    
    var imageData = [UIImage(named: "dear"),
                     UIImage(named: "eagle"),
                     UIImage(named: "horse"),
                     UIImage(named: "parrot"),
                     UIImage(named: "tiger"),
                     UIImage(named: "dear"),
                     UIImage(named: "eagle")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        
        let size = (UIScreen.main.bounds.width - 10)
        viewHeight.constant  = CGFloat(imageData.count / 2) * size
        let scrollheight = self.scrollView.contentSize.height
        
        self.secondCollectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
}


// MARK: CollectionView delegate methods
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.firstCollectionView{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell1.setImageData(image: imageData[indexPath.row]!)
            return cell1
        }else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondViewCell", for: indexPath) as! SecondViewCell
            cell2.setImageData(image: imageData[indexPath.row]!)
            return cell2
        }
    }

    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.firstCollectionView{
            let size = (collectionView.frame.size.width - 10) / 1
            return CGSize(width: size, height: size)
        }else{
            let size = (collectionView.frame.size.width - 10) / 2
            return CGSize(width: size, height: size)
        }
    }
    
}

// MARK: Initial layout setup
extension HomeViewController{
    func setLayout(){
        self.firstCollectionView.delegate = self
        self.firstCollectionView.dataSource = self
        
        self.secondCollectionView.delegate = self
        self.secondCollectionView.dataSource = self
        
        self.uploadBttn.layer.cornerRadius = min(self.uploadBttn.frame.size.height,self.uploadBttn.frame.size.width) / 2.0
        self.uploadBttn.layer.borderWidth = 1
  
    
    }
}


// MARK: Top Collection view cell class

class CollectionViewCell : UICollectionViewCell{

    @IBOutlet private weak var firstImageVw: UIImageView!
    func setImageData(image: UIImage){
        self.firstImageVw.image = image
    }
}


// MARK: Main Collection View inside tableView
class SecondViewCell : UICollectionViewCell{
    
    @IBOutlet weak var secondImageVw: UIImageView!
    func setImageData(image: UIImage){
        self.secondImageVw.image = image
    }
}
