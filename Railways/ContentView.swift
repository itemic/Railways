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
    @Binding var sel2: String?
    @State var modeSelector: String = "HSR"
    var stations = ["Nangang", "Taipei", "Banqiao", "Taoyuan", "Hsinchu", "Miaoli", "Taichung", "Changhua", "Yunlin",
        "Chiayi", "Tainan", "Zuoying"]
    
    var dummyTimes = ["12:03", "12:05", "12:08", "1:32",
                      "2:49", "3:39", "3:44", "4:42", "5:12",
                      "6:12", "7:30"]
    
    

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
            
            VStack {
                
                
                
                
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 20) {
                        
                    
                        ScrollButtonView2(time: "12:01")
                            ForEach(dummyTimes, id: \.self) {time in
                                ScrollButtonView(time: time)
                                



                        }
                    }.padding()
                    
                }.background(EffectsView(material: NSVisualEffectView.Material.sidebar, blendingMode: NSVisualEffectView.BlendingMode.behindWindow))
          
                
                    
                    List(0..<20) { i in
                        RowView(stationName: "\(i)")
                        
                    }

                
                
            }.navigationTitle("Railways")
            .navigationSubtitle("\(selected ?? "Default")")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
                ToolbarItem(placement: .primaryAction) {
                    Button ("New") {}
                }
            }
        }
    }
}


struct ScrollButtonView2: View {
    let time: String
    var body: some View {
        VStack {
            Text(time).font(.title)
            Text("Scheduled").font(.caption)
        }.frame(width: 100, height: 60)
        .background(Color.orange)
        .cornerRadius(10)

    }
}

struct ScrollButtonView: View {
    let time: String
    var body: some View {
        VStack {
            Text(time).font(.title).foregroundColor(.black)
            Text("Scheduled").font(.caption)
        }.frame(width: 100, height: 60)
        .background(EffectsView(material: NSVisualEffectView.Material.selection, blendingMode: NSVisualEffectView.BlendingMode.withinWindow))
        .cornerRadius(10)

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


struct ContentView_Previews: PreviewProvider {
    @State static var selected: String? = "Nangang"
    @State static var sel2: String? = "12:03"

    
    static var previews: some View {
        ContentView(selected: $selected, sel2: $sel2)
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
