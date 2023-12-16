//
//  HomeScreen.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class HomeScreen: UIView {
    
    private weak var delegate: HeaderViewProtocol?
    
    public func headerProtocol(delegate: HeaderViewProtocol) {
        headerView.configHeader(delegate: delegate, isBack: false)
    }
    
    lazy var headerView: HeaderView = {
       let header = HeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .whiteBackground
        tableView.separatorStyle = .none
        tableView.register(AnimalsTableViewCell.self, forCellReuseIdentifier: AnimalsTableViewCell.identifier)
        tableView.register(NextEventsTableViewCell.self, forCellReuseIdentifier: NextEventsTableViewCell.identifier)
        return tableView
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
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
        addSubview(headerView)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 61),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
