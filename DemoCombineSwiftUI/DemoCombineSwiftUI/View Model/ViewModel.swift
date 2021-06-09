//
//  ViewModel.swift
//  DemoCombineSwiftUI
//
//  Created by Omer Rahmanovic on 6/9/21.
//

import SwiftUI
import Combine

final class ViewModel: ObservableObject {
    @Published var time = ""
    @Published var users = [User]()
    //    private var anyCancellable: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.timeStyle = .medium
        return df
    }()
    
    init() {
        setupPublishers()
    }
    
    private func setupPublishers() {
        setupTimerPublisher()
        setupDataTaskPublisher()
    }
    
    private func setupDataTaskPublisher() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Data downloaded successfully!")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] users in
                guard let self = self else { return }
                self.users = users
            }
            .store(in: &cancellables)
        
    }
    
    private func setupTimerPublisher() {
        //        anyCancellable = Timer.publish(every: 1, on: .main, in: .default)
        //            .autoconnect()
        //            .receive(on: RunLoop.main)
        //            .sink { value in
        //                self.time = self.formatter.string(from: value)
        //            }
        
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .receive(on: RunLoop.main)
            .sink { value in
                self.time = self.formatter.string(from: value)
            }
            .store(in: &cancellables)
    }
}
