//
//  HeaderInfoCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 12.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class HeaderInfoCell: XibBasedView {
    
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet var sizeToBot: NSLayoutConstraint!
    var data: RocketDatum?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let height = UIScreen.main.bounds.height
        sizeToBot.constant = height / 4
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "image")
        pageControl.tintColor = Colors.lowBlue
        collectionView.setShadow(color: .black)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: RocketDatum) {
        self.data = data
        
        DispatchQueue.main.async {
            self.descriptionLabel.text = data.rocketDatumDescription
            self.pageControl.numberOfPages = data.flickrImages.count
            self.collectionView.reloadData()
            if data.active {
                self.activeLabel.text = "Active"
                self.activeLabel.textColor = Colors.green
            } else {
                self.activeLabel.text = "Not active"
                self.activeLabel.textColor = Colors.red
            }
        }
    }
}

extension HeaderInfoCell: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.flickrImages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! ImageCell
        cell.imageView.image = nil
        if let url = data?.flickrImages[indexPath.row] {
            cell.imageView.setKfImage(urlString: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.bounds.size
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
