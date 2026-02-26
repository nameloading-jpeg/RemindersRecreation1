//
//  Models.swift
//  RemindersRecreation
//
//  Created by Mia Sundman on 2/26/26.
//
import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
}
