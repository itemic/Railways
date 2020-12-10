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
    
    init(client: NetworkManager) {
        RoutesService.getRoutes(client: client) {[weak self] routes in
            DispatchQueue.main.async {
                self?.routes = routes
//                self?.routes = self?.routes as! [Route]
                print(self!.routes)
            }
        }
    }
}
