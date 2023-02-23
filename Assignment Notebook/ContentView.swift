//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Oliver Halvey on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            ZStack {
                
                List {
                    ForEach(assignmentList.Assignments) { Assignment in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(Assignment.priority)
                                    .font(.headline)
                                Text(Assignment.description)
                            }
                            Spacer()
                            Text(Assignment.dueDate, style: .date)
                        }
                        
                    }
                    .onMove { indices, newOffset in
                        assignmentList.Assignments.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onDelete { indexSet in
                        assignmentList.Assignments.remove(atOffsets: indexSet) }
                    
                }
                
                .sheet(isPresented: $showingAddAssignmentView, content: {
                    AddAssignment(assignment: assignmentList)
                })
                
                .navigationBarTitle("Assignment Items", displayMode: .inline)
                .background(Color.mint)
                .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    showingAddAssignmentView = true }){
                        Image(systemName: "plus")
                    })
                
            }
            
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    struct Assignment: Identifiable, Codable {
        var id = UUID()
        var priority = String()
        var description = String()
        var dueDate = Date()
    }
    
    

