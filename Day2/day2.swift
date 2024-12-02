import Foundation

let file = "input.txt"
let dir = URL(filePath: FileManager.default.currentDirectoryPath)
let input = try String(contentsOf: dir.appending(path: file), encoding: .utf8)
// print(input)

let lines = input.split(whereSeparator: \.isNewline)
.map({
    $0.split(separator: " ").map(String.init).map({
        text in 
        Int(text)!
    })
})


let orderedLines = lines.map { line in
    if line.first! > line.last! {
        return line.reversed() as [Int]
    } else {
        return line
    }
}

// print(orderedLines)

func isValid(array: [Int]) -> Bool {
  var last: Int?
  var isValid: Bool = true
  for item in array {
    if let lastNumber = last {
      if lastNumber > item {
        print("Last number is larger for last number \(lastNumber) and current number \(item) in array \(array)")
        isValid = false
      }
      if item - lastNumber < 1 || item - lastNumber > 3 {
        print("difference < 1 or > 3 for last number \(lastNumber) and current number \(item) in \(array)")
        isValid = false
      }
      last = item
    } else {
      last = item
    }
  }
  return isValid
}

let checked = orderedLines.map { line in
  Line(line, isValid(array: line))
}

print(checked.filter({$0.isValid == true}).count)

struct Line {
    let array: [Int]
    let isValid: Bool

    init(_ array: [Int], _ isValid: Bool) {
        self.array = array
        self.isValid = isValid
    }
}



/// Part Two 


print("---- Part 2 ----")

func validationResults(array: [Int]) -> [Bool] {
  var last: Int?
  var validationList: [Bool] = []
  for item in array {
    let result = validate(current: item, previous: last)
    last = item
    validationList.append(result)
}
print("Validations for array \(array) is \(validationList) contains \(validationList.filter({$0 == false}).count) invalid numbers")
return validationList
}

func validate(current: Int, previous: Int?) -> Bool {
    guard let previous else {
        return true
    }
    if previous > current {
        return false 
    }
    if current - previous < 1 || current - previous > 3 {
        return false 
    }
    return true
}

struct UnsafeLine {

}