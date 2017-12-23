//
//  ToDoCell.swift
//  VacionesTracker
//
//  Created by Marco Del Angel on 12/23/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkMarkTapped(sender: ToDoCell)
}

class ToDoCell : UITableViewCell {
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var dondeButton: UIButton!
    
    var delegate : ToDoCellDelegate?
    
    @IBAction func doneButtonIsTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(sender: self)
    }
}
