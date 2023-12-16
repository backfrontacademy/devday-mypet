//
//  SugestionsTableViewCell.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class SugestionsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: SugestionsTableViewCell.self)
    
    lazy var sugestionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brownGrey
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sugestões"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .whiteBackground
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SugestionTableViewCell.self, forCellReuseIdentifier: SugestionTableViewCell.identifier)
        return tableView
    }()
    
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
        contentView.addSubview(sugestionsLabel)
        contentView.addSubview(tableView)
    }
    
    lazy var heightTableView = tableView.heightAnchor.constraint(equalToConstant: 100)
    
    private func configConstraints() {
  
        NSLayoutConstraint.activate([
            sugestionsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            sugestionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: sugestionsLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            heightTableView,
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupCell() {
        heightTableView.constant = 500
        layoutIfNeeded()
    }

}

extension SugestionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SugestionTableViewCell.identifier, for: indexPath) as? SugestionTableViewCell
        return cell ?? UITableViewCell()
    }
    
}


