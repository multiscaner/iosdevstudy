import UIKit

//1. Write a Swift program to check if two given arrays of integers have 0 as their first element.

var array1 = [0, 1, 2, 3]
var array2 = [1, 2, 3, 4]


if array1.first == 0 {
    print("First element have 0")
} else {
    print("First element have not 0")
}

if array2.first == 0 {
    print("First element have 0")
} else {
    print("First element have not 0")
}

//2. Write a Swift program to test if an array of integers does not contain a 3 or a 5.

for item in array1 {
    if array1[item] == 3 {
        print("Array array1 contain 3")
    } else if array1[item] == 5 {
        print("Array array1 contain 5")
    }
}

//3. Write a Swift program to check whether the first element and the last element of a given array of integers are equal.

if array1.first == array1.last {
    print("First element and the last element of a given array of integers are equal")
} else {
    print("First element and the last element of a given array of integers are not equal")
}

//4. Write a Swift program that creates Array, adds an item, remove item, modify item and then prints size of the array.

var newArray = [9, 8, 7, 6, 5]
newArray.append(10)
newArray.remove(at: 4)
newArray.sorted { (one, two) -> Bool in
    return one < two
}
print(newArray.count)

//5. Write a Swift program that creates Dictionary, adds an item, remove item, modify item and then prints size of the Dictionary.

var someDict = [1: "Monday", 2: "Tuesdey",3: "Wednesday", 4: "Tursday", 5: "Friday"]
someDict[6] = "Saturday"
someDict.removeValue(forKey: 1)
someDict.updateValue("Sunday", forKey: 6)
print(someDict.count)

//6. Write a Swift program that creates Set, adds an item and then prints size of the Set.

var numbers: Set = [11, 12, 13, 14, 15]
numbers.insert(20)
print(numbers.count)

//7. Create 2 arrays, and merge them.

var array3 = ["a", "b", "c"]
var array4 = ["1", "2", "3"]
var array5 = array3 + array4

//8. Write a closure to sum 2 integers, pass closure as argument to function, where return the result of calling that closure.

var clouser = {
    (x: Int, y: Int) -> Int in
    let sum = x + y
    return sum
}
func funcWithClouser (a: Int, b: Int, clos: (Int, Int) -> Int) -> Int {
    return clos(a, b)
}

funcWithClouser(a: 5, b: 10, clos: clouser)

