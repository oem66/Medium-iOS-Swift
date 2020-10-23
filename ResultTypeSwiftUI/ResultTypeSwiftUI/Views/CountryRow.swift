//
//  CountryRow.swift
//  ResultTypeSwiftUI
//
//  Created by Omer Rahmanovic on 10/18/20.
//

import SwiftUI

struct CountryRow: View {
    
    var country: Country
    
    var body: some View {
        NavigationLink(destination: CountryDetailsView(country: country)) {
            
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country: Country.init())
    }
}
