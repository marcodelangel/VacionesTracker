//
//  ToDo.swift
//  VacionesTracker
//
//  Created by Marco Del Angel on 12/22/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

struct ToDo {
    var tittle : String
    var isComplete : Bool
    var dueDate :  Date
    var notes : String?
    var photos : [UIImage]?
    
    static func loadToDos() -> [ToDo]?{
        return nil
    }
    
    static func loadSampleTodos() -> [ToDo] {
        let todo1 = ToDo(tittle: "One", isComplete: false, dueDate: Date(), notes: nil, photos: nil)
        let todo2 = ToDo(tittle: "Two", isComplete: false, dueDate: Date(), notes: nil, photos: nil)
        return[todo1, todo2]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateStyle = .short
        return formatter
    }()
}
