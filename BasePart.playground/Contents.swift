import UIKit

var str = "Hello, playground"

let min = 0;
let max = 10;

var x = 0.0, y = 0.0, z = 0.0;

let x1 = 0.0, y1 = 0.0, z1 = 0.0;

if x == x1 {
    print("销售收入: \(x1 == x)")
}

var welcomeMessage: String
welcomeMessage = "Hello Eveyone!"

var red, green, blue: Double

var friendlyWelcome = "Hello"
friendlyWelcome = friendlyWelcome + " Swift"
//friendlyWelcome = friendlyWelcome + 1

let languageName = "Swift"
//languageName = "Swift ++"


var possibleNumber = "23"
let converPossibleNumber = Int(possibleNumber)

possibleNumber = "1-"
//converPossibleNumber = Int(possibleNumber)

var serverResponseCode: Int? = 0;
serverResponseCode = nil;

var surveyAnwer: String?

func throwError() throws {
    // 这个函数可能抛出异常
}

do {
    try throwError();
    // 没有错误抛出
    
} catch {
    // 有错误抛出
    
}

func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
