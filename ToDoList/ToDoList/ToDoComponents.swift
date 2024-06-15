//
//  ToDoComponents.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 13/6/24.
//

import Foundation
import SwiftData

@Model
final class ToDoComponents {
    var title: String
    var date: Date
    var time: Date
    var isDone: Bool
    var category: String
    var note: String
    
    
    
    init(title: String = "", date: Date = .now, time: Date = .now, isDone: Bool = false, category: String = "", note: String = "") {
        self.title = title
        self.date = date
        self.time = time
        self.isDone = isDone
        self.category = category
        self.note = note
    }

    
    
}
