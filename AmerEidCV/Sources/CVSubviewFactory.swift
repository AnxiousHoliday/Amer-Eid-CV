//
//  CVSubviewFactory.swift
//  AmerEidCV
//
//  Created by Amer on 3/18/22.
//

import Foundation

class CVSubviewFactory {
    static func getView(model: Any) -> CVSubview? {
        switch model {
        case let personaDataModel as PersonalDataModel:
            return PersonalDataView(model: personaDataModel)
        case let headerModel as HeaderModel:
            return HeaderView(model: headerModel)
        case let detailsModel as DetailsModel:
            return DetailsView(model: detailsModel)
        case let bulletPointModel as BulletPointModel:
            return BulletPointView(model: bulletPointModel)
        case let summaryModel as SummaryModel:
            return SummaryView(model: summaryModel)
        case let bulletPointLabelsModel as BulletPointLabelsModel:
            return BulletPointLabelsView(model: bulletPointLabelsModel)
        default:
            return nil
        }
    }
}

