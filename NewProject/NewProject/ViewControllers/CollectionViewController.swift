//
//  CollectionViewController.swift
//  NewProject
//
//  Created by UjiN on 3/22/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
//	var storage = Storage()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		StudentsDataSource.shared.getUser(completion: {
			self.collectionView.reloadData()
		})

		// Do any additional setup after loading the view.
	}
	
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		return storage.students.count
		return StudentsDataSource.shared.students?.data.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
//		let stud = storage.students[indexPath.row]
		let stud = StudentsDataSource.shared.students!.data[indexPath.row]
		
		cell?.nameLabel.text = stud.name
		cell?.surNameLabel.text = stud.surName
//		switch stud.gender {
//		case .female:
			cell?.image.image = #imageLiteral(resourceName: "girl")
//		case .male:
//			cell?.image.image = #imageLiteral(resourceName: "ric")
//		case .na:
//			cell?.image.image = #imageLiteral(resourceName: "cat")
//		default: break
//		}
		cell?.layer.borderWidth = 2
		cell?.layer.borderColor = UIColor.green.cgColor
		return cell!
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let student = StudentsDataSource.shared.students?.data[indexPath.row]
		
//		switch student?.gender {
//		case .female:
			performSegue(withIdentifier: "femailSegue", sender: student)
//		case .male:
//			performSegue(withIdentifier: "mailSegue", sender: student)
//		case .na:
//			performSegue(withIdentifier: "catSegue", sender: student)
//		default:
//			break
//		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let profileViewController = segue.destination as? ProfileViewController,
			let student = sender as? Student {
			profileViewController.student = student
		}
		
		if let profileViewController = segue.destination as? ProfileViewControllerSecond,
			let student = sender as? Student {
			profileViewController.student = student
		}
		
		if let profileViewController = segue.destination as? ProfileViewControllerThird,
			let student = sender as? Student {
			profileViewController.student = student
			
		}
	}
}
