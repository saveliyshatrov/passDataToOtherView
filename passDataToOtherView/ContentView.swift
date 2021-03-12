//
//  ContentView.swift
//  passDataToOtherView
//
//  Created by Савелий Шатров on 12.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    var body: some View {
        NavigationView {
            VStack{
                TextField("Enter text", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .navigationBarTitleDisplayMode(.inline)
                    .frame(width: 300, height: 490, alignment: .topLeading)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("First view").font(.headline)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SecondView(text: self.text)) {
                                        Text("Done")
                    }.navigationTitle("Second view")
                }
            }
        }
    }
}

struct SecondView: View {
    var text: String = ""
    var body: some View {
        Text(self.text).toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Second view").font(.headline)
                }
            }
        }.frame(width: 300, height: 490, alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
