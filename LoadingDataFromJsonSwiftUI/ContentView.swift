//
//  ContentView.swift
//  LoadingDataFromJsonSwiftUI
//
//  Created by Neto Lobo on 03/12/23.
//

import SwiftUI


struct ContentView: View {
    @State private var people = [Person]()
    
    var body: some View {
        VStack {
            List(people) { person in
                HStack(spacing: 20) {
                    Text(person.first)
                    
                    Spacer()
                    
                    Text(person.last)
                }
            }
        }
        .onAppear {
            people = decode("people.json")
        }
    }
    
    func decode(_ file: String) -> [Person] {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            print("Faliled to locate \(file) in bundle")
            fatalError("Faliled to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load file from \(file) from bundle")
            fatalError("Failed to load file from \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedFile = try? decoder.decode([Person].self, from: data) else {
            print("Failed to decode \(file) from bundle")
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loadedFile
    }
}


#Preview {
    ContentView()
}
