/*
 *  Lab 2
 *  Group 9
 *  Noa Tomas Mandorf
 *  Tyler Hager
 *  October 12, 2025
 */

import SwiftUI

let flowers = Bundle.main.decode([Flower].self, from: "flowers.json")

struct ContentView: View {
    var image: String?
    var body: some View {
        ScrollView {
            VStack {
                Text("Match the flowers")
                    .font(.largeTitle)
                    .bold()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(flowers.shuffled()) { flower in
                            TileView(file: flower.file).aspectRatio(1, contentMode: .fit)
                        }
                    }
                }
            }
            .padding()
        }
    }



struct TileView: View {
    @State var isFaceUp: Bool = false
    var file: String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 75, height: 75)
                .padding()
                .opacity(isFaceUp ? 0 : 1)
            Image(file)
                .resizable()
                .padding()
                .opacity(isFaceUp ? 1 : 0)
        }
        .onTapGesture {
            withAnimation{
                isFaceUp.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
