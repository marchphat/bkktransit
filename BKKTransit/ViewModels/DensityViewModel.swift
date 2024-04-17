//
//  DensityViewModel.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 31/3/2567 BE.
//

import Foundation
import Alamofire

final class DensityViewModel: ObservableObject {
    @Published var stationDensity: StationDensity?
    
    //MARK: - Station Density
    func sendUserStatusToServer(userStatus: UserStatus) {
        guard let jsonData = try? JSONEncoder().encode(userStatus) else {
            print("Error encoding Station Density")
            return
        }
        
        guard let parameters = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
            print("Error converting Station Density to JSON")
            return
        }
        
        let url = "http://localhost:5214/api/density/station-add"
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"])
        .validate()
        .responseDecodable(of: String.self) { response in
                switch response.result {
                case .success(let value):
                    print("Success send station density: \(value)")
                case .failure(let error):
                    print("Error send station density: \(error.localizedDescription)")
                }
            }
    }
    
    func updateUserStatusToServer(userStatus: UserStatus) {
        guard let jsonData = try? JSONEncoder().encode(userStatus) else {
            print("Error encoding Station Density")
            return
        }
        
        guard let parameters = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
            print("Error converting Station Density to JSON")
            return
        }
        
        let url = "http://localhost:5214/api/density/station-update"
        
        AF.request(url,
                   method: .put,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"])
        .validate()
        .responseDecodable(of: String.self) { response in
                switch response.result {
                case .success(let value):
                    print("Success update station density: \(value)")
                case .failure(let error):
                    print("Error update station density: \(error.localizedDescription)")
                }
            }
    }
    
    
    func calculateStationDensity(stationId: String?, stationLineColor: String?) {
        guard let stationId = stationId, let stationLineColor = stationLineColor else {
            print("Station is nil value.")
            return
        }
        
        let url = "http://localhost:5214/api/density/station-calculate-density?station_id=\(stationId)&station_linecolor=\(stationLineColor)"
        
        AF.request(url,
                   method: .post)
        .validate()
        .responseDecodable(of: StationDensity.self) { [weak self] response in
            guard let self = self else { return }

            switch response.result {
            case .success(let density):
                self.stationDensity = density
                print("Calculate density success.", density)
            case .failure(let error):
                print("Error calculate station density: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: - Parking Density
}
