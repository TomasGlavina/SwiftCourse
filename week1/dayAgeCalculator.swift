import UIKit

/*

var greeting = "Hello, playground"

greeting.count

greeting += " It's a nice day."

let s1 = "Swift"
let s2 = "SwiftUI"

s1 + " and " + s2

if s1 == s2 {
    print ("\(s1) is the same as \(s2)")
} else {
    print ("\(s1) is not the same as \(s2)")
}

var spaceCount = 0

for c in greeting {
    if c == " " {
        spaceCount+=1
    }
}

"The greeting has \(spaceCount) spaces."

 //Getting playground from greeting string
let playgroundLength = "playground".count

/*
 Using index ranges when you know where it is, uselss but nice to know the syntax
let worldStart = greeting.index(greeting.startIndex, offsetBy: 7)

let worldEnd = greeting.index(greeting.startIndex, offsetBy: 7 + worldLength)
//Range to know the characters
let worldRange = worldStart ..< worldEnd
//getting the word from range
let world = greeting[worldRange]
*/

let playgroundRange = greeting.range(of: "playground")
let playground = greeting[playgroundRange!]



let months = 1...12
let monthDays = 1...31
let unixYears = 1970..<2038

var output = "Valid months are: "

for m in months {
    output += "\(m) "
}

print(output)

output = "Valid days are: "
for d in monthDays {
    output += "\(d) "
}

print(output)


print("Unix time covers the years \(unixYears.first!) to \(unixYears.last!)")
 */


func isLeapYear(year: Int) -> Bool {
    guard year >= 1582 else {
        return false
    }
    return (year % 4 == 0 && !(year % 100 == 0)) || (year % 400 == 0)
}

/*
 TESTING FUNCS
isLeapYear(year: 2004)
isLeapYear(year: 2020)
isLeapYear(year: 2023)
*/

func daysInMonth(year: Int, month: Int) -> Int {
    guard (1...12).contains(month) else {
        print("Month must be 1...12!")
        return 0
    }
    
    var result = 0
    
    switch month {
        
    case 1, 3, 5, 7, 8, 10, 12:
        result = 31
    case 4, 6, 9, 11:
        result = 30
    case 2:
        if(isLeapYear(year: year)) {
            result = 29
        }
        else {
            result = 28
        }
    default:
        break
    }
    
    return result
}


daysInMonth(year: 1996, month: 2)

let todayYear = 2023
let todayMonth = 3
let todayDay = 17

let birthYear = 1996
let birthMonth = 2
let birthDay = 1

var totalDays = 0

var daysToAdd = daysInMonth(year: birthYear, month: birthMonth) - birthDay
totalDays += daysToAdd

var year = birthYear
var month = birthMonth + 1

while month <= 12 {
    daysToAdd = daysInMonth(year: year, month: month)
    totalDays += daysToAdd
    month += 1
}

year += 1

while year < todayYear {
    totalDays += 365
    if (isLeapYear(year: year)) {
        totalDays += 1
    }
    year += 1
}


month = 1

while month < todayMonth {
    totalDays += daysInMonth(year: year, month: month)
    month += 1
}

totalDays += todayDay

print("You are \(totalDays) days old")





















