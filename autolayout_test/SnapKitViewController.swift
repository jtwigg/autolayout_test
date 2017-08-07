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
    let blueView = UIView()
    let greenView = UIView()

    var moreBlueConstraint: Constraint?
    var moreGreenConstraint: Constraint?
    var equalConstraint: Constraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SnapKit"
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        setupViews()
        setupConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "TC",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pushTinyConstraintsVC))

        let blueTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        blueView.addGestureRecognizer(blueTapGesture)
        let greenTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        greenView.addGestureRecognizer(greenTapGesture)
    }

    func pushTinyConstraintsVC() {
        navigationController?.pushViewController(TinyConstraintsViewController(), animated: true)
    }

    func setupViews() {
        label.text = "Hello World"
        view.addSubview(label)

        blueView.backgroundColor = .blue
        view.addSubview(blueView)

        greenView.backgroundColor = .green
        view.addSubview(greenView)
    }

    func setupConstraints() {
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        blueView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(12)
            equalConstraint =  make.height.equalTo(greenView.snp.height).constraint
            moreBlueConstraint = make.height.equalTo(greenView.snp.height).multipliedBy(2.0).constraint
            moreGreenConstraint = make.height.equalTo(greenView.snp.height).multipliedBy(0.5).constraint
        }


        equalConstraint?.activate()
        moreBlueConstraint?.deactivate()
        moreGreenConstraint?.deactivate()

        greenView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.right.bottom.equalToSuperview().inset(12)
            make.top.equalTo(blueView.snp.bottom).offset(12)
        }

          }

    func viewTapped(_ sender: UITapGestureRecognizer) {
        equalConstraint?.deactivate()
        if sender.view == blueView {
            moreGreenConstraint?.deactivate()
            moreBlueConstraint?.activate()
        } else {
            moreBlueConstraint?.deactivate()
            moreGreenConstraint?.activate()
        }
        UIView.animate(withDuration: 0.7,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut,
                       animations: {
            self.view.layoutIfNeeded()
        }) { _ in }
    }

}

