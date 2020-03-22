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

    override func viewDidLoad() {
        super.viewDidLoad()
		
		
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collectionView.
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		<#code#>
	}
	
}
