//
//  ViewController.swift
//  rgtarkovskiyPW1
//
//  Created by Ромвн Тарковский on 16.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var views: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func button(_ sender: Any) {
        var set = Set<UIColor>()
        let button = sender as? UIButton
        button?.isEnabled = false
        while set.count < views.count{
            set.insert(UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1
                ))
        }
        
        UIView.animate(withDuration: 2, animations: {
        for view in self.views {
        view.layer.cornerRadius = 10
        view.backgroundColor = set.popFirst()
        }
        }) { completion in
        button?.isEnabled = true
        }
    }
}

