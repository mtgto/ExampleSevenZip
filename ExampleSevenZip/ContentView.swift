//
//  ContentView.swift
//  ExampleSevenZip
//
//  Created by mtgto on 2023/08/22.
//

import SwiftUI
import SevenZip

struct ContentView: View {
    @State var entries: [Entry] = []

    var body: some View {
        VStack {
            ForEach(entries, id: \.path) { entry in
                Text(entry.path)
            }
            Button("Scan") {
                if let url = Bundle.main.url(forResource: "sample", withExtension: "7z") {
                    do {
                        let archive = try Archive(fileURL: url)
                        self.entries = archive.entries
                    } catch {
                        print("Error occurred while decrypting: \(error)")
                    }
                } else {
                    print("The archive is not found")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
