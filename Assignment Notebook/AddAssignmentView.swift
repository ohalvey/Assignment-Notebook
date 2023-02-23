//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Oliver Halvey on 2/22/23.
//

import SwiftUI

struct AddAssignment: View {
    @ObservedObject var assignment: AssignmentList
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let classes = ["Mobile Apps", "Chemistry", "Health", "English", "History", "Math", "French"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Importance", selection: $priority){
                    ForEach(Self.classes, id: \.self){
                        Class in Text(Class)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save"){
                if priority.count > 0 && description.count > 0{
                    let Assignment = Assignment(id: UUID(), priority: priority, description: description, dueDate: dueDate)
                    assignment.Assignments.append(Assignment)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}


struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignment(assignment: AssignmentList())
    }
}
