
//
//  NoItemView.swift
//  TodoList
//
//  Created by Rizal Fahrudin on 18/01/24.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate = false
    
    var body: some View {
        VStack {
            Text("There no items!")
                .font(.largeTitle.weight(.semibold))
            
            Text("you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                .font(.body)
                .padding(.bottom, 20)
            
            NavigationLink {
                AddView()
            } label: {
                Text("Add something 🥳")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(animate ? .accent : .secondaryAccent)
                    .clipShape(.rect(cornerRadius: 12))
            }
            .frame(maxWidth: 400)
            .padding(.horizontal, animate ? 30 : 50)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)
            .shadow(
                color: animate ? .accent.opacity(0.7) : .secondaryAccent.opacity(0.7),
                radius: animate ? 30 :  /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                x: 0,
                y: animate ? 50: 30)
            
            
        }
        .multilineTextAlignment(.center)
        .padding()
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut.delay(2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemView()
}
