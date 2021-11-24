//
//  Award.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.11.2021.
//

//Модель представления, описывает модель интерфейса
import SwiftUI

struct Award {
    let awardView: AnyView //для отображения каких-то view, добавляем соответствующий тип данных
    let title: String //название view
    let awarded: Bool
    
    static func getAwards() -> [Award] {
        [
            Award(
                awardView: AnyView(GradientRectangles().frame(width: 160, height: 160)),
                title: "Gradient Rectangles",
                awarded: true
            ),
            Award(
                awardView: AnyView(PathView().frame(width: 160, height: 160)),
                title: "Path View",
                awarded: true
            ),
            Award(
                awardView: AnyView(CurvesView().frame(width: 160, height: 160)),
                title: "Curves View",
                awarded: true
            ),
            Award(
                awardView: AnyView(HypocycloidView(width: 160, height: 160)),
                title: "Hypocycloid View",
                awarded: false
            ),
        ]
    }
}
