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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
        redView = UIView(frame: CGRect(x: 0, y: 0,
            width: view.bounds.width, height: view.bounds.height / 2))
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
        
        
        label = UILabel(frame:
            CGRect(x: 20, y: self.view.bounds.height / 2,
                width: 20, height: 20))
        label.backgroundColor = UIColor.orangeColor()
        view.addSubview(label)
        label.text = "Hello World"
        label.font = label.font.fontWithSize(40)
        label.sizeToFit()


        print("View Did Load")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}