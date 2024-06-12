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
    var title: String = ""
    var time: Date
    var category: String = ""
    var isDone: Bool = false
    var note: String = ""

    init(title: String, time: Date, category: String, isDone: Bool, note: String) {
        self.title = title
        self.time = time
        self.category = category
        self.isDone = isDone
        self.note = note
    }
}
