//
//  ViewController.swift
//  autolayout_test
//
//  Created by Alex King on 6/21/17.
//  Copyright © 2017 ck_ios. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SnapKit"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "TC",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pushTinyConstraintsVC))
    }

    func pushTinyConstraintsVC() {
        navigationController?.pushViewController(TinyConstraintsViewController(), animated: true)
    }

    func setupViews() {
        label.text = "Hello World"
        view.addSubview(label)
    }

    func setupConstraints() {
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

}

