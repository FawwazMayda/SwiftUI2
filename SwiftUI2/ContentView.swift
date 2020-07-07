//
//  ContentView.swift
//  SwiftUI2
//
//  Created by Muhammad Fawwaz Mayda on 07/07/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isFilled = true
    @State var counted = 1
    @State var borderWidth = 10.0
    @State var isPresented = false
    var body: some View {
        VStack {
            Button(action: {
                self.isFilled.toggle()
            }) {
                Text("Pressed: \(counted) times")
                    .foregroundColor(self.isFilled ? Color.yellow : Color.gray)
                    .padding(.all)
                    .font(.title)
            }.background(self.isFilled ? Color.gray: Color.yellow).cornerRadius(20.0)
                .shadow(radius: 20.0)
            
            
            Divider()
            Divider()
            Divider()
            
            Rectangle()
                .fill(self.isFilled ? Color.blue : Color.black)
                .border(self.isFilled ? Color.black : Color.blue,width: CGFloat(borderWidth))
                .cornerRadius(8.0)
                .frame(width: 150.0, height: 150.0)
                .rotationEffect(Angle(degrees: 10.0 * Double(counted)))
            .shadow(radius: 50)
                .onTapGesture {
                    self.counted+=1
            }
            .onLongPressGesture {
                self.isPresented.toggle()
            }
            .actionSheet(isPresented: $isPresented) {
                ActionSheet(title: Text("Action Sheet"),message: Text("This is action Sheet"),buttons: [.default(Text("Border width: 5"),action: {self.borderWidth = 5.0}),.default(Text("Border Width: 10"), action: {self.borderWidth=10.0}),
                                                                                                        .destructive(Text("Reset to Zero"), action: {self.counted = 0}),
                                                                
                                                                                                        
                                                                                                        .cancel()])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}
