//
//  PredictionCell.swift
//  Tarot
//
//  Created by Dmitryi Velko on 18.07.2023.
//

import SwiftUI

struct PredictionCell: View {
    
    @State var shortDescriptionText: String
    @State var descriptionDate: String
    
    var body: some View {
        HStack {
            VStack {
                Text(shortDescriptionText)
                    .font(Font.title2.bold())
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(descriptionDate)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()

        }
        .padding()
    }
}

struct PredictionCell_Previews: PreviewProvider {
    static var previews: some View {
        PredictionCell(shortDescriptionText: "Description test", descriptionDate: "Date test")
            .previewLayout(.fixed(width: .infinity, height: 70))
        
    }
}
