//
//  Task.swift
//  To Do List
//
//  Created by Nithin Reddy Gaddam on 3/16/16.
//  Copyright © 2016 Nithin Reddy Gaddam. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, BiWeekly, Monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}