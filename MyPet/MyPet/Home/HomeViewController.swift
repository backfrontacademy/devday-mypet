//
//  HomeViewController.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.headerProtocol(delegate: self)
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController: HeaderViewProtocol {
    func tappedBellButton() {
        print(#function)
    }
    
    func tappedUserButton() {
        print(#function)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimalsTableViewCell.identifier, for: indexPath) as? AnimalsTableViewCell
        return cell ?? UITableViewCell()
    }
}

