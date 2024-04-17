//
//  UserLocationViewModel.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 31/3/2567 BE.
//

import Foundation
import CoreData

class UserLocationViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedUserStatus: [UserLocationEntity] = []
    private let densityViewModel = DensityViewModel()

    init() {
        container = NSPersistentContainer(name: "UserLocationContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data: Error Loading \(error)")
            } else {
                print("Core Data: Successfully Loaded.")
            }
        }
    }
    
    func fetchData() {
        let request = NSFetchRequest<UserLocationEntity>(entityName: "UserLocationEntity")
        
        do {
            savedUserStatus = try container.viewContext.fetch(request)
            print("Core Data: Fetching: \(savedUserStatus)")
        } catch let error {
            print("Core Data: Error Fetching. \(error)")
        }
    }
    
    func addData(userId: UUID, stationId: String, isUserInside: Bool) {
        fetchData()
        if savedUserStatus.isEmpty {
            print("Core Data: Addd")

            let newData = UserLocationEntity(context: container.viewContext)
            newData.userId = userId
            newData.stationId = stationId
            newData.isUserInside = isUserInside
            saveData()
            
            for user in savedUserStatus {
                let userStatus = UserStatus(userId: user.userId?.uuidString ?? "0",
                                            stationId: user.stationId ?? "0",
                                            userStatus: user.isUserInside)
                densityViewModel.sendUserStatusToServer(userStatus: userStatus)
            }
        }
    }
    
    func updateData(entity: UserLocationEntity, stationId: String, isUserInside: Bool) {
        if !savedUserStatus.isEmpty {
            print("Core Data: Updated")

            entity.stationId = stationId
            entity.isUserInside = isUserInside
            saveData()
            
            for user in savedUserStatus {
                let userStatus = UserStatus(userId: user.userId?.uuidString ?? "0",
                                            stationId: user.stationId ?? "0",
                                            userStatus: user.isUserInside)
                densityViewModel.updateUserStatusToServer(userStatus: userStatus)
            }
        }
    }
    
    func deleteData(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        
        let entity = savedUserStatus[index]
        container.viewContext.delete(entity)
        
        saveData()
    }
    
    private func saveData() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
                print("Core Data: Saved")
                fetchData()
            } catch let error {
                print("Core Data: Error. \(error)")
            }
        }
    }
}
