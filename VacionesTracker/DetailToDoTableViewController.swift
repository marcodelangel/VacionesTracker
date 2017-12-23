//
//  DetailToDoTableViewController.swift
//  VacionesTracker
//
//  Created by Marco Del Angel on 12/23/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

class DetailToDTableViewController : UITableViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var imagePickerButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var isPickerHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
        datePicker.date = Date().addingTimeInterval(24*60*60)
        updateDueDateLabel(date: datePicker.date)
    }
    
    func updateSaveButtonState(){
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
    updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func buttonIsSelected(_ sender: UIButton) {
        doneButton.isSelected = !doneButton.isSelected
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: datePicker.date)
    }
    
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch (indexPath) {
        case [1,0]:
            return isPickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [1,0]:
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
}
