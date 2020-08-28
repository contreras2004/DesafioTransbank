//
//  ViewController.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 28-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Components

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = TBSearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
