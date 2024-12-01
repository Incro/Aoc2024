import Foundation



func main() throws {
    print("running main func")
    let file = "input.txt"
     let dir = FileManager.default.currentDirectoryPath 
     let dirUrl = URL(filePath: dir)
    let input = try String(contentsOf: dirUrl.appending(path: file), encoding: .utf8)
    // print(input)

    let lines = input.split(whereSeparator: \.isNewline)
    // print(lines)

    var firstCol: [Int] = []
    var secondCol: [Int] = []

    for line in lines {
        let row = line.split(separator: "   ")
        // print(row)
        firstCol.append(Int(row[0])!)
        secondCol.append(Int(row[1])!)
    }

    firstCol.sort()
    secondCol.sort()

    var difference: [Int] = []
    for (col1, col2) in zip(firstCol, secondCol) {
       difference.append(abs(col1 - col2))
    }

    print(difference)
    print("Difference: \(difference.reduce(0, +))")


    print("Part 2: Similarity Score")   
    let similarityList = firstCol.map({item in
        item * secondCol.count { $0 == item}
    })
    print(similarityList)
    print("Similarity Score: \(similarityList.reduce(0, +))")

}

try main()


