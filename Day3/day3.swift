import Foundation
import RegexBuilder

let file = "input.txt"
let dir = URL(filePath: FileManager.default.currentDirectoryPath)
let input = try String(contentsOf: dir.appending(path: file), encoding: .utf8)

print("Day 3 Part 1")


let searchMul = Regex {
            "mul("
            Capture {
                OneOrMore(.digit)
            }
            ","
            Capture {
                OneOrMore(.digit)
            }
            ")"
            
        }


let matches = input.matches(of: searchMul)
print(matches.count)
var result: Int = 0
for match in matches {
    print("Full \(match.0), first number \(match.1) second number \(match.2)")
    let multiplied = Int(match.1)! * Int(match.2)!  
    result += multiplied
}

print(result)




extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}