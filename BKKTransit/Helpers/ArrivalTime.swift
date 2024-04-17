//
//  ArrivingTime.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 24/3/2567 BE.
//

import Foundation

func getArrivingTime(station_id: String) -> [String] {
    var start_time_1: String = "00:00:00"
    var start_time_2: String = "00:00:00"
    var start_time_3: String = "00:00:00"
    var start_time_4: String = "00:00:00"
    var last_time_1: String = "00:00:00"
    var last_time_2: String = "00:00:00"
    var last_time_3: String = "00:00:00"
    var last_time_4: String = "00:00:00"
    
    var station_linecolor = ""
    var is_extended = false
    var table: [TimeSpan: TimeSpan] = [:]
    
    do {
        if let url = Bundle.main.url(forResource: "Stations", withExtension: "json") {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([Station].self, from: data)
            let filteredData = decodedData.first(where: { $0.stationId == station_id })
            start_time_1 = filteredData!.startTime1
            start_time_2 = filteredData!.startTime2
            last_time_1 = filteredData!.lastTime1
            last_time_2 = filteredData!.lastTime2
            is_extended = filteredData!.isExtended
            station_linecolor = filteredData!.lineColor!
            if station_id == "BL01" {
                start_time_3 = filteredData!.startTime3!
                last_time_3 = filteredData!.lastTime3!
            } else if station_id == "CEN" {
                start_time_3 = filteredData!.startTime3!
                start_time_4 = filteredData!.startTime4!
                last_time_3 = filteredData!.lastTime3!
                last_time_4 = filteredData!.lastTime4!
            }
        }
    } catch {
        print("Error reading or decoding JSON data: \(error)")
    }
    
    func calculateArrivingTime(timetable: [TimeSpan: TimeSpan], start_time: String, last_time: String) -> TimeInterval {
        var result: TimeInterval = 0
        var interval: TimeInterval = 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var currentTimeInterval = Date().timeIntervalSince(dateFormatter.date(from: "2024-03-12 00:00:00")!)
        // + delay 18 mins (not sure why)
        currentTimeInterval += 18 * 60
        currentTimeInterval = currentTimeInterval.truncatingRemainder(dividingBy: 86400)
        
        let timetableKeys = timetable.keys.sorted()
        dateFormatter.dateFormat = "HH:mm:ss"
        let start_timedate = dateFormatter.date(from: start_time)
        let last_timedate = dateFormatter.date(from: last_time)
        
        var startTimeInterval: TimeInterval = start_timedate!.timeIntervalSince(dateFormatter.date(from: "00:00:00")!)
        startTimeInterval = startTimeInterval.truncatingRemainder(dividingBy: 86400)
        
        var lastTimeInterval: TimeInterval = last_timedate!.timeIntervalSince(dateFormatter.date(from: "00:00:00")!)
        if lastTimeInterval < TimeSpan(hours: 23, minutes: 59, seconds: 59).toTimeInterval() && lastTimeInterval < TimeSpan(hours: 2, minutes: 0, seconds: 0).toTimeInterval() {
            lastTimeInterval += 86400
        }
        
        var temp = startTimeInterval

        if currentTimeInterval < TimeSpan(hours: 23, minutes: 59, seconds: 59).toTimeInterval() && currentTimeInterval < startTimeInterval {
            currentTimeInterval += 86400
        }
        
        if currentTimeInterval > lastTimeInterval && currentTimeInterval.truncatingRemainder(dividingBy: 86400) < startTimeInterval {
            result = startTimeInterval
            return result
        }
        
        first: for (index, key) in timetableKeys.enumerated() {
            let nextKey = index+1 < timetableKeys.count ? timetableKeys[index+1] : TimeSpan(hours: 26, minutes: 0, seconds: 0)
            
            interval = timetable[key]!.toTimeInterval()
            
            second: while temp < nextKey.toTimeInterval() && temp < currentTimeInterval && temp < lastTimeInterval  {
                temp += interval
                
                if temp >= currentTimeInterval && temp <= lastTimeInterval {
                    result = temp
                    break first
                } else
                if temp > lastTimeInterval {
                    result = startTimeInterval
                    break first
                }
            }
        }

        result = result.truncatingRemainder(dividingBy: 86400)
        
        return result
    }
    
    var result: [String] = []
    
    let currentDate = Date()
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: currentDate)
    
    switch station_linecolor {
    case "lightgreen":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            if is_extended {
                table = holidayExtendedTimetable
            } else {
                table = holidayTimetable
            }
        } else {
            if is_extended {
                table = extendedTimetable
            } else {
                table = timetable
            }
        }
    case "darkgreen":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = holidayDarkgreenTimetable
        } else {
            table = darkgreenTimetable
        }
    case "blue":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = holidayBlueTimetable
        } else {
            table = blueTimetable
        }
    case "purple":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = holidayPurpleTimetable
        } else {
            table = purpleTimetable
        }
    case "red":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = arlHolidayTimetable
        } else {
            table = arlTimetable
        }
    case "gold":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = goldHolidayTimetable
        } else {
            table = goldTimetable
        }
    case "yellow":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = yellowHolidayTimetable
        } else {
            table = yellowTimetable
        }
    case "pink":
        if dayOfWeek == 1 || dayOfWeek == 7 {
            table = pinkHolidayTimetable
        } else {
            table = pinkTimetable
        }
    case "darkred":
        table = darkredTimetable
    default:
        table = lightredTimetable
    }
    
    if start_time_1 != last_time_1 {
        result.append(calculateArrivingTime(timetable: table, start_time: start_time_1, last_time: last_time_1).toTimeSpan().toDateString())
    } else {
        result.append("out of service")
    }
    
    if start_time_2 != last_time_2 {
        result.append(calculateArrivingTime(timetable: table, start_time: start_time_2, last_time: last_time_2).toTimeSpan().toDateString())
    } else {
        result.append("out of service")
    }
    
    if station_id == "BL01" {
        result.append(calculateArrivingTime(timetable: table, start_time: start_time_3, last_time: last_time_3).toTimeSpan().toDateString())
    } else if station_id == "CEN" {
        switch dayOfWeek {
        case 1:
            table = holidayDarkgreenTimetable
        case 7:
            table = holidayDarkgreenTimetable
        default:
            table = darkgreenTimetable
        }
        result.append(calculateArrivingTime(timetable: table, start_time: start_time_3, last_time: last_time_3).toTimeSpan().toDateString())
        result.append(calculateArrivingTime(timetable: table, start_time: start_time_4, last_time: last_time_4).toTimeSpan().toDateString())
    }
    
    return result
}
