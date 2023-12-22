//
//  CustomListRowView.swift
//  Hike
//
//  Created by Владислав Дробитько on 12.11.2023.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: - Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            //Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(Color.primary)
                    .fontWeight(.semibold)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string:  rowLinkDestination!)!)
                    .foregroundStyle(Color.pink)
            } else {
                EmptyView()
            }
        } label: {
            //Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(Color.white)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Website",
                          rowIcon: "globe",
                          rowContent: nil,
                          rowTintColor: .indigo,
                          rowLinkLabel: "Credo Academy",
                          rowLinkDestination: "https://credo.academy")
    }
}
