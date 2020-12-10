//
//  RoutesViewModel.swift
//  Bus Buddy
//
//  Created by Terran Kroft on 7/12/20.
//  Copyright © 2020 itemic. All rights reserved.
//

import Foundation
import Combine

final class RoutesViewModel: ObservableObject {
    @Published var routes: [Route] = []
    @Published var stopOfRoutes: [StopOfRoute] = []
    
    func getStopForStations(route: String) -> [StopOfRoute] {
        return []
    }
    
    init(client: NetworkManager) {
        RoutesService.getRoutes(client: client) {[weak self] routes in
            DispatchQueue.main.async {
                self?.routes = routes
//                self?.routes = self?.routes as! [Route]
//                print(self!.routes)
            }
        }
        
        RoutesService.getAllStops(client: client) {[weak self] stops in
            DispatchQueue.main.async {
                self?.stopOfRoutes = stops
//                self?.routes = self?.routes as! [Route]
//                print(self!.stopOfRoutes)
            }
        }
    }
}
