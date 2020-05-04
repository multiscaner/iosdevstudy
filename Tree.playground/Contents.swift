import UIKit

class TreeNode<T> {

    var value: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?

    init(value: T,
         leftNode: TreeNode? = nil,
         rightNode: TreeNode? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }

}

class BinaryTree<T: Comparable> {

    private var rootNode: TreeNode<T>?

    func addNode(_ value: T) {
        let node = TreeNode(value: value)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }


    private func insert(_ root: TreeNode<T>, _ node: TreeNode<T>) {
        if root.value > node.value {
            if let leftNode = root.leftNode {
                self.insert(leftNode, node)
            } else {
                root.leftNode = node
            }
        } else {
            if let rightNode = root.rightNode {
                self.insert(rightNode, node)
            } else {
                root.rightNode = node
            }
        }
    }
    
    func printTree() {
        self.inorder(self.rootNode)
    }

    private func inorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        self.inorder(node?.leftNode)
        print("\(node!.value)", terminator: " ")
        self.inorder(node?.rightNode)
    }
	
	
}

//HW:
// 3. Traverse tree in two ways: BFS vs DFS

var root = TreeNode(value: 20)
root.leftNode = TreeNode(value: 10)
root.leftNode?.leftNode = TreeNode(value: 5)
root.leftNode?.rightNode = TreeNode(value: 15)
root.rightNode = TreeNode(value: 30)
root.rightNode?.leftNode = TreeNode(value: 25)

var beTree = BinaryTree<Int>()
beTree.addNode(20)
beTree.addNode(10)
beTree.addNode(5)
beTree.addNode(15)
beTree.addNode(30)
beTree.addNode(25)

beTree.printTree()

