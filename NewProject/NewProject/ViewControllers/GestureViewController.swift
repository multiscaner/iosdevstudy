//
//  GestureViewController.swift
//  NewProject
//
//  Created by UjiN on 4/4/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
	@IBOutlet weak var gestureLabel: UILabel!
	@IBOutlet weak var yConstraint: NSLayoutConstraint!
	@IBOutlet weak var xConstraint: NSLayoutConstraint!
	override func viewDidLoad() {
		super.viewDidLoad()
				
		gestureLabel.text = "Жесты"
				
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(GestureViewController.longPressView(longPress:)))
		view.addGestureRecognizer(longPress)
		
		let tapOnce = UITapGestureRecognizer(target: self, action: #selector(GestureViewController.tapView(tap:)))
		view.addGestureRecognizer(tapOnce)
		tapOnce.numberOfTapsRequired = 1
		
		let tapTwice = UITapGestureRecognizer(target: self, action: #selector(GestureViewController.tapView(tap:)))
		view.addGestureRecognizer(tapTwice)
		tapTwice.numberOfTapsRequired = 2
		
		let tapThrice = UITapGestureRecognizer(target: self, action: #selector(GestureViewController.tapView(tap:)))
		view.addGestureRecognizer(tapThrice)
		tapThrice.numberOfTapsRequired = 3
		
		tapOnce.require(toFail: tapTwice)
		tapOnce.require(toFail: tapThrice)
		tapTwice.require(toFail: tapThrice)

		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(GestureViewController.swipeView(swipe:)))
		swipeLeft.direction = .left
		view.addGestureRecognizer(swipeLeft)
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(GestureViewController.swipeView(swipe:)))
		swipeRight.direction = .right
		view.addGestureRecognizer(swipeRight)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(GestureViewController.swipeView(swipe:)))
		swipeUp.direction = .up
		view.addGestureRecognizer(swipeUp)
		
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(GestureViewController.swipeView(swipe:)))
		swipeDown.direction = .down
		view.addGestureRecognizer(swipeDown)
		
		let move = UIPanGestureRecognizer(target: self, action: #selector(moveLabel(_:)))
		gestureLabel.addGestureRecognizer(move)
	}
	
	@objc func moveLabel(_ sender: UIPanGestureRecognizer) {
//		self.view.bringSubviewToFront(gestureLabel)
		let translation = sender.translation(in: self.view)
//		gestureLabel.center = CGPoint(x: gestureLabel.center.x + translation.x, y: gestureLabel.center.y + translation.y)
		xConstraint.constant += translation.x
		yConstraint.constant += translation.y
		view.layoutIfNeeded()
		sender.setTranslation(CGPoint.zero, in: self.view)
		gestureLabel.text = "Сдвинул лейбл"
	}
	
	@objc func tapView(tap: UITapGestureRecognizer) {
		switch tap.numberOfTapsRequired {
		case 1:
			gestureLabel.text = "Одно нажатие"
		case 2:
			gestureLabel.text = "Два нажатия"
		case 3:
			gestureLabel.text = "Три нажатия"
		default:
			break
		}
	}
	
	@objc func swipeView(swipe: UISwipeGestureRecognizer) {
		switch swipe.direction {
		case .left:
			gestureLabel.text = "Свайп влево"
		case .right:
			gestureLabel.text = "Свайп вправо"
		case .up:
			gestureLabel.text = "Свайп вверх"
		case .down:
			gestureLabel.text = "Свайп вниз"
		default:
			break
		}
	}
	
	@objc func longPressView(longPress: UILongPressGestureRecognizer) {
		gestureLabel.text = "Лонг пресс"
	}
}
