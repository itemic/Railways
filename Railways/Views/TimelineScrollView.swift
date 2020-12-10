//
//  TimelineScrollView.swift
//  Railways
//
//  Created by Terran Kroft on 11/14/20.
//

import SwiftUI

struct TimelineScrollView: View {
    @Binding var selection: String
    let times: [String]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(times, id: \.self) {time in
                    ScrollButtonView(time: time, selected: time == selection)
                    .onTapGesture {
                        perform: do {
                            selection = time
                        }
                    }
                }
            }.padding()
            
        }.background(EffectsView(material: NSVisualEffectView.Material.sidebar, blendingMode: NSVisualEffectView.BlendingMode.behindWindow))
  
    }
}


struct ScrollButtonView: View {
    let time: String
    let selected: Bool
    var body: some View {
        VStack {
            Text(time).font(.title).foregroundColor(.black)
            Text("Nth to Taipei").font(.caption)
        }.frame(width: 100, height: 60)
        .background(EffectsView(material: NSVisualEffectView.Material.fullScreenUI, blendingMode: NSVisualEffectView.BlendingMode.withinWindow))
        .background(selected ? Color.orange : Color.clear)
        .cornerRadius(10)

    }
}


struct TimelineScrollView_Previews: PreviewProvider {
    @State static var selector = "12:05"
    static let dummyTimes = ["12:03", "12:05", "12:08", "1:32",
                      "2:49", "3:39", "3:44", "4:42", "5:12",
                      "6:12", "7:30"]
    static var previews: some View {
        TimelineScrollView(selection: $selector, times: dummyTimes)
    }
}
