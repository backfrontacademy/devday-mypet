//
//  AnimalCollectionViewCell.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: AnimalCollectionViewCell.self)
    
    lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dogIsabela")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Julio"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.text = "Pug - 2,5 anos"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .whiteBackground
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(dogImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dogImageView.heightAnchor.constraint(equalToConstant: 78),
            
            nameLabel.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 9),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    
    func setupCell(value: Pet?) {
        
        if let value = value {
            self.dogImageView.image = UIImage(named: value.photo)
            self.nameLabel.text = value.name
            self.descriptionLabel.text =   "\(value.type), \(value.age)"
        }
    }
    
}
