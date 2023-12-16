//
//  SugestionTableViewCell.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class SugestionTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: SugestionTableViewCell.self)
    
    lazy var backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGrayColor
        view.layer.cornerRadius = 7
        view.clipsToBounds = true
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "trash")
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Vermífogo"
        return label
    }()
    
    lazy var nextDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Próxima data sugerida: 25/01/2023"
        return label
    }()
    
    lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "solidChevronCircleRight")
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .whiteBackground
        selectionStyle = .none
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(backGroundView)
        backGroundView.addSubview(iconImageView)
        backGroundView.addSubview(titleLabel)
        backGroundView.addSubview(nextDateLabel)
        backGroundView.addSubview(arrowImageView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backGroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backGroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backGroundView.heightAnchor.constraint(equalToConstant: 60),
            backGroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            iconImageView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 15),
            iconImageView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 13),
            iconImageView.heightAnchor.constraint(equalToConstant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 11),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -2),
            
            nextDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            nextDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nextDateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -15),
            arrowImageView.heightAnchor.constraint(equalToConstant: 12),
            arrowImageView.widthAnchor.constraint(equalToConstant: 12),
            arrowImageView.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            
        ])
    }
    
    
    func setup(value: Item?) {
        
        if let value = value {
            
            iconImageView.image = UIImage(named: value.iconImage)?.withRenderingMode(.alwaysTemplate)
            titleLabel.text = value.name
            nextDateLabel.text = value.nextDate
            titleLabel.textColor = UIColor(hex: value.color)
            iconImageView.tintColor = UIColor(hex: value.color)
        }
    }
    
}
