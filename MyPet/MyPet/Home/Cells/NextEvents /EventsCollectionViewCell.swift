//
//  EventsCollectionViewCell.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: EventsCollectionViewCell.self)
    private var heightImage: CGFloat = 24
    
    lazy var backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .veryLightPink
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.pale.cgColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dogIsabela")
        imageView.layer.cornerRadius = heightImage / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Vacinação da Raiva"
        label.numberOfLines = 2
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.text = "25/01/2023"
        return label
    }()
    
    lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.text = "Endereço X, São Paulo"
        return label
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
        addSubview(backGroundView)
        backGroundView.addSubview(dogImageView)
        backGroundView.addSubview(titleLabel)
        backGroundView.addSubview(dateLabel)
        backGroundView.addSubview(adressLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: topAnchor),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            dogImageView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 9),
            dogImageView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 9),
            dogImageView.heightAnchor.constraint(equalToConstant: heightImage),
            dogImageView.widthAnchor.constraint(equalToConstant: heightImage),
            
            titleLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: dogImageView.trailingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -2),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            adressLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            adressLabel.leadingAnchor.constraint(equalTo: dogImageView.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
    }
    
    
}
