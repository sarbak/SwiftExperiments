//
//  ContentView.swift
//  Shared
//
//  Created by Emre Sarbak on 12/20/20.
//

import SwiftUI
//import Combine

// MAIN VIEW

struct ContentView: View {
    
    @State private var dataSource: [Message] = [
        Message(content: "Hi, I really love your templates and I would like to buy the chat template", isCurrentUser: true),
        Message(content: "Thanks, nice to hear that, can I have your email please?")]
   
    @State var typingMessage: String = ""
    
    var body: some View {
        NavigationView{
            
            VStack{
                //Text("Hello, World!")
                //ScrollView (/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: true)
                //{
                    List {
                        ForEach(dataSource, id: \.self) { msg in
                            MessageView(message: msg)
                            //print(msg)
                        }
                    }
                    
                //}
                
                HStack{
                    TextField("Message...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30)).padding()
                    Button(action: {sendMessage(isCurrentUser: true)}) {
                        Text("Send")
                    }.frame(minHeight: CGFloat(30)).padding()
                }
            }
            .navigationBarTitle("Parrot", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button("Restart") {
                        dataSource = []
                    }
            )
        }
    }
    
    
    func sendMessage(isCurrentUser: Bool = false) {
        dataSource.append(Message(content: typingMessage, isCurrentUser: isCurrentUser))
        generateResponse(message: typingMessage)
        typingMessage = ""
        
    }
    
    func generateResponse(message: String){
        var response: String
        response = message.uppercased()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            dataSource.append(Message(content: response, isCurrentUser: false))
        }
        
    }
    
}

// PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        MessageView(message: Message(content: "I am your friend"))
    }
}

// VIEWS

struct MessageView: View {
    var message: Message
    var body: some View {
        Text(message.content)
            .padding(10)
            .foregroundColor(message.isCurrentUser ? Color.white : Color.black)
            .background(message.isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

// MODELS

struct Message: Hashable{
    var id = UUID()
    var content: String
    var isCurrentUser: Bool = false
    
    mutating func upper(){
        content = content.uppercased()
    }
    
}
