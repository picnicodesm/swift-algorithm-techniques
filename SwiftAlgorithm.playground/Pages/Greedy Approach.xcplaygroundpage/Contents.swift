//: [Previous](@previous)

import Foundation

func coinChangeGreedy(totalAmount: Int, coins: [Int]) -> (coinCount: Int, steps: [String]) {
    var amount = totalAmount
    var count = 0
    var steps: [String] = []
    
    // 동전들을 내림차순 정렬 (큰 동전부터)
    let sortedCoins = coins.sorted(by: >)
    
    // 선택 절차
    for coin in sortedCoins {
        // 적절성 검색
        while amount >= coin {
            amount -= coin    // 동전 사용
            count += 1        // 사용한 동전 수 증가
            steps.append("동전 \(coin)원 사용, 남은 금액 \(amount)원")
        }
    }
    
    // 해답 검사
    if amount == 0 {
        steps.append("성공: 모든 금액을 맞췄습니다.")
    } else {
        steps.append("실패: 금액을 모두 맞추지 못했습니다. 남은 금액 \(amount)원")
    }
    
    return (count, steps)
}

// 사용 예시
let (coinCount, steps) = coinChangeGreedy(totalAmount: 1260, coins: [500, 100, 50, 10])

print("총 사용한 동전 개수: \(coinCount)")
for step in steps {
    print(step)
}

//: [Next](@next)
