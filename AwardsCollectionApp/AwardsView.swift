//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

/*
struct AwardsView: View {
    let awards = Award.getAwards() //коллекция наград
    var activeAwards: [Award] { //делаем еще один массив, который фильтрует толькоесли награда заслуженная
        awards.filter { $0.awarded } //проверяем каждый элемент на true
    }
    var body: some View {
        NavigationView {
            VStack {
                CustomGridView(items: activeAwards, columns: 2) { award in
                    VStack {
                        award.awardView //отображаем саму награду
                        Text(award.title) //отображаем название награды
                    }
                    
                }
            }
            .navigationBarTitle("Your awards: \(activeAwards.count)")
        }
    }
}
*/

//с помощью Lazy
struct AwardsView: View {
    let awards = Award.getAwards()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) { //инициализируем элементы, которые только на экране
                    ForEach(activeAwards, id: \.title) { award in
                        VStack {
                            award.awardView
                            Text(award.title)
                        }
                    }
                }
            }
            .navigationBarTitle("Your awards: \(activeAwards.count)")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
