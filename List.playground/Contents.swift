import UIKit

open  class  Node  {
	
	var value: String
	
	var next: Node?
	
	init (value: String ) {
		self.value = value
	}
}

public class LinkedList  {
	fileprivate var head: Node?
	public var isEmpty: Bool {
		return head == nil
	}
	public var first: Node? {
		return head
	}
	public func append(value: String) {
		let newNode = Node(value: value)
		if var h = head {
			while h.next != nil {
				h = h.next!
			}
			h.next = newNode
		} else {
			head = newNode
		}
	}
	
	func insert(node: Node, index: Int) {
		if let positionNode = findNode(index: index) {
			let temp = positionNode.next
			positionNode.next = node
			node.next = temp
		} else {
			node.next = head
			head = node
		}
	}
	
	func findNode(index: Int) -> Node? {
		guard index > 0 else { return nil }
		
		var result = head
		for _ in 1..<index {
			if result?.next != nil {
				result = result?.next
			} else {
				break
			}
		}
		return result
	}
	func printList(head: Node?) {
		var currentNode = head
		while currentNode != nil {
			print(currentNode?.value ?? -1)
			currentNode = currentNode?.next
		}
	}
	
}
// 1

extension LinkedList {
    func reverse() {
        var previousNode: Node? = nil
        var currentNode = head
        var nextNode = head?.next
        while nextNode != nil {
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }
        currentNode?.next = previousNode
        head = currentNode
    }
}
extension LinkedList: CustomStringConvertible {
	// 2
	public var description: String {
		// 3
		var text = "["
		var node = head
		// 4
		while node != nil {
			text += "\(node!.value)"
			node = node!.next
			if node != nil { text += ", " }
		}
		// 5
		return text + "]"
	}
}

let dogBreeds = LinkedList()
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")
print(dogBreeds)
var nod = Node(value: "Puppy")
dogBreeds.insert(node: nod, index: 0)
print(dogBreeds)

dogBreeds.printList(head: nod)
dogBreeds.reverse()
dogBreeds.printList(head: nod)
print(dogBreeds)
dogBreeds.printList(head: nod)
print(dogBreeds)
