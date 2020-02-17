//
//  ClassViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var studentTable: UITableView!
    
    var students: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let student1 = Student(name: "Bob", surName: "Bobson", age: 20, sex: false)
        let student2 = Student(name: "John", surName: "Johnson", age: 30, sex: false)
        let student3 = Student(name: "Kate", surName: "Kateson", age: 40, sex: true)
        students = [student1, student2, student3]

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stud = students[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(stud.name) \(stud.surName)"
        return cell
      }
}
