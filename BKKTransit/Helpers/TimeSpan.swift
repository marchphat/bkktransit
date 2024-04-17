//
//  TimeSpan.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 24/3/2567 BE.
//

import Foundation

struct TimeSpan: Hashable, Comparable {
    static func < (lhs: TimeSpan, rhs: TimeSpan) -> Bool {
        let lhsTotalSeconds = lhs.hours * 3600 + lhs.minutes * 60 + lhs.seconds
        let rhsTotalSeconds = rhs.hours * 3600 + rhs.minutes * 60 + rhs.seconds
        return lhsTotalSeconds < rhsTotalSeconds
    }
    
    var hours: Int
    var minutes: Int
    var seconds: Int

    init(hours: Int, minutes: Int, seconds: Int) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }

    func toTimeInterval() -> TimeInterval {
        return TimeInterval((hours * 3600) + (minutes * 60) + seconds)
    }
    
    func toDateTime() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss Z"
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
        let dateString = "\(hours):\(minutes):\(seconds) +0700"
        return dateFormatter.date(from: dateString)!
    }
    
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateString = "\(hours):\(minutes):\(seconds)"
        let date = dateFormatter.date(from: dateString)!
        return dateFormatter.string(from: date)
    }
}

extension TimeInterval {
    func toTimeSpan() -> TimeSpan {
        return TimeSpan(hours: Int(self)/3600, minutes: (Int(self)%3600)/60, seconds: Int(self)%60)
    }
}
