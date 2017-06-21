//
//  TinyConstraintsViewController.swift
//  autolayout_test
//
//  Created by Alex King on 6/21/17.
//  Copyright © 2017 ck_ios. All rights reserved.
//

import UIKit
import TinyConstraints

class TinyConstraintsViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tiny Constraints"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        label.text = "Hello World"
        view.addSubview(label)
    }

    func setupConstraints() {
        label.center(in: view)
    }
    
}
