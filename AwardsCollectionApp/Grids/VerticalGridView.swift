//
//  VerticalGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.11.2021.
//

import SwiftUI

struct VerticalGridView: View {
    let data = (1...100).map { "Item: \($0)" } //диапазон от 1 до 100, перебираем каждый элемент и помещаем в массив с типом string
    let columns = [
        GridItem(.fixed(70)), // фиксированная ширина 70
        GridItem(.flexible()), // второй столбец с подстраиваемой шириной
        GridItem(.flexible()) // третий столбец с подстраиваемой шириной
    ]
    var body: some View {
        ScrollView {
            //Lazy - "ленивые", инициализируют элементы из коллекции, которые отображаются на экране, чтобы не грузить лишнюю информацию
            LazyVGrid(columns: columns, spacing: 20) { //инициализируем количеством колонок, spacing - отступ между самими столбцами
                ForEach(data, id: \.self) { item in //передаем массив, определяем id. Нам возвращается в блоке замыкания конкретный элемент item
                    Text(item) //помещаем item в текст
                }
            }
        }
    }
}

struct VerticalGridView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGridView()
    }
}
