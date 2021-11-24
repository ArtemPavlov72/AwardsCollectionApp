//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.11.2021.
//
//работа с сеткой
import SwiftUI

// чтобы сделать свои ячейки, мы добавляем  Contant, который должен быть подписан под протокол View
struct CustomGridView<Content, T>: View where Content: View { //чтобы сделать универсальную сетку, чтобы она принимала любой тип данных (дженерик), мы определяем тип через Т
    let items: [T] //задаем тип даных Т
    let columns: Int // определяем количество столбцов
    let content: (CGFloat, T) -> Content //захватывает тип данных и возвращает View, и возвращаем размер ячейки CGFloat
    var rows: Int { //вычисляемое количество строк
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in // для работы с размерами ячеек
            let itemSize = geometry.size.width / CGFloat(columns) //определяем размер одной стороны. Берем ширину экрана и делим на количество колонок
            ScrollView {
                VStack { //делаем строки
                    ForEach(0...rows, id: \.self) { rowIndex in //равное количеству строк. id - определяем индификатор элемента коллекции
                        HStack { //делаем столбцы
                            ForEach(0..<columns) { columnIndex in //равное количеству столбцов
                                if let index = indexFor(row: rowIndex, column: columnIndex) { //если мы сможем извлечь опциональное значение из метода, то тогда мы отобразим в виде текста
                                    content(itemSize, items[index]) //отображаем контент
                                } else {
                                    Spacer() //чтобы сдвинуть единицу влево
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //метод, который занимается расчетом индекса и возвращает элементы массива
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil //возвращаем либо индекс, либо нил, если количество индексов меньше
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
   
        CustomGridView(
            items: [11, 3, 7, 17, 5, 2, 1], columns: 3) { itemSize, item in
            Text("\(item)")
                    .frame(width: itemSize, height: itemSize)
        }
    }
}
