//
//  ContentView.swift
//  CovidStatus
//
//  Created by baris on 6.05.2020.
//  Copyright © 2020 baris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RecentView()
                .tabItem{
                    Tab(imageName: "chart.bar", text: "Recent")
            }
            .tag(0)
            
            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem{
                    Tab(imageName: "map", text: "Map")
            }
            .tag(1)
        }
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
