//
//  ModeSelectionView.swift
//  Railways
//
//  Created by Terran Kroft on 11/14/20.
//

import SwiftUI

struct ModeSelectionView: View {
    @Binding var selection: String
    let modes = ["HSR", "TRA", "Bus", "KMRT", "LRT"]
    let columns = [
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60))
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(modes, id: \.self) {mode in
                ModeClass(mode: mode, selected: mode == selection)
                    .onTapGesture {perform: do {
                        selection = mode
                    }
                    }
            }
        }
    }
}

struct ModeSelectionView_Previews: PreviewProvider {
    @State static var selection = "Bus"
    static var previews: some View {
        ModeSelectionView(selection: $selection)
    }
}

struct ModeClass: View {
    let mode: String
    let selected: Bool
    
    var highlightColor: Color {
        switch(mode) {
        case "TRA":
            return .blue
        case "HSR":
            return .orange
        case "Bus":
            return .green
        default:
            return .black
        }
    }
    
    var icon: String {
        switch(mode) {
        case "TRA":
            return "tram.tunnel.fill"
        case "HSR":
            return "tram.fill"
        case "Bus":
            return "bus.doubledecker.fill"
        default:
            return "bolt.horizontal.fill"
        }
    }
    
    var body: some View {
        
        if (selected) {
            HStack {
                VStack(alignment: .leading){
                    Image(systemName: icon).font(.system(size: 18))
                    Spacer()
                    Text(mode).font(.headline)
                }.foregroundColor(selected ? .white : highlightColor)
                Spacer()
            }
            .padding(8)
            .background(highlightColor)
            
            .cornerRadius(8)
        } else {
            HStack {
                VStack(alignment: .leading){
                    Image(systemName: icon).font(.system(size: 18)).foregroundColor(highlightColor)
                    Spacer()
                    Text(mode).font(.headline)
                }
                Spacer()
            }
            .padding(8)
            .background(EffectsView(material: NSVisualEffectView.Material.selection, blendingMode: NSVisualEffectView.BlendingMode.behindWindow))
            
            .cornerRadius(8)
        }

        
    }
}
