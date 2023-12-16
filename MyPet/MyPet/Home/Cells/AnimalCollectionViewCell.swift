//
//  AnimalCollectionViewCell.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dogIsabela")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(dogImageView)
        //        addSubview(<#T##view: UIView##UIView#>)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            dogImageView.heightAnchor.constraint(equalToConstant: 78),
            
            
            
        ])
    }
    
    
}
