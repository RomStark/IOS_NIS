//
//  CollectionViewController.swift
//  rgtarkovskiyPW3
//
//  Created by Al Stark on 18.10.2021.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 23
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
        //cell.dateLabel.text = String(indexPath.row + 1)
        //cell.distanceLabel.text = String((indexPath.row + 1) * 1000) + " m"
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }

    
    
    
    var collectionView: UICollectionView!
    let cellId = "Cell"
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 25, right: 5)
        layout.itemSize = CGSize(width: view.frame.width - 20, height: view.frame.height / 10)
        
        let rect = CGRect(x: 15, y: 15, width: view.frame.width - 20, height: view.frame.height - 30)
        
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout) // self.view.frame
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = UIColor.black//black
        collectionView.translatesAutoresizingMaskIntoConstraints = false //
        collectionView.layer.cornerRadius = 35
        collectionView.layer.masksToBounds = true
        
        self.view.addSubview(collectionView)

    }
    
    
    
    
}
