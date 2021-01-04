//
//  VehicleTypeRow.swift
//  ListNetworkingApp
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import Foundation
import SwiftUI

struct VehicleTypeRow: View {
    
    var model: VehicleTypes.VType? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(model?.type ?? "N/A")
                .font(.title)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
            Text(model?.type_hint ?? "N/A")
                .font(.body)
                .multilineTextAlignment(.leading)
        }
    }
}

struct VehicleTypeRow_Preview: PreviewProvider {
    static var previews: some View {
        VehicleTypeRow()
    }
}
