//
//  ViewController.swift
//  ZYUIToolsPod
//
//  Created by NULLGIRL on 03/26/2020.
//  Copyright (c) 2020 NULLGIRL. All rights reserved.
//

import UIKit
import ZYUIToolsPod

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // test
        let color = UIColor.init(ts_hexString: "#000000")
        let label = UILabel.mediaLabel("hello world", color: color, font: 20)
        label.textAlignment = .center
        label.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

