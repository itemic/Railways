//
//  RoutesService.swift
//  Bus Buddy
//
//  Created by Terran Kroft on 7/12/20.
//  Copyright © 2020 itemic. All rights reserved.
//

import Foundation

public struct RoutesService {

    static func getRoutes(client: NetworkManager, completion: (([Route]) -> Void)? = nil) {
        runRoutesRequest(client.authenticateRequest(url: "https://ptx.transportdata.tw/MOTC/v3/Bus/Route/City/Tainan?$format=JSON"), on: client, completion: completion)
    }
    
    static func runRoutesRequest(_ request: URLRequest, on client: NetworkManager, completion: (([Route]) -> Void)? = nil) {
        client.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                print("Initial success")

                let decoder = JSONDecoder()
                do {
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    print(welcome.routes)
                    completion?(welcome.routes)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
