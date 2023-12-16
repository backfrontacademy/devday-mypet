//
//  NextEventsTableViewCell.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class NextEventsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NextEventsTableViewCell.self)
    
    lazy var nextEventsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Próximos Eventos"
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .whiteBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: EventsCollectionViewCell.identifier)
        return collectionView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .periwinkleBlue
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedAddButton() {
        print(#function)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .whiteBackground
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(nextEventsLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(collectionView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nextEventsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            nextEventsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            addButton.centerYAnchor.constraint(equalTo: nextEventsLabel.centerYAnchor),
            addButton.leadingAnchor.constraint(equalTo: nextEventsLabel.trailingAnchor, constant: 9),
            addButton.heightAnchor.constraint(equalToConstant: 16),
            addButton.widthAnchor.constraint(equalToConstant: 16),
            
            collectionView.topAnchor.constraint(equalTo: nextEventsLabel.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
}

extension NextEventsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.identifier, for: indexPath) as? EventsCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 80)
    }

}

