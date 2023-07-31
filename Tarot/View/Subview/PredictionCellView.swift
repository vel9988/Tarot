//
//  PredictionCellView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 26.07.2023.
//

import SwiftUI

struct PredictionCellView: View {
    
    var predictionDetail: Prediction
        
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            HStack {
                VStack(alignment: .leading) {
                    Text(predictionDetail.name)
                        .font(.headline)
                        .font(.system(size: 25))
                        .lineLimit(2)
                    Text(predictionDetail.dateCreation)
                        .font(.subheadline)
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Image("imageCell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 100)
            }            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.brown)
        .cornerRadius(16)
    }
}

struct PredictionCellView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionCellView(predictionDetail: Prediction())
    }
}
