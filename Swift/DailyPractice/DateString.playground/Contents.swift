//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let startDate = "2017-12-05 13:00:00"
let endDate = "2017-12-07 00:00:00"


let prefixDateList = startDate.components(separatedBy: " ")
let prefixDate = prefixDateList[0]
let prefixComponentedDate = prefixDate.components(separatedBy: "-")
prefixComponentedDate

// let now =
let currentDate = Date()
let calendar = Calendar.current
//let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//let year =  components.year
//let month = components.month
//let day = components.day
//let hour = components.hour
//let minute = components.minute
//let second = components.second
//
//print(year!)
//print(month!)
//print(day!)
//print(hour!)
//print(minute!)
//print(second!)

//let currentDate = "\(year!)-\(month!)-\(day!) \(hour!):\(minute!):\(second!)"
//currentDate


var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

var startDateType = dateFormatter.date(from: startDate)
print(startDateType!)

var endDateType = dateFormatter.date(from: endDate)
print(endDateType!)

let diffInDays = Calendar.current.dateComponents([.day], from: currentDate, to: startDateType!).day
print("\(diffInDays!) days later")

let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startDateType!)
let year =  components.year
let month = components.month
let day = components.day
let hour = components.hour

if let diffInDays = diffInDays {
  if let month = month {
    if let day = day {
      if let hour = hour {
        let completeString = "\(diffInDays)天后的 \(month)月\(day)日\(hour)点, 优惠活动内容介绍"
        print(completeString)
      }
    }
  }
}



// 0天后的00月00日00点, 优惠活动内容介绍


//func daysBetweenDates(startDate: NSDate, endDate: NSDate) -> Int {
//  let calendar = Calendar.current
//  let components = calendar.dateComponents(.day, from: startDate, to: endDate)
//  return components.day
//}
//
