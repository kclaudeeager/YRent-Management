//
//  BuildingsList.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct BuildingsList: View {
    let buildings: [Building]
    let onBuildingSelected: (Building) -> Void
    let selectedBuilding: Building?
    
    var body: some View {
        let emptyBuilding = Building(id: "0", name: "All", address: "")
        
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                BuildingCard(building: emptyBuilding, isSelected: emptyBuilding == (selectedBuilding ?? emptyBuilding)) {
                    onBuildingSelected(emptyBuilding)
                }
                ForEach(buildings) { building in
                    BuildingCard(building: building, isSelected: building == (selectedBuilding ?? emptyBuilding)) {
                        onBuildingSelected(building)
                    }
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.loginBackground1, Color.loginBackground2]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
        }
    }
}
struct BuildingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsList(
            buildings: [
                Building(id: "1", name: "Building 1", address: "Address 1"),
                Building(id: "2", name: "Building 2", address: "Address 2"),
                Building(id: "3", name: "Building 3", address: "Address 3")
            ],
            onBuildingSelected: { _ in },
            selectedBuilding: nil
        )
    }
}

