import Foundation

let file = "input.txt"
let dir = URL(filePath: FileManager.default.currentDirectoryPath)
let input = try String(contentsOf: dir.appending(path: file), encoding: .utf8)

print("Day 3 Part 1")

// print("Input  \(input)")


struct Tokenizer {

    func tokenize(_ input: String) {
        let chars: [Character] = Array(input)
        print(chars)
        var tokens: [Token] = []

        var processed: [Character] = []
        var currentToken: [Character] = []

        let curr = chars[1..<3]
        print(curr)
        

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