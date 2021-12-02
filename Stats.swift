/*
* Calculates the mean median and mode of number sets.
* @author  Malcolm Tompkins
* @version 1.0
* @since 2020-11-27
*/

import Foundation

// Function for input
let input = CommandLine.arguments
let file = input[1]
// this is the file. we will write to and read from it
var array: [String] = []
var arrayInt: [Int] = []
// FileManager is the way to write and read files in swift
if let dir = FileManager.default.urls(for: .documentDirectory,
                                      in: .userDomainMask).first {
    let fileURL = dir.appendingPathComponent(file)
    do {
        // how to read the file.
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        array = text.components(separatedBy: .newlines)
    } catch {print("error")}
} else { print("error2") }

for counter in array where !counter.isEmpty {
    arrayInt.append(Int(counter)!)
}
print(arrayInt)

print("\nCalculating stats...")
let meanPrint = try mean(arrayOfNumbers: arrayInt)
let medianPrint = try median(arrayOfNumbers: arrayInt)

print("The mean is: \(meanPrint)")
print("The median is: \(medianPrint)")

print("\nDone.\n")

// Function for calculations
func mean (arrayOfNumbers: [Int]) throws -> Double {
    let numberOfNumbers = arrayOfNumbers.count
    var total = 0
    for tempNumber in arrayOfNumbers {
        total +=  tempNumber
    }
    let mean: Double = Double(total) / Double(numberOfNumbers)
    return mean
}

func median (arrayOfNumbers: [Int]) throws -> Double {
    var returnValue: Double = 0
    var array = arrayOfNumbers
    array.sort()
    let numberOfNumbers = array.count
    if numberOfNumbers % 2 == 0 {
        let elementNumber1 = (numberOfNumbers / 2) - 1
        let median1: Int = array[elementNumber1]
        let elementNumber2 = numberOfNumbers / 2
        let median2: Int = array[elementNumber2]
        returnValue = Double(median1 + median2) / 2
    } else {
        let elementNumber = Int((Double(numberOfNumbers) / 2) + 0.5)
        returnValue = Double(array[elementNumber])
    }
    return returnValue
}
