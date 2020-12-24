//
//  ContentView.swift
//  Shared
//
//  Created by Emre Sarbak on 12/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .font(Font.title.weight(.light))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("Title")
                .font(.title2)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
