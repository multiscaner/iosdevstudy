import UIKit


// 1.
// - Объявите одну константу x типа Int
// - Объявите переменную y типа Double
// - Объявите переменную sum типа Optional-Int  без начального значения
// - Присвойте sum значение равное сумме x и y

let x = 10
var y = 10.0
var sum: Int?

sum = x + Int(y)

// 2. Разверните опционал sum и выведите в консоль. Обратите внимание чтобы в выводе отсутствовало Optional()

print(sum!)

// 3. Выведите в консоль четные числа от 2 до 2000

for i in 2...2000 {
    if i % 2 == 0 {
        //print(i)
    }
}

// 4. Объявите новый тип ColorTuple, который является tuple из четырех компонентов (3 для цвета и один для прозрачности)
// Объявите переменную myColor типа ColorTuple?
// Задайте ей значение

typealias ColorTuple = (Int, Int, Int, Int)

// 5. Объявите функцию, которая получет на вход 3 параметра типа Int и возвращает результат типа ColorTuple

func color (r: Int,g: Int,b: Int) -> ColorTuple {
    let someColor: ColorTuple? = (5, 5, 5, 5)
    return someColor!
}

// 6. Выведите в консоль результат работы вашей функции для summ

//print(color(sum))

// 7. Напишите функцию, которая получает на вход Имя и Фамилию человека и возвращает tuple (String, String) с именем и фамилией

func fullName(name: String, lastName: String) -> (String, String) {
    return (name, lastName)
}

// 8. Напишите функцию, которая получает на вход массив [String?] и возвращает массив [String], в котором выброшены все nil значения из первого массива
//
// Например из массива
// ["a", nil, "b"] получится массив ["a", "b"]

func noNill (ar: [String?]) -> [String] {
    var ar2: [String] = []
    for el in ar {
        if el != nil {
         ar2.append(el!)
        }
    }
    return ar2
}

