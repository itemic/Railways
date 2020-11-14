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
    @State var modeSelector: String = "HSR"


    var stations = ["Nangang", "Taipei", "Banqiao", "Taoyuan", "Hsinchu", "Miaoli", "Taichung", "Changhua", "Yunlin",
        "Chiayi", "Tainan", "Zuoying"]
    

    
    

    var body: some View {
        NavigationView {
            
            List(selection: $selected) {
                Text("Mode".uppercased()).font(.headline)
                ModeSelectionView(selection: $modeSelector)
                

                Divider()
                Text("Stations".uppercased()).font(.headline)
                    ForEach(stations, id: \.self) { station in
                    Text(station)
                        
                }
               
            }.listStyle(SidebarListStyle())
            
            MainView(selected: $selected)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    @State static var selected: String? = "Nangang"
    

    
    static var previews: some View {
        ContentView(selected: $selected)
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
