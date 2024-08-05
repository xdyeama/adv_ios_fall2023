//
//  CalendarUtility.swift
//  CalendarHW
//
//  Created by Beket Barlykov  on 05.10.2023.
//

import Foundation

class CalendarUtility{
    let calendar = Calendar.current
    
    func plusMonth(date: Date) -> Date{
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date{
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func getMonthString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }

    func getYearString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int{
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func dayOfMonth(date: Date) -> Int{
        let day = calendar.dateComponents([.day], from: date)
        return day.day!
    }
    
    func firstOfMonth(date: Date) -> Date{
        let first = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: first)!
    }
    
    func getWeekday(date: Date) -> Int{
        let weekday = calendar.dateComponents([.weekday], from: date)
        return weekday.weekday! - 1
    }
}
