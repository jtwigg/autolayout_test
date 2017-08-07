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
    let blueView = UIView()
    let greenView = UIView()

    var moreBlueConstraint: Constraint?
    var moreGreenConstraint: Constraint?
    var equalConstraint: Constraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tiny Constraints"
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        setupViews()
        setupConstraints()

        let blueTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        blueView.addGestureRecognizer(blueTapGesture)
        let greenTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        greenView.addGestureRecognizer(greenTapGesture)
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
        label.center(in: view)

        blueView.left(to: view, offset: 12)
        blueView.right(to: view, offset: 12)
        blueView.top(to: view, offset: 12)

        equalConstraint = blueView.height(to: greenView, offset: -12)
        moreBlueConstraint = blueView.height(to: greenView, multiplier: 2.0, offset: -12, isActive: false)
        moreGreenConstraint = blueView.height(to: greenView, multiplier: 0.5, offset: -12, isActive: false)



        greenView.topToBottom(of: blueView, offset:24)
        greenView.left(to: view, offset: 12)
        greenView.right(to: view, offset: 12)
        greenView.bottom(to: view, offset: -12)
    }

    func viewTapped(_ sender: UITapGestureRecognizer) {
        equalConstraint?.set(active: false)
        if sender.view == blueView {
            moreGreenConstraint?.set(active: false)
            moreBlueConstraint?.set(active: true)
        } else {
            moreBlueConstraint?.set(active: false)
            moreGreenConstraint?.set(active: true)
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
