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

		studentTable.register(UINib(nibName: XibTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: XibTableViewCell.cellId)

		studentTable.dataSource = storage

	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let student = storage.students[indexPath.row]
		switch student.gender {
		case .female:
			performSegue(withIdentifier: "showProfile2", sender: self)
		case .male:
			performSegue(withIdentifier: "showProfile", sender: self)
		case .cat:
			performSegue(withIdentifier: "showProfile3", sender: self)
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let profileViewController = segue.destination as? ProfileViewController,
			let indexPath = studentTable.indexPathForSelectedRow {
			profileViewController.student = storage.students[indexPath.row]
			studentTable.deselectRow(at: indexPath, animated: true)
		}

		if let profileViewController = segue.destination as? ProfileViewControllerSecond,
			let indexPath = studentTable.indexPathForSelectedRow {
			profileViewController.student = storage.students[indexPath.row]
			studentTable.deselectRow(at: indexPath, animated: true)
		}

		if let profileViewController = segue.destination as? ProfileViewControllerThird,
			let indexPath = studentTable.indexPathForSelectedRow {
			profileViewController.student = storage.students[indexPath.row]
			studentTable.deselectRow(at: indexPath, animated: true)
		}
	}
}
