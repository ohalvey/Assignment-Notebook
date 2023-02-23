//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Oliver Halvey on 2/22/23.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var Assignments: [Assignment]{
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(Assignments) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let Assignments = UserDefaults.standard.data(forKey: "data"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Assignment].self, from: Assignments) {
                self.Assignments = decoded
                return
            }
        }
        Assignments = []
        
    }
}
