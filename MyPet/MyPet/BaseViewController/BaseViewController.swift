//
//  BaseViewController.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loading: Loading?

    override func viewDidLoad() {
        super.viewDidLoad()
        loading = Loading(viewController: self)
    }

}
