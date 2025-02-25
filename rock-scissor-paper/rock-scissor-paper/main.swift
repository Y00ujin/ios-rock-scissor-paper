import Foundation

var isDone: Bool = false

func getMenuInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input = readLine() else {
        return Int()
    }
    
    guard let intInput = Int(input) else {
        return Int()
    }
    
    return intInput
}

func createRandomNumber() -> Int {
    let computerRandomNumber = Int.random(in: 1...3)
    
    return computerRandomNumber
}

func analysisUserInput(userInput: Int) {
    let computerRandomNumber = createRandomNumber()
    
    if userInput == computerRandomNumber {
        print("비겼습니다!\n")
    } else if computerRandomNumber + 1 == userInput || computerRandomNumber == 3 && userInput == 1 {
        print("이겼습니다!\n")
        isDone = true
    } else if userInput == 0 {
        isDone = true
        return
    } else if computerRandomNumber - 1 == userInput || computerRandomNumber == 1 && userInput == 3 {
        print("졌습니다!\n")
        isDone = true
    } else {
        print("잘못된 입력입니다. 다시 시도해 주세요.\n")
        analysisUserInput(userInput: getMenuInput())
    }
}

while !isDone {
    analysisUserInput(userInput: getMenuInput())
}
