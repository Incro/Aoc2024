import Foundation

let file = "input.txt"
let dir = URL(filePath: FileManager.default.currentDirectoryPath)
let input = try String(contentsOf: dir.appending(path: file), encoding: .utf8)

print("Day 3 Part 1")

// print("Input  \(input)")


struct Tokenizer {

    func tokenize(_ input: String) {
        let chars: [Character] = Array(input)
        let maxIndex = chars.endIndex - 1
        var tokens: [Token] = []
        
        for e in chars {
            if let num = Int("\(e)") {
                tokens.append(Token.number(num))
            } else {
                tokens.append(Token.any("\(e)"))
            }
        }
        print(tokens)

    }
}

let tokenizer = Tokenizer()

tokenizer.tokenize(input)


enum Token {
    case any(String)
    case number(Int)
    case mul
    case bracketOpen
    case bracketClosed
}