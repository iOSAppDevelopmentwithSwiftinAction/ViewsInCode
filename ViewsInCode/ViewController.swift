//
//  ViewController.swift
//  ViewsInCode
//
//  Created by Craig Grummitt on 13/04/2016.
//  Copyright © 2016 Craig Grummitt. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var redView:UIView!
    var label:UILabel!
    lazy var constraints:[NSLayoutConstraint] = [
        //red view
        self.redView.topAnchor.constraint(equalTo: self.view.topAnchor),
        self.redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        self.redView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        self.redView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
        //label
        self.label.topAnchor.constraint(equalTo: self.redView.bottomAnchor, constant: 8),
        self.label.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor)
    ]
    lazy var landscapeConstraints:[NSLayoutConstraint] = [
        //red view
        self.redView.topAnchor.constraint(equalTo: self.view.topAnchor),
        self.redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        self.redView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        self.redView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
        //label
        self.label.topAnchor.constraint(equalTo: self.view.topAnchor),
        self.label.leadingAnchor.constraint(equalTo: self.redView.trailingAnchor, constant: 8)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        redView = UIView(frame: CGRect(x: 0, y: 0,
            width: view.bounds.width, height: view.bounds.height / 2))
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        label = UILabel(frame:
            CGRect(x: 20, y: self.view.bounds.height / 2,
                width: 20, height: 20))
        //label.backgroundColor = UIColor.orangeColor()
        view.addSubview(label)
        label.text = "Hello World"
        label.font = label.font.withSize(40)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if traitCollection.verticalSizeClass == .compact {
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.activate(constraints)
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.verticalSizeClass == .compact {
            if let first = constraints.first {
                if first.isActive {
                    NSLayoutConstraint.deactivate(constraints)
                    NSLayoutConstraint.activate(landscapeConstraints)
                }
            }
        } else {
            if let first = landscapeConstraints.first {
                if first.isActive {
                    NSLayoutConstraint.deactivate(landscapeConstraints)
                    NSLayoutConstraint.activate(constraints)
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

