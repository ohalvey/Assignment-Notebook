//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Oliver Halvey on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
            [AssignmentItem(priority: "High", description: "Take out trash", dueDate: Date()),
             AssignmentItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
             AssignmentItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    Text(item.description)
                }
            }
            .navigationBarTitle("Assignment Items", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}

