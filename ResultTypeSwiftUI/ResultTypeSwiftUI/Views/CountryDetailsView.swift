//
//  CountryDetailsView.swift
//  ResultTypeSwiftUI
//
//  Created by Omer Rahmanovic on 10/18/20.
//

import SwiftUI

struct CountryDetailsView: View {
    
    var country: Country
    
    var body: some View {
        Text("")
            .padding()
//        VStack(spacing: 10) {
//            Text(country.name)
//                .padding()
//            Text(country.alpha3Code)
//                .padding()
//            Text(country.capital)
//                .padding()
//            Text(country.population)
//                .padding()
//        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: Country())
    }
}
