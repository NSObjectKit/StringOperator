//
//  ViewController.swift
//  Strings
//
//  Created by Dengzunli on 2019/2/26.
//  Copyright © 2019 shandianji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = "1" + "1.2222"
        
        
        let b = "2.99" + "ss45s.22"
        
        let c = "4" / "0"
        
        let d = "4.5" * "NaN"
        
        
        let e = "4049.00".roundToPlain(-2)
        
        
        let f = "45.225".roundToBankers(2)
        
        
        print(a)
        print(b)
        print(c)
        print(d)
        print(e)
        print(f)
        
        
        
        
        
        
        
    }


}
