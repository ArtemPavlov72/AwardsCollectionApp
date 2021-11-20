//
//  HorizontalGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.11.2021.
//

//создаем строки
import SwiftUI

struct HorizontalGridView: View {
    let data = 1...10 //количество элементов
    let rows = [
        GridItem(.fixed(200)) //фиксированная ширина 200
    ]
    
    var body: some View {
        ScrollView(.horizontal) { //направение скроллинга горизонтальное
            LazyHGrid(rows: rows) {
                ForEach(data, id: \.self) { item in
                    Text("Image \(item)")
                }
            }
        }
    }
}

struct HorizontalGridView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalGridView()
    }
}
