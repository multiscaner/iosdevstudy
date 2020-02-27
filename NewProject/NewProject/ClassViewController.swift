//
//  ClassViewController.swift
//  NewProject
//
//  Created by UjiN on 2/16/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITableViewDelegate {
        
    var storage = Storage()
    
    @IBOutlet weak var studentTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Список студентов"
        navigationController?.navigationBar.prefersLargeTitles = true
                        
        studentTable.register(UINib(nibName: XibTableViewCell.id, bundle: nil), forCellReuseIdentifier: XibTableViewCell.id)
        
        studentTable.dataSource = storage

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController,
            let indexPath = studentTable.indexPathForSelectedRow {
            profileViewController.student = storage.students[indexPath.row]
            studentTable.deselectRow(at: indexPath, animated: true)
        }
    }
}
