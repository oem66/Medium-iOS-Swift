//
//  ContentView.swift
//  DemoCombineSwiftUI
//
//  Created by Omer Rahmanovic on 6/9/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.time)
                .padding()
            List(viewModel.users) { user in
                if let name = user.name,
                   let email = user.email {
                    VStack {
                        HStack {
                            Text(name)
                                .bold()
                            Spacer()
                        }
                        
                        HStack {
                            Text(email)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
