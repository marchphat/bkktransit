//
//  findRoutes.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 25/3/2567 BE.
//

import Foundation


func getAllPossibleRoutes(start: String, end: String) -> [Route] {
    
    var adjacencyList: [String: [String]] = [:]

    for route in routes {
        let station1 = route[0]
        let station2 = route[1]
        
        if var adjacentStations = adjacencyList[station1] {
            adjacentStations.append(station2)
            adjacencyList[station1] = adjacentStations
        } else {
            adjacencyList[station1] = [station2]
        }
        
        if var adjacentStations = adjacencyList[station2] {
            adjacentStations.append(station1)
            adjacencyList[station2] = adjacentStations
        } else {
            adjacencyList[station2] = [station1]
        }
    }
    
    func countLineChanges(route: [String], stationLineColors: [String: String]) -> (Int, [String]) {
        var lineChanges = 0
        var nextLineColors: [String] = []
        
        guard route.count >= 2 else {
            return (lineChanges, nextLineColors)
        }
        
        for i in 0..<route.count - 1 {
            let currentStation = route[i]
            let nextStation = route[i + 1]
            
            if let currentLineColor = stationLineColors[currentStation], let nextLineColor = stationLineColors[nextStation] {
                if currentLineColor != nextLineColor {
                    lineChanges += 1
                    nextLineColors.append(nextLineColor)
                }
            }
        }
        
        return (lineChanges, nextLineColors)
    }
    
    
    func findAllRoutesWithLineChanges(start: String, end: String, adjacencyList: [String: [String]], stationLineColors: [String: String], maxRoutes: Int) -> [[String]] {
        var minLineChanges: Int?
        var result: [[String]] = []

        var queue: [(path: [String], lineChanges: Int, visited: Set<String>)] = [([start], 0, [start])]

        while !queue.isEmpty {
            let (path, lineChanges, visited) = queue.removeFirst()
            let currentNode = path.last!

            if currentNode == end {
                if minLineChanges == nil || lineChanges <= minLineChanges! {
                    if lineChanges < minLineChanges ?? Int.max {
                        result = []
                    }
                    minLineChanges = lineChanges
                    result.append(path)
                }
                continue
            }

            let neighbors = adjacencyList[currentNode] ?? []

            for neighbor in neighbors {
                let lineColor = stationLineColors[neighbor] ?? "Unknown"
                let currentLineColor = stationLineColors[currentNode] ?? "Unknown"
                var changes = lineChanges

                if lineColor != currentLineColor {
                    changes += 1
                }

                if !visited.contains(neighbor) {
                    var newPath = path
                    newPath.append(neighbor)
                    var newVisited = visited
                    newVisited.insert(neighbor)
                    queue.append((newPath, changes, newVisited))
                }
            }
        }

        return result.prefix(maxRoutes).map { $0 }
    }
    
    let result = findAllRoutesWithLineChanges(start: start, end: end, adjacencyList: adjacencyList, stationLineColors: stationLineColors, maxRoutes: 3)
    var stationsAllData: [[Station]] = []
    
    do {
        if let url = Bundle.main.url(forResource: "Stations", withExtension: "json") {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([Station].self, from: data)
            
            for routes in result {
                var stationsData: [Station] = []
                
                for route in routes {
                    if let station = decodedData.first(where: { $0.stationId == route }) {
                        let tempStation = Station(stationId: station.stationId,
                                                  name: station.name,
                                                  line: station.line,
                                                  lineColor: station.lineColor,
                                                  isExtended: station.isExtended,
                                                  startTime1: station.startTime1,
                                                  startTime2: station.startTime2,
                                                  startTime3: station.startTime3,
                                                  startTime4: station.startTime4,
                                                  lastTime1: station.lastTime1,
                                                  lastTime2: station.lastTime2,
                                                  lastTime3: station.lastTime3,
                                                  lastTime4: station.lastTime4,
                                                  positionX: station.positionX,
                                                  positionY: station.positionY,
                                                  latitude: station.latitude,
                                                  longitude: station.longitude
                        )
                        stationsData.append(tempStation)
                    }
                }
                
                stationsAllData.append(stationsData)
            }
        }
    } catch {
        print("Error reading or decoding JSON data: \(error)")
    }
    
    var allFees: [Int] = []
    var allTotalTime: [String] = []

    for stations in stationsAllData {
        var fees = 0
        var bCount = 0
        var mCount = 0
        var mpCount = 0
        var aCount = 0
        var extended = false

        var gCount = 0
        var ylCount = 0
        var pkCount = 0
        var drCount = 0
        var lrCount = 0
        
        var station_id: [String] = []

        for station in stations {
            if station.line == "bts" {
                if station.lineColor == "gold" {
                    gCount += 1
                } else {
                    bCount += 1
                    if station.isExtended {
                        extended = true
                    }
                }
            } else if station.line == "mrt" {
                if station.lineColor == "blue" {
                    mCount += 1
                } else if station.lineColor == "purple" {
                    mpCount += 1
                } else if station.lineColor == "yellow" {
                    ylCount += 1
                } else {
                    pkCount += 1
                }
            } else if station.line == "srt" {
                if station.lineColor == "darkred" {
                    drCount += 1
                } else {
                    lrCount += 1
                }
            } else if station.line == "arl" {
                aCount += 1
            }
            station_id.append(station.stationId ?? "0")
        }
        
        if stations[0].line == "bts" {
            if stations[0].lineColor == "gold" {
                gCount -= 1
            } else {
                bCount -= 1
            }
        } else if stations[0].line == "mrt" {
            if stations[0].lineColor == "blue" {
                mCount -= 1
            } else if stations[0].lineColor == "purple" {
                mpCount -= 1
            } else if stations[0].lineColor == "yellow" {
                ylCount -= 1
            } else {
                pkCount -= 1
            }
        } else if stations[0].line == "srt" {
            if stations[0].lineColor == "darkred" {
                drCount += 1
            } else {
                lrCount += 1
            }
        } else if stations[0].line == "arl" {
            aCount -= 1
        }
        
        let changes = countLineChanges(route: station_id, stationLineColors: stationLineColors).1
        for (index, change) in changes.enumerated() {
            if change == "lightgreen" || change == "darkgreen" {
                if index+1 <= changes.count-1 {
                    if changes[index+1] == "lightgreen" || changes[index+1] == "darkgreen" {
                        continue
                    }
                }
                bCount -= 1
            } else if change == "gold" {
                gCount -= 1
            } else if change == "blue" {
                mCount -= 1
            } else if change == "purple" {
                mpCount -= 1
            } else if change == "red" {
                aCount -= 1
            } else if change == "yellow" {
                ylCount -= 1
            } else if change == "pink" {
                pkCount -= 1
            } else if change == "darkred" {
                drCount -= 1
            } else {
                lrCount -= 1
            }
        }
        
        // bts fee
        if bCount == 1 {
            fees += 16
            if extended { fees += 1 }
        } else if bCount == 2 {
            fees += 23
            if extended { fees += 2 }
        } else if bCount == 3 {
            fees += 26
            if extended { fees += 2 }
        } else if bCount == 4 {
            fees += 30
            if extended { fees += 2 }
        } else if bCount == 5 {
            fees += 33
            if extended { fees += 2 }
        } else if bCount == 6 {
            fees += 37
            if extended { fees += 3 }
        } else if bCount == 7 {
            fees += 40
            if extended { fees += 3 }
        } else if bCount >= 8 {
            fees += 44
            if extended { fees += 3 }
        }

        // mrt blue fee
        if mCount == 1 {
            fees += 16
        } else if mCount == 2 {
            fees += 19
        } else if mCount == 3 {
            fees += 21
        } else if mCount == 4 {
            fees += 23
        } else if mCount == 5 {
            fees += 25
        } else if mCount == 6 {
            fees += 28
        } else if mCount == 7 {
            fees += 30
        } else if mCount == 8 {
            fees += 32
        } else if mCount == 9 {
            fees += 35
        } else if mCount == 10 {
            fees += 37
        } else if mCount == 11 {
            fees += 39
        } else if mCount >= 12 {
            fees += 42
        }

        // mrt purple fee
        if mpCount == 1 {
            fees += 17
        } else if mpCount == 2 {
            fees += 20
        } else if mpCount == 3 {
            fees += 23
        } else if mpCount == 4 {
            fees += 25
        } else if mpCount == 5 {
            fees += 27
        } else if mpCount == 6 {
            fees += 30
        } else if mpCount == 7 {
            fees += 33
        } else if mpCount == 8 {
            fees += 36
        } else if mpCount == 9 {
            fees += 38
        } else if mpCount == 10 {
            fees += 40
        } else if mpCount >= 11 {
            fees += 42
        }

        // arl fee
        if aCount == 1 {
            fees += 15
        } else if aCount == 2 {
            fees += 20
        } else if aCount == 3 {
            fees += 25
        } else if aCount == 4 {
            fees += 30
        } else if aCount == 5 {
            fees += 35
        } else if aCount == 6 {
            fees += 40
        } else if aCount == 7 {
            fees += 45
        }

        // gold fee
        if gCount > 0 { fees += 16 }
        
        // yellow fee
        if ylCount == 1 {
            fees += 18
        } else if ylCount == 2 {
            fees += 22
        } else if ylCount == 3 {
            fees += 24
        } else if ylCount == 4 {
            fees += 27
        } else if ylCount == 5 {
            fees += 30
        } else if ylCount == 6 {
            fees += 33
        } else if ylCount == 7 {
            fees += 38
        } else if ylCount == 8 {
            fees += 42
        } else if ylCount >= 9 {
            fees += 45
        }
        
        // pink fee
        if pkCount == 1 {
            fees += 17
        } else if pkCount == 2 {
            fees += 21
        } else if pkCount == 3 {
            fees += 23
        } else if pkCount == 4 {
            fees += 26
        } else if pkCount == 5 {
            fees += 28
        } else if pkCount == 6 {
            fees += 30
        } else if pkCount == 7 {
            fees += 36
        } else if pkCount == 8 {
            fees += 39
        } else if pkCount == 9 {
            fees += 41
        } else if pkCount == 10 {
            fees += 44
        } else if pkCount >= 11 {
            fees += 45
        }
        
        // srt fee
        let srtCount = drCount + lrCount
        if srtCount == 1 {
            fees += 14
        } else if srtCount == 2 {
            fees += 16
        } else if srtCount == 3 {
            fees += 19
        } else if srtCount == 4 {
            fees += 23
        } else if srtCount == 5 {
            fees += 26
        } else if srtCount == 6 {
            fees += 29
        } else if srtCount == 7 {
            fees += 33
        } else if srtCount == 8 {
            fees += 39
        } else if srtCount >= 9 {
            fees += 42
        }

        allFees.append(fees)
        
        var totalTime: TimeInterval = 0
        totalTime += Double(bCount * (2 * 60))
        totalTime += Double(mCount * (2 * 60))
        totalTime += Double(mpCount * (3 * 60))
        totalTime += Double(aCount * (3 * 60 + 40))
        totalTime += Double(gCount * (4 * 60))
        totalTime += Double(ylCount * (2 * 60))
        totalTime += Double(pkCount * (2 * 60))
        totalTime += Double(drCount * (2 * 60 + 50))
        totalTime += Double(lrCount * (5 * 60 + 20))
        
        allTotalTime.append(String(totalTime))
    }
    
    var allRoutes: [Route] = []
        
    for (index, element) in stationsAllData.enumerated() {
        allRoutes.append(Route(stations: element, fee: allFees[index], time: allTotalTime[index]))
    }
    
    return allRoutes
}

