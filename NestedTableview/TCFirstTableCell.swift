//
//  TCFirstTableCell.swift
//  NestedTableview
//
//  Created by Aravindhan Natarajan on 01/10/21.
//

import UIKit

class TCFirstTableCell: UITableViewCell {

    @IBOutlet var listview: TCTableview!
    
    
    var datasource: [String] = ["asdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfas","asdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfas","asdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfasasdajhfdasddsahdad;fadnfadfda;fdafdfdfsd;vkadsfas"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareTableview()
    }
    
    func prepareTableview() {
        self.listview.dataSource = self
        self.listview.delegate = self
        self.listview.isScrollEnabled = false
        self.listview.reloadData()
    }
    
}

extension TCFirstTableCell: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCSecondTableCell") as! TCSecondTableCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? .green : .red
        cell.setData(value: datasource[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
