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

        let student1 = Student(name: "Bob", surName: "Bobson", age: 20, gender: .male, avatar: #imageLiteral(resourceName: "1"))
        let student2 = Student(name: "John", surName: "Johnson", age: 30, gender: .male, avatar: #imageLiteral(resourceName: "2"))
        let student3 = Student(name: "Kate", surName: "Kateson", age: 40, gender: .female, avatar: #imageLiteral(resourceName: "3"))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController,
            let indexPath = studentTable.indexPathForSelectedRow {
            profileViewController.student = students[indexPath.row]
            studentTable.deselectRow(at: indexPath, animated: true)
            
        }
    }
}
