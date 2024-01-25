//
//  CVPage1.swift
//  AmerEidCV
//
//  Created by Amer on 3/16/22.
//

import UIKit
import PinLayout

public class CVPage1: CVSuperPage {
    private let models: [Any] = [
        PersonalDataModel(
            name: "Amer Eid",
            phone: "+40739747600",
            location: "Bucharest, Romania",
            email: "amereid92@gmail.com",
            githubMarkupText: CVMarkupLabelModel(text: "[GitHub](https://github.com/amereid) ", font: UIFont.h1FontRegular),
            linkedInMarkupText: CVMarkupLabelModel(text: "[LinkedIn](https://www.linkedin.com/in/amer-eid92/) ", font: UIFont.h1FontRegular),
            flagImageName: FlagImageNames.romania
        ),
        
        SummaryModel(text:
                        "Senior Software Engineer at Google with over 8 years of experience creating and developing complex user focused software applications. Previously led a team of 5 to create the # 1 music streaming app in MENA with millions of users. Entrepreneurially trained with a passion for creating things that make people happy."
                    ),
        
        HeaderModel(title: "Experience"),
        
        DetailsModel(titleModel: CVMarkupLabelModel(text: "[Google](https://google.com/) ", font: UIFont.p1FontBold),
                     subtitle: "Senior Software Engineer (iOS)",
                     date: "March 2023 - Present",
                     location: "Bucharest, Romania"),
        BulletPointModel(text: "Core member of the [Fitbit](https://www.fitbit.com/global/us/home) engineering team"),
        BulletPointModel(text: "Fitbit is the leading provider of cutting-edge wearable fitness tech and was acquired by Google in 2021", style: .indented),
        BulletPointModel(text: "Worked as part of multiple teams such as the `Sleep`, `Mental Health`, and `Activity` teams", style: .indented),
        BulletPointModel(text: "Refactored the Fitbit homescreen which reduced hitch rates by 34% and render time by over 45%"),
        BulletPointModel(text: "Managed a team focused on integrating and implementing analytic events across the entire Fitbit iOS app"),
        BulletPointModel(text: "Achieved Google's code coverage requirement of over 90% for the `Sleep`, `Stress`, and `Activity` features"),
        BulletPointModel(text: "Was the go to person for the legacy Objective-C codebase and managed to reduce legacy CoreData related crashes by 32% and implemented a data layer API that was used by over 8 feature teams"),
        BulletPointModel(text: "Led the architecture design and development of the `Sleep`, `Stress`, and `Activity` features for Google's\n[new Fitbit redesign](https://blog.google/products/fitbit/fitbit-app-redesign/) "),
        
        DetailsModel(titleModel: CVMarkupLabelModel(text: "[Anghami](https://anghami.com/about) ", font: UIFont.p1FontBold),
                     subtitle: "Lead iOS Engineer",
                     date: "June 2017 - July 2022",
                     location: "Abu Dhabi, United Arab Emirates"),
        
        BulletPointModel(text: "Anghami is the leading music streaming platform within the MENA region, with over 21 million MAUs"),
        BulletPointModel(text: "Joined as an iOS Engineer and promoted to Lead iOS Engineer in April 2020", style: .indented),
        BulletPointModel(text: "Sole lead developer of the iOS platform which boasts a rating of 4.7 (900K ratings) on the App Store", style: .indented),
        BulletPointModel(text: "Managed a team of 5 people and led development on iOS, tvOS, watchOS, iPadOS, and Carplay - and on core features such as the custom Audio Engine, Music Player, Chat, In-App Purchases & Subscriptions, etc"),
        BulletPointModel(text: "Reduced app hang rate from 200ms/hour to 150ms/hour by optimizing DB read/writes using GCD"),
        BulletPointModel(text: "Reduced hitch rate from 15ms/sec to 7ms/sec by caching layout calculations using PinLayout (Frames)"),
        BulletPointModel(text: "Spearheaded the conversion of the Video Engine to support HLS video within a week to allow for streaming of the Game of Thrones season 8 premiere for the MENA region"),
        BulletPointModel(text: "Was part of the core team that led to Anghami's IPO - first ever MENA Tech IPO on NASDAQ"),
        
        DetailsModel(titleModel: CVMarkupLabelModel(text: "[Parkr](https://weareparkr.com) ", font: UIFont.p1FontBold),
                     subtitle: "Co-founder",
                     date: "June 2016 – June 2017",
                     location: "Beirut, Lebanon"),
        
        BulletPointModel(text: "Co-founded a parking startup for emerging markets and raised over 100,000 USD"),
        BulletPointModel(text: "Underwent acceleration, programs, and workshops in Beirut and San Francisco"),
        
        HeaderModel(title: "Education"),
        
        DetailsModel(titleModel: CVMarkupLabelModel(text: "American University Of Beirut", font: UIFont.p1FontBold),
                     subtitle: "Bachelor of Science, Computer Science",
                     date: "June 2016",
                     location: "Beirut, Lebanon"),
        
        HeaderModel(title: "Skills & Projects"),
        
        BulletPointModel(text: "Programming Languages:  Objective-C  Swift  Kotlin  C++  Python  Java  C PHP"),
        BulletPointModel(text: "Frameworks & Tools: UIKit  SwiftUI  CoreData  RxCocoa [RxSwift](https://github.com/ReactiveX/RxSwift)  [Realm](https://github.com/realm/realm-swift)  [IGListKit](https://github.com/Instagram/IGListKit)  [PinLayout](https://github.com/layoutBox/PinLayout)  [SnapKit](https://github.com/SnapKit/SnapKit)  [Fastlane](https://fastlane.tools) "),
        BulletPointModel(text: "Languages: English  Arabic  Spanish"),
        BulletPointModel(text: "Passion Projects: [Mimir](https://github.com/amereid/Mimir)  [Mimir Memory Logger](https://github.com/amereid/MimirMemoryLogger) "),
    ]
    
    override func getModels() -> [Any] {
        return models
    }
    
    override func commonInit() {
        super.commonInit()
        setupWaterMarkLabel()
    }
    
    private func setupWaterMarkLabel() {
        let model = CVMarkupLabelModel(text: "[Created using my own iOS App Project 💻](https://github.com/amereid/amereidcv) ", font: UIFont.p1FontRegular, textAlignment: .center)
        let waterMarkLabel = CVMarkupLabel(model: model)
        waterMarkLabel.label.pin.sizeToFit()
        waterMarkLabel.pin.wrapContent()
        addSubview(waterMarkLabel)
        waterMarkLabel.pin.bottom(15).hCenter()
    }
}
