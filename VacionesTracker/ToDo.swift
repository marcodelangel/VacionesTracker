//
//  ToDo.swift
//  VacionesTracker
//
//  Created by Marco Del Angel on 12/22/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

struct ToDo : Codable {
    var tittle : String
    var isComplete : Bool
    var dueDate :  Date
    var notes : String?
    var image : Data?
    
    static func loadToDos() -> [ToDo]?{
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveToDos(_ todos: [ToDo]){
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos =  try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSampleTodos() -> [ToDo] {
        let todo1 = ToDo(tittle: "One", isComplete: false, dueDate: Date(), notes: nil, image: nil)
        let todo2 = ToDo(tittle: "Two", isComplete: false, dueDate: Date(), notes: nil, image: nil)
        return[todo1, todo2]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateStyle = .short
        return formatter
    }()
    
    static var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
}
