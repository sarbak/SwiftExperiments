//
//  DetailedView.swift
//  Manager
//
//  Created by Emre Sarbak on 12/24/20.
//

// Developing DetailedViews constantly.

import SwiftUI

struct DetailedView: View {
    let book: Book
    
    var body: some View {
        // QUESTION: Unclear why we aren't just having the struct create an image itself - can't we write a method for this?

        VStack {
            Book.Image(title: book.title)
            Spacer()
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(book: Book())
    }
}
