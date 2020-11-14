//
//  RailwaysApp.swift
//  Railways
//
//  Created by Terran Kroft on 9/4/20.
//

import SwiftUI

@main
struct RailwaysApp: App {
    @State var selected: String? = "Nangang"
    
    @State var sel2: String? = "12:03"

    var dummyTimes = ["12:03", "12:05", "12:08", "1:32",
                      "2:49", "3:39", "3:44", "4:42", "5:12",
                      "6:12", "7:30"]
    var stations = ["Nangang", "Taipei", "Banqiao", "Taoyuan", "Hsinchu", "Miaoli", "Taichung", "Changhua", "Yunlin",
        "Chiayi", "Tainan", "Zuoying"]
    
    var body: some Scene {
        WindowGroup {
            ContentView(selected: $selected, sel2: $sel2)
        }
    }
}
