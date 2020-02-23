//
//  Storage.swift
//  NewProject
//
//  Created by UjiN on 2/22/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation
import UIKit
class Storage: NSObject, UITableViewDataSource {
    
    lazy var students = prepareArray()
    
    func prepareArray() -> [Student] {
        var array: [Student] = []
        guard let path = Bundle.main.path(forResource: "Names", ofType: "txt") else { return array }
        var allStudentString: String = ""
        do {
             allStudentString = try String(contentsOfFile: path)
        } catch { }
        let studentsData = allStudentString.split(separator: ",")

        studentsData.forEach { student in
            let studentData = student.split(separator: ".")
            array.append(Student(name: String(studentData[0]), surName: String(studentData[1]), gender: Gender(rawValue: String(studentData[2])) ?? .female))
        }

        return array
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stud = students[indexPath.row]
        switch students[indexPath.row].gender {
        case .male:
            let cell = tableView.dequeueReusableCell(withIdentifier: XibTableViewCell.id, for: indexPath) as! XibTableViewCell
            cell.nameSurnameLabel.text = "\(stud.name) \(stud.surName)"
            cell.avatarImage.image = #imageLiteral(resourceName: "ric")
//            cell.avatarImage.layer.cornerRadius
            return cell
        case .female:
            let cell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath) as! CodeTableViewCell
                cell.nameSurnameLabel.text = "\(stud.name) \(stud.surName)"
                cell.avatarImage.image = #imageLiteral(resourceName: "girl")
            return cell
        }
    
    }
    
    
}
