//
//  TableViewController.swift
//  rgtarkovskiyPW3
//
//  Created by Al Stark on 18.10.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
       let cellId = "MyCell"

       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .yellow
           setupTableView()
       }
    
    private func setupTableView() {
            let rect = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: view.frame.height - 30)
            
            tableView = UITableView(frame: rect)
          //  tableView.register(TableCell.self, forCellReuseIdentifier: cellId)
            tableView.register(EyeCell.self, forCellReuseIdentifier: "eyeCell")
            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.backgroundColor = UIColor.clear
            tableView.rowHeight = 80
            tableView.showsVerticalScrollIndicator = true
            tableView.translatesAutoresizingMaskIntoConstraints = false //
            tableView.layer.cornerRadius = 35
            tableView.layer.masksToBounds = true
            
            self.view.addSubview(tableView)
        }
        
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            tableView.alwaysBounceVertical = true
        }

        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 300
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                    IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "eyeCell",
            for: indexPath
        ) as? EyeCell
        cell?.setupEye()
        return cell ?? UITableViewCell()
    }
}
