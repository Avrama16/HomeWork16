//
//  NumberViewController.swift
//  HomeWork16
//
//  Created by A-Avramenko on 23.04.2024.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet weak var numberCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberCollection.dataSource = self
        numberCollection.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension NumberViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = numberCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCellNumber
        else{
            assertionFailure()
            return CollectionViewCellNumber()
        }
        cell.numberLabel.text = "\(indexPath.row + 1)"
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 2
        cell.layer.borderWidth = 2
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        return cell
        
    }
}
    

// MARK: - UICollectionViewDelegate

extension NumberViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "NumberResultController") as? NumberResultController
        guard let viewController = viewController else {
            return
        }
        
        viewController.index = indexPath.row
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension NumberViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWight = numberCollection.bounds.width / 3.0
        return CGSize(width: cellWight, height: cellWight)
    }
}
