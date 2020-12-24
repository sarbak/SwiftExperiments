//
//  BookView.swift
//  Manager
//
//  Created by Emre Sarbak on 12/24/20.
//

// QUESTIONS: Extensions, initializers, question marks, guards, type nesting?

import SwiftUI

extension Book{
    struct Image: View {
        let title: String
        
        var body: some View {
            
            let symbol = SwiftUI.Image(title: title)
            
                ?? .init(systemName: "book")
            
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .font(Font.title.weight(.light))
                .foregroundColor(.gray)
        }
    }
}

struct BookRow: View{
    
    var thisbook: Book
    
    init(book: Book = Book()){
        thisbook = book
    }
    
    var body: some View {
        NavigationLink(
            destination: DetailedView(book: thisbook)
        ){
            HStack(alignment: .center) {
                Book.Image(title: thisbook.title)
                VStack(alignment: .leading){
                    Text(thisbook.title)
                        .font(.title2)
                        .frame(alignment: .leading)
                    Text(thisbook.author)
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundColor(.gray)
                    
                }
            }
        }
    }
}
    
    // Preview structure usual: Create a model -> preview ->
    struct Book_Previews: PreviewProvider {
        static var previews: some View {
            VStack(alignment: .leading){
                BookRow()
                BookRow(book: Book(title: "Huzur", author: "Ahmet Hamdi Tanpinar"))
                Book.Image(title: Book().title)
                Book.Image(title: "")
                
            }
            
            
        }
    }
    

    
    extension Image{
        

        
        init?(title: String){

            guard let character = title.first else{
                return nil
            }
            
            let symbolName = "\(character.lowercased()).square"
            
            self.init(systemName: symbolName)
        }
    }
