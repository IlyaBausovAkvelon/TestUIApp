//
//  ListRow.swift
//  TestUIApp
//
//  Created by Admin on 8/19/20.
//  Copyright © 2020 ilya.bausov. All rights reserved.
//

import SwiftUI

/// View for representing ListRow with vegetable info.
struct ListRowView: View {

    /// Vegetable for the row.
    var vegetable: Vegetable

    /// View.
    var body: some View {
        HStack {
            CircleImage(imageName: vegetable.imageName, width: 55, height: 55)
            VStack(alignment: .leading) {
                Text(vegetable.name).font(.title)
                Text(vegetable.description).font(.caption)
            }
            Spacer()
        }.padding().frame(height: 60)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(vegetable: vegetablesStore.vegetables[0])
    }
}
