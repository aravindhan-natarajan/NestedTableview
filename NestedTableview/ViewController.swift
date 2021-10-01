//
//  ViewController.swift
//  NestedTableview
//
//  Created by Aravindhan Natarajan on 01/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var listview: TCTableview!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareTableview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.listview.reloadData()
        }
        
    }
    
    func prepareTableview() {
        self.listview.dataSource = self
        self.listview.delegate = self
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCFirstTableCell") as! TCFirstTableCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? .green : .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

class TCTableview: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
}
