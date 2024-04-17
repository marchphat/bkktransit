//
//  Timetable.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 24/3/2567 BE.
//

import Foundation

// BTS add bottom to all and fix top to be same as bottom
var timetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 2, seconds: 40),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 3, seconds: 35),
    TimeSpan(hours: 9, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 30),
    TimeSpan(hours: 16, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 25),
    TimeSpan(hours: 16, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 2, seconds: 40),
    TimeSpan(hours: 17, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 2, seconds: 40),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 25),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

var extendedTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 20),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 3, seconds: 35),
    TimeSpan(hours: 9, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 30),
    TimeSpan(hours: 16, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 25),
    TimeSpan(hours: 16, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 20),
    TimeSpan(hours: 17, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 20),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 25),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

var darkgreenTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 3, seconds: 45),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 9, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 16, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 16, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 17, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 3, seconds: 45),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

var holidayTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 8, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 55),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 55),
    TimeSpan(hours: 11, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 30),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

var holidayExtendedTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 8, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 55),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 55),
    TimeSpan(hours: 11, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 0),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

var holidayDarkgreenTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 8, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 40),
    TimeSpan(hours: 11, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 40),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

// MRT fix blue and purple
var blueTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),

    TimeSpan(hours: 5, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 3, seconds: 30),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 40),
    TimeSpan(hours: 16, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 17, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 3, seconds: 50),
    TimeSpan(hours: 19, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 20),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 15),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 15)
]

var holidayBlueTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),

    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    TimeSpan(hours: 16, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 25),
    TimeSpan(hours: 19, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0)
]

var purpleTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 0),

    TimeSpan(hours: 5, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 7, seconds: 12),
    TimeSpan(hours: 6, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 50),
    TimeSpan(hours: 8, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 25),
    TimeSpan(hours: 9, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 30),
    TimeSpan(hours: 17, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 4, seconds: 50),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 6, seconds: 25),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 30),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 30)
]

var holidayPurpleTimetable: [TimeSpan: TimeSpan] = [
//    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 0),

    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 30),
    TimeSpan(hours: 10, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 30),
    TimeSpan(hours: 19, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 30),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 9, seconds: 30)
]

// ARL
var arlTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 5, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0)
]

var arlHolidayTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 5, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 12, seconds: 0),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0)
]


// gold bts
var goldTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 16, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    TimeSpan(hours: 21, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0)
]

var goldHolidayTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    TimeSpan(hours: 10, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 15, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 8, seconds: 0),
    TimeSpan(hours: 22, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 23, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0)
]

// yellow mrt
var yellowTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 9, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 17, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0)
]

var yellowHolidayTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 15, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0)
]

// pink mrt
var pinkTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 6, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 8, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 16, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 5, seconds: 0),
    TimeSpan(hours: 19, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0)
]

var pinkHolidayTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 6, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 10, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 20, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0)
]

// srtet
var darkredTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 5, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    TimeSpan(hours: 7, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 9, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    TimeSpan(hours: 17, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 10, seconds: 0),
    TimeSpan(hours: 19, minutes: 30, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 15, seconds: 0)
]

var lightredTimetable: [TimeSpan: TimeSpan] = [
    TimeSpan(hours: 0, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 20, seconds: 0),
    
    TimeSpan(hours: 5, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 20, seconds: 0),
    
    TimeSpan(hours: 24, minutes: 0, seconds: 0): TimeSpan(hours: 0, minutes: 20, seconds: 0),
]
