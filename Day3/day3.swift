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
    // print("Full \(match.0), first number \(match.1) second number \(match.2)")
    let multiplied = Int(match.1)! * Int(match.2)!  
    result += multiplied
}

// print(result)



print("Day 3 Part 2")

let searchMulWithDo = Regex {
            "do()"
            Optionally {
                .any
            }
            // NegativeLookahead {
            //     "don't()"
            // }
            Optionally {
            .any
            }
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


let findDos = Regex {
    Capture {OneOrMore {
        "do()"
    }
    }
    
    ZeroOrMore(.any)
    NegativeLookahead {
        "do()"
    }
    OneOrMore {
        "dont't"
    }
}

let findDonts = Regex {
    Capture {
        OneOrMore {
            "don't"
        }
    }
}

let found = input.matches(of: findDos)
print(found.count)
for f in found {
    print(f.0)
}

let foundDont = input.matches(of: findDonts)
for f in foundDont {
    print(f.0)
}

// let matchesDo = input.matches(of: searchMulWithDo)
// print(matchesDo.count)

// var result2 = 0 
// for match in matchesDo {
//     print("Matching: \(match.0) with num 1 \(match.1) and \(match.2)")
//     let multi = Int(match.1)! * Int(match.2)!
//     result2 += multi
// }

// if let firstMul = try? searchMul.firstMatch(in: input) {
//     result2 += Int(firstMul.output.1)! * Int(firstMul.output.2)! 
// }

// print(result2)

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}