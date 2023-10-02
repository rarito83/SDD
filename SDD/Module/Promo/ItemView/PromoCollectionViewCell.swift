//
//  PromoCollectionViewCell.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromoCollectionViewCell"
    
    let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImage.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
