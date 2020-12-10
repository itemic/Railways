//
//  ContentView.swift
//  Railways
//
//  Created by Terran Kroft on 9/4/20.
//

import SwiftUI
import AppKit

struct ContentView: View {
    
    @Binding var selected: String?
    @State var modeSelector: TransportMode = .BUS
    @ObservedObject var viewModel = RoutesViewModel(client: .init())

    var stations = ["Nangang", "Taipei", "Banqiao", "Taoyuan", "Hsinchu", "Miaoli", "Taichung", "Changhua", "Yunlin",
        "Chiayi", "Tainan", "Zuoying"]
    
    @State var testTextField: String
    @State var isEditing = false
    

    var body: some View {
        NavigationView {
            
            List(selection: $selected) {
                Text("Mode".uppercased()).font(.headline)
                ModeSelectionView(selection: $modeSelector)
                

                Divider()

                
                Group {
                    
                    switch modeSelector {
                    case .HSR:
                        Text("Stations".uppercased()).font(.headline)
                                                    ForEach(stations, id: \.self) { station in
                                                    Text(station)
                                                }
                    case .BUS:
                        Text("Routes".uppercased()).font(.headline)
                        TextField("Filter...", text: $testTextField) {isEditing in self.isEditing = isEditing}.textFieldStyle(RoundedBorderTextFieldStyle())

                        ForEach(self.viewModel.routes) {route in
                            RouteRowView(route: route)
                        }
                    default:
                        EmptyView()

                    }
                    
                    

                }
                
                
                
               
            }.listStyle(SidebarListStyle())
            
            MainView(selected: $selected, mode: $modeSelector, vm: viewModel)
        }
    }
}


struct RouteRowView: View {
    var route: Route
    
    var body: some View {
//        Text(route.routeName.en!)
//            .foregroundColor(colorFromName())
//        Label(route.routeName.en!, systemImage: symbolFromName()).label
        Label {
            Text(route.routeName.en!)
        } icon: {
            Image(systemName: symbolFromName())
                .foregroundColor(colorFromName())
                
                
        }.accentColor(colorFromName())
    }
    
    func colorFromName() -> Color {
        if route.routeName.zhTw!.starts(with: "紅") {return .red}
        if route.routeName.zhTw!.starts(with: "綠") {return .green}
        if route.routeName.zhTw!.starts(with: "藍") {return .blue}
        if route.routeName.zhTw!.starts(with: "黃") {return .yellow}
        if route.routeName.zhTw!.starts(with: "棕") {return Color(.brown)}
        if route.routeName.zhTw!.starts(with: "橘") {return .orange}
        return .purple
    }
    
    func symbolFromName() -> String {
        if route.routeName.zhTw!.starts(with: "紅") {return "r.square"}
        if route.routeName.zhTw!.starts(with: "綠") {return "g.square"}
        if route.routeName.zhTw!.starts(with: "藍") {return "b.square"}
        if route.routeName.zhTw!.starts(with: "黃") {return "y.square"}
        if route.routeName.zhTw!.starts(with: "棕") {return "b.square"}
        if route.routeName.zhTw!.starts(with: "橘") {return "o.square"}
        return "square.fill"
    }
}


struct ContentView_Previews: PreviewProvider {
    @State static var selected: String? = "Nangang"
    
    @State static var testFilter: String = "X"
    
    static var previews: some View {
        ContentView(selected: $selected, testTextField: "X")
    }
}

func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

// blur effect FROM https://github.com/jordansinger/rdio-macos-swiftui-sample
struct EffectsView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}
