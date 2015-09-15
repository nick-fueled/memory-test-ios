//
//  ViewController.swift
//  memory-test
//
//  Created by Nick McConnell on 9/14/15.
//  Copyright © 2015 Nick McConnell. All rights reserved.
//

import UIKit
//import AppKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        var a : ClassA?
        for i in 0 ..< 1000 {
            a = ClassA();
        }
    }
    
    
    @IBAction func otherButtonTapped(sender: AnyObject) {
        
            for _ in 0 ..< 5 {
                autoreleasepool {
                    for _ in 0 ..< 1000 {
                        let image = UIImage(named: "Anything_can_happen")
                    }
                }
            }
    }

    @IBAction func withoutButtonTapped(sender: AnyObject) {
        
        for _ in 0 ..< 5 {
                for _ in 0 ..< 1000 {
                    let image = UIImage(named: "Anything_can_happen")
                }
        }
    }


}


// Retain cycle

class ClassA {
    
    internal var otherClassB : ClassB?
    
    init() {
        otherClassB = ClassB()
        otherClassB?.setA(self)
    }
}

class ClassB {
    
    internal var otherClassA : ClassA?
    
    func setA(a:ClassA) {
        otherClassA = a
    }
}
