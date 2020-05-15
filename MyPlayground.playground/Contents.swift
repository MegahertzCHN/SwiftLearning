import UIKit

var str = "Hello, playground"

var optionalString: String? = nil;
//var optionalString: String? = "Zh";


if let name = optionalString {
    print("Hello, \(name)");
}

//print("Hello, \(name)");


let name: String = "1"
switch name {
case "1":
    print(name);
default:
    print("name = \(name)");
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var kindest = "";
var kindSum = 0
for (kind, numbers) in interestingNumbers {
    var tempSum = 0;
    for number in numbers {
        tempSum = tempSum + number
        if number > largest {
            largest = number
        }
    }
    if tempSum > kindSum {
        kindSum = tempSum
        kindest = kind;
    }
}
print(largest, kindest)


func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person:"Bob", day: "Tuesday")
// 默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// 使用元组来生成复合值，比如让一个函数返回多个值。该元组的元素可以用名称或数字来获取。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.1)

// 函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// 函数也可以当做参数传入另一个函数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
// 函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数，即使闭包是在一个不同的作用域被执行的——你已经在嵌套函数的例子中看过了。你可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。
var tempNumbers = numbers.map({
    (number: Int) -> Int in
    let result = number % 2 == 0 ? 0 : number
    return result
})
print(tempNumbers);

// 有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个代理的回调，你可以忽略参数，返回值，甚至两个都忽略。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// 你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在圆括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略圆括号。
let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)
class NameShape {
    var numberOfSize: Int = 0
    var name: String
    init(name: String) {
        self.name = name;
    }
    
    func simpleDesecription() -> String {
        return "A shape with \(numberOfSize) sides";
    }
}

class Square:NameShape {
    var sideLength:Double;
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSize = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDesecription() -> String {
        return "A square with sides of Length \(sideLength)"
    }
}

let test = Square(sideLength: 10, name: "Suqare")
test.area()
test.simpleDesecription()

class Circle:NameShape {
    var redius: Double;
    init(redius: Double, name: String) {
        self.redius = redius;
        super.init(name: name);
    }
    
    func area() -> Double {
        return 3.14*redius*redius;
    }
    
    override func simpleDesecription() -> String {
        return "A square with redius of length \(redius)"
    }
}

let circle = Circle(redius: 10.0, name: "This is the circle");
circle.area()
circle.simpleDesecription()

class EqualaterTriangle: NameShape {
    var sideLength: Double = 0.0;
     
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name);
        numberOfSize = 3;
    }
    
    // get set方法
    var perimeter: Double {
        get {
            return sideLength * 3.0;
        }
        set {
            sideLength = newValue / 3.0;
        }
    }
    
    override func simpleDesecription() -> String {
        return "A equalateral triangle with side of length \(sideLength)";
    }
}
var triangle = EqualaterTriangle(sideLength: 8.1, name: "a triangle")
//triangle.perimeter = 9.9;
print(triangle.perimeter);
triangle.simpleDesecription()

//class TriangleAndSquare {
//    var triangele = EqualaterTriangle {
//        willSet {
//            square.
//        }
//    }
//
//}


protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class.";
    var antherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjustd.";
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription;

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A Simple structrue"
    mutating func adjust() {
        simpleDescription += "(asjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let dDescription = b.simpleDescription;

func makeArary<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result;
}

makeArary(repeating: "knock", numberOfTimes: 10);
makeArary(repeating: 1, numberOfTimes: 10);
makeArary(repeating: 1.1, numberOfTimes: 2);
makeArary(repeating: aDescription, numberOfTimes: 2);

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
