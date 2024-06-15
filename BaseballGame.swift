//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by mac on 6/14/24.
//

import Foundation

// let input = readLine()
class BaseballGame {
    
    var isPlaying: Bool = true
    var record: Array<Int> = []
    
    func start() {
        while isPlaying {
            print("==================================================")
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            print("==================================================")
            if let userSelect = readLine() {
                switch userSelect {
                case "1":
                    gameProgress()
                case "2":
                    viewRecord()
                case "3":
                    endGame()
                default:
                    print("올바른 숫자를 입력해주세요")
                }
            } else {
                print("올바른 숫자를 입력해주세요")
            }
        }
        
    }
    
    func gameProgress() {
        let answer = makeAnswer()
        let answerArray = Array(String(answer))
        var counter: Int = 0
        var isCorrect: Bool = true
        // 테스트용 정답 공개
        // print("\(answer)")
        print("<게임을 시작합니다>")
        print("정답은 각 자리수가 서로 다른 세자리 자연수입니다")
        print("==================================================")
        
        while isCorrect {
            print("숫자를 입력하세요")
            if let input = Int(readLine()!) {
                if Set(String(input)).count != 3 || Set(String(input)).contains("0") {
                    print("올바르지 않은 입력값입니다")
                    print("==================================================")
                } else {
                    counter += 1
                    var strike: Int = 0
                    var ball: Int = 0
                    let inputArray = Array(String(input))
                    switch input {
                    case answer:
                        print("정답입니다. 축하합니다! \(counter)회만에 성공하셨습니다")
                        record.append(counter)
                        isCorrect = false
                    default:
                        for i in 0...2 {
                            if answerArray.contains(inputArray[i]) {
                                if answerArray[i] == inputArray[i] {
                                    strike += 1
                                } else {
                                    ball += 1
                                }
                            }
                        }
                        if strike >= 1 , 1 <= ball {
                            print("\(strike)스트라이크 \(ball)볼")
                        } else if strike >= 1 , ball == 0 {
                            print("\(strike)스트라이크")
                        } else if strike == 0 , ball >= 1 {
                            print("\(ball)볼")
                        } else {
                            print("Nothing")
                        }
                    }
                }
            } else {
                print("올바르지 않은 입력값입니다")
                print("==================================================")
            }
            
        }
    }
    
    func viewRecord() {
        var counter: Int = 0
        if record.isEmpty {
            print("게임 기록이 존재하지 않습니다.")
        } else {
            print("<게임 기록 보기>")
            for eachGame in record {
                counter += 1
                print("\(counter)번째 게임 : 시도 횟수 - \(eachGame)회")
            }
        }
       
    }

    func endGame() {
        print("<숫자 야구 게임을 종료합니다>")
        isPlaying = false
    }
    // 중복 없는 세자리 정답 수 만들기
    func makeAnswer() -> Int{
        // 루프 생성
        while true {
            // 랜덤 세자리 수 생성
            let num: Int = Int.random(in: 111...999)
            let testSet: Set<Character>
            // 집합의 특성(중복 제거)을 이용해 자리수 중복되는 숫자 체크
            testSet = Set(String(num))
            // 집합의 카운트가 3인경우 중복이 없으므로 루프 종료
            if testSet.count == 3 {
                if testSet.contains("0") {
                    continue
                } else {
                    return num
                }
            }
        }
    }
}



