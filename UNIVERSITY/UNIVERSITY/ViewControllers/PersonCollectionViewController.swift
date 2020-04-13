//
//  PersonCollectionViewController.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/12/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class PersonCollectionViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		PersonDataSource.shared.getPerson {
			self.collectionView.reloadData()
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let profileViewController = segue.destination as? ProfileViewController,
			let person = sender as? Person {
			profileViewController.person = person
		}
	}
}
// MARK: UICollectionViewDataSource
extension PersonCollectionViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		//		return storage.students.count
		return PersonDataSource.shared.persons.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PersonCollectionViewCell
		let pers = PersonDataSource.shared.persons[indexPath.row]
		
		cell?.name.text = "Name: \(pers.name)"
		cell?.userName.text = "Username: \(pers.username)"
		cell?.companyName.text = "Company: \(pers.company.name)"
		cell?.icon.image = UIImage(named: "icon")
		cell?.layer.borderWidth = 2
		cell?.layer.borderColor = UIColor.white.cgColor
		
		return cell!
	}
}
// MARK: UICollectionViewDelegate

extension PersonCollectionViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let pers = PersonDataSource.shared.persons[indexPath.row]
		performSegue(withIdentifier: "profileSegue", sender: pers)
	}
}

