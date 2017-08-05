//
//  main.swift
//  KakaoProgrammers
//
//  Created by Seoksoon Jang on 2017. 8. 5..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

// https://programmers.co.kr/tryouts/3/challenge_algorithm_codes/1498
// Kakao Programmers : test tutorial problem.

/*
 직사각형을 만드는 데 필요한 4개의 점 중 3개의 좌표가 주어질 때, 나머지 한 점의 좌표를 구하려고 합니다. 점 3개의 좌표가 들어있는 배열 v가 매개변수로 주어질 때, 직사각형을 만드는 데 필요한 나머지 한 점의 좌표를 return 하도록 solution 함수를 완성해주세요. 단, 직사각형의 각 변은 x축, y축에 평행하며, 반드시 직사각형을 만들 수 있는 경우만 입력으로 주어집니다.
 
 제한사항
 v는 세 점의 좌표가 들어있는 2차원 배열입니다.
 v의 각 원소는 점의 좌표를 나타내며, 좌표는 [x축 좌표, y축 좌표] 순으로 주어집니다.
 좌표값은 1 이상 10억 이하의 자연수입니다.
 직사각형을 만드는 데 필요한 나머지 한 점의 좌표를 [x축 좌표, y축 좌표] 순으로 담아 return 해주세요.
 입출력 예
 v	result
 [[1, 4], [3, 4], [3, 10]]	[1, 10]
 [[1, 1], [2, 2], [1, 2]]	[2, 1]
 입출력 예 설명
 입출력 예 #1
 세 점이 [1, 4], [3, 4], [3, 10] 위치에 있을 때, [1, 10]에 점이 위치하면 직사각형이 됩니다.
 
 입출력 예 #2
 세 점이 [1, 1], [2, 2], [1, 2] 위치에 있을 때, [2, 1]에 점이 위치하면 직사각형이 됩니다.
 */
import Foundation

enum CoordinationError: Error {
    case yCoordinationNotDecided
    case xCoordinationNotDecided
    case listOfPairXCoordinateEqualNotDecided
    case solutionNotFound
}

func yTerminator(inputList: [[Int]]) throws -> Int {
    var yCheckDict = [Int:Int]()
    
    inputList.forEach{
        // y : $0[1]
        let yKey = $0[1]
        
        if let count = yCheckDict[yKey] {
            let increasedCount = Int(count) + 1
            yCheckDict[yKey] = increasedCount
        } else {
            yCheckDict[yKey] = 1
        }
    }
    var resultY: Int?
    for (k, v) in yCheckDict {
        if v == 1 {
            resultY = k
        }
    }
    
    guard resultY != nil else {
        throw CoordinationError.yCoordinationNotDecided
    }
    
    return resultY!
}

func listOfPairXCoordinateEqualTerminator(inputList: [[Int]]) throws -> [[Int]] {
    let listOfPairXCoordinateEqual: [[Int]] = inputList.filter {
        if let resultY = try? yTerminator(inputList: inputList) {
            if $0[1] == resultY {
                return false
            }
        }
        return true
    }
    return listOfPairXCoordinateEqual
}

func xTerminator(inputList: [[Int]], resultY: Int) throws -> Int {
    if let listOfPairXCoordinateEqual = try? listOfPairXCoordinateEqualTerminator(inputList: inputList) {
        let listContainingResultY = returnCoordinateListContainingResultY(inputList: inputList, resultY: resultY)
        let listContainingResultX = listOfPairXCoordinateEqual.filter {
            let x = $0[0]
            let xInResultYList = listContainingResultY[0]
            
            if x == xInResultYList {
                return false
            }
            return true
        }
        
        // [[Int]] type is created by filter so, and there should be only one element in list.
        let resultX = listContainingResultX[0][0]
        return resultX
    }
    
    throw CoordinationError.xCoordinationNotDecided
}

func returnCoordinateListContainingResultY(inputList: [[Int]], resultY: Int) -> [Int] {
    let yResultCoordinateList = inputList.filter { coordinationList in
        let y = coordinationList[1]
        
        if y != resultY {
            return false
        }
        
        return true
    }
    
    // [[Int]] type is created by filter so, and there should be only one element in list.
    return yResultCoordinateList[0]
}

func solution(_ v: [[Int]]) -> [Int] {
    
    /// #step1, filter to get result Y.
    if let resultY = try? yTerminator(inputList: v) {
        print("resultY : \(resultY)")
        
        /// step2, filter to get result X.
        if let resultX = try? xTerminator(inputList: v, resultY: resultY) {
            ///  Step3, success all, therefore, combine them into one.
            var ans = [Int]()
            ans.append(resultX)
            ans.append(resultY)
            
            // Step4, return required list.
            return ans
        }
    }
    
    // otherwise, error.
    return [Int]()
}

var givenCoordinationList =  [[1, 1], [2, 2], [1, 2]] /* [[1, 4], [3, 4], [3, 10]] */
print("given List : \(givenCoordinationList)")
let result = solution(givenCoordinationList)
print(result)
