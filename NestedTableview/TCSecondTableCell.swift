//
//  TCSecondTableCell.swift
//  NestedTableview
//
//  Created by Aravindhan Natarajan on 01/10/21.
//

import Foundation
import UIKit

class TCSecondTableCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.numberOfLines = 0
    }
    
    func setData(value: String) {
        self.label.text = value
    }
    
}
