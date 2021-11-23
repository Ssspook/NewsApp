//
//  MainViewController.swift
//  NewsApp
//
//  Created by Meritocrat on 11/23/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        NetworkManager.shared.fetchNews { news in
            
        }
    }
}
