//
//  MainView.swift
//  Railways
//
//  Created by Terran Kroft on 11/14/20.
//

import SwiftUI

struct MainView: View {
    @Binding var selected: String?
    @Binding var mode: TransportMode
    @State var showPopover = false
    @State private var sortType = 0

    
    var body: some View {
        VStack {
        switch mode {
        case .BUS: BusView()
        case .HSR: RailView()
        default: EmptyView()
        }
        }
        .navigationTitle(mode.rawValue)
        .navigationSubtitle("\(selected ?? "Default")")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.left")
                })
            }
            
            ToolbarItem(placement: .primaryAction) {
                
                Picker(selection: $sortType, label: Text("Sort")) {
                        Image(systemName: "arrow.up.square.fill").tag(0)
                        Image(systemName: "arrow.down.square.fill").tag(1)
                        Image(systemName: "arrow.up.arrow.down.square.fill").tag(2)
                    }.pickerStyle(DefaultPickerStyle())
                
            }
            
            
            
        }
    }
}
struct BusView: View {
    var body: some View {
        Text("BUS!")
    }
}

struct RailView: View {
    @State var timeSelector: String = "12:03"
    var dummyTimes = ["12:03", "12:05", "12:08", "1:32",
                      "2:49", "3:39", "3:44", "4:42", "5:12",
                      "6:12", "7:30"]
    var body: some View {
        VStack {
            TimelineScrollView(selection: $timeSelector, times: dummyTimes)
            
            
      
            
                
                List(0..<20) { i in
                    RowView(stationName: "\(i)")
                    
                }
        }
    }
}

struct RowView: View {
    @State var stationName: String
    var body: some View {
        HStack(alignment: .top) {
            Text("Station \(stationName)").bold()
            Spacer()
            VStack(alignment: .trailing) {
                Text("12:30 pm")
                Text("in \(Int.random(in: 1...30)) min").foregroundColor(.secondary)
            }
        }.padding(.vertical, 8)
    }
}


struct MainView_Previews: PreviewProvider {
    @State static var selected: String? = "Nangang"
    @State static var mode: TransportMode = .HSR

    static var previews: some View {
        MainView(selected: $selected, mode: $mode)
    }
}
