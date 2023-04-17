//
//  HomeVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 13/04/23.
//


import UIKit



class HomeViewController: BaseViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{

    // MARK: IBOutlets and variable decleration
    var imagePicker = UIImagePickerController()
    var itemHeight: Int = 0
    var currentIndex: Int = 0
    @IBOutlet private weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var uploadBttn: UIButton!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    var imageData: [UIImage] = []
    var imageDatas = [UIImage(named: "bubble")]
//                            UIImage(named: "alone"),
//                            UIImage(named: "home-sea"),
//                            UIImage(named: "circle-ball"),
//                            UIImage(named: "dear"),
//                            UIImage(named: "horse"),
//                            UIImage(named: "dear"),
//                            UIImage(named: "horse"),
//                            UIImage(named: "eagle")
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
//        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imageSlideToNext), userInfo: nil, repeats: true)
        self.view.setNeedsLayout()
    }
    
    @objc func imageSlideToNext(){
        if currentIndex < self.imageData.count - 1 {
            currentIndex += 1
        }else{
            currentIndex = 0
        }
        self.firstCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .right, animated: true)
    }
    @IBAction func uploadImageAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageData.append(image)
            viewHeight.constant  = CGFloat((Double(self.imageData.count) / 2.0).rounded())  * (UIScreen.main.bounds.width + 20) / 2.0
            self.imageData.reverse()
        }
        self.firstCollectionView.reloadData()
        self.secondCollectionView.reloadData()

    }
    
}


// MARK: CollectionView delegate methods
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.firstCollectionView{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            if self.imageData.isEmpty{
                cell1.firstImageVw.image = UIImage(named: "null-data")
                return cell1
            }
            cell1.setImageData(image: self.imageData[indexPath.row])
            return cell1
        }else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondViewCell", for: indexPath) as! SecondViewCell
            if self.imageData.isEmpty{
                cell2.secondImageVw.image = UIImage(named: "null-data")
                return cell2
            }
            cell2.setImageData(image: self.imageData[indexPath.row])
            return cell2
        }
        self.firstCollectionView.reloadData()
        self.secondCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.firstCollectionView{
            let size = (collectionView.frame.size.width)
            return CGSize(width: size, height: size)
        }else{
            let height = (collectionView.frame.size.width + 20) / 2
            let width = (collectionView.frame.size.width - 10) / 2
            return CGSize(width: width, height: height)
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
    
    @IBOutlet  weak var firstImageVw: UIImageView!
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
