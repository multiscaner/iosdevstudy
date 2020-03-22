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
	
	var storage = Storage()
	var student: Student?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return storage.students.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
		let stud = storage.students[indexPath.row]
		cell?.nameLabel.text = stud.name
		cell?.surNameLabel.text = stud.surName
		switch stud.gender {
		case .female:
			cell?.image.image = #imageLiteral(resourceName: "girl")
		case .male:
			cell?.image.image = #imageLiteral(resourceName: "ric")
		case .cat:
			cell?.image.image = #imageLiteral(resourceName: "cat")
		}
		return cell!
	}
	
}
