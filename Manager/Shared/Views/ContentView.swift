//
//  ContentView.swift
//  Shared
//
//  Created by Emre Sarbak on 12/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // QUESTION: What other standard UI patterns are there in SwiftUI?
        NavigationView{
            List(0..<10) { item in
                BookRow(book: .init(title: "\(item)") )
            }
            .navigationBarTitle("My Library")
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}


