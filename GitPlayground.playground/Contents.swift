import UIKit

// 1. Создать 2 константы типа Int, затем сравнить их значения и вывести в консоль результат сравнения в виде: "const1 > const2".

let const1: Int = 12
let const2: Int = 12

if const1 > const2 {
    print("const1 > const2")
} else if const1 < const2 {
    print("const1 < const2")
} else {
    print("const1 = const2")
}

// 2. Создать несколько переменных и вывести в консоль результат их сложения.

var someInt = 10
var anotherInt = 20
var someDouble = 10.5

let sum = someInt + anotherInt + Int(someDouble)
print(sum)

// 3. Составить алгоритм увеличения всех трех ранее созданных переменных на 5,если среди них есть хотя бы две равные. В противном случае выдать ответ «равных нет».

if someInt == anotherInt || someInt == Int(someDouble) || anotherInt == Int(someDouble) {
    someInt += 5
    anotherInt += 5
    someDouble += 5
} else {
    print("равных нет")
}

// 4. Создать Optional-переменнтую, затем проверить ее на nil: если есть значение - вывести его на экран, если нет - вывести на

var bool: Bool?

if let bool = bool {
    print(bool)
} else {
    print("Empty")
}

// Классы и структуры

class Sweets {
    var price: Int
    var weight: Int
    
    init(price: Int, weight: Int) {
        self.price = price
        self.weight = weight
    }
}

class Chocolat: Sweets {
    var cacaoCount: Int
    var brand: String
    var type: String
    
    init(cacaoCount: Int, brand: String, type: String, price: Int, weight: Int) {
        self.cacaoCount = cacaoCount
        self.brand = brand
        self.type = type
        super.init(price: price, weight: weight)
    }
}

let snickers = Chocolat(cacaoCount: 20, brand: "Snickers", type: "White", price: 2, weight: 25)

let mars = Chocolat(cacaoCount: 40, brand: "Mars", type: "With nuts", price: 3, weight: 30)

struct Toy {
    var price: Int
    let brand: String
    let fromAge: Int
}

let gun = Toy(price: 5, brand: "Pups", fromAge: 4)

