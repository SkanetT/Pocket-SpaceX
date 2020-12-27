//
//  SpaceXWidget.swift
//  SpaceXWidget
//
//  Created by Антон on 25.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import WidgetKit
import SwiftUI

struct LaunchEntry: TimelineEntry {
    
    public let date: Date
    public let name: String
    public var image: UIImage = UIImage(systemName: "nosign") ?? UIImage()
}

struct LaunchProvider: TimelineProvider {
    
    let net = SpaceXService()
    typealias Entry = LaunchEntry

    func placeholder(in context: Context) -> LaunchEntry {
        return LaunchEntry(date: Date(), name: "no name")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (LaunchEntry) -> Void) {
        let entry = LaunchEntry(date: Date(), name: "name 1")
        return completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<LaunchEntry>) -> Void) {
        var entries: [LaunchEntry] = []

        
        let currentDate = Date()

        net.fetchNextLaunch() { result in
            switch result {
            case .success(let data):
                let entry = LaunchEntry(date: currentDate, name: data.name)
                entries.append(entry)
                let timeline = Timeline(entries: entries, policy: .atEnd)
                return completion(timeline)
            case .failure:
                print("0")
            }
        }
        
    }
    
}


struct SpaceXWidgetEntryView : View {
    var entry: LaunchProvider.Entry
        
    var body: some View {
        VStack(alignment: .center) {
            Text("Next launch")
                .minimumScaleFactor(0.5)
                .font(.title2)
                .lineLimit(1)
            Text(entry.name)
            Image(uiImage: entry.image)
        }
        
    }
    
}

@main
struct SpaceXWidget: Widget {
    let kind: String = "SpaceXWidget"
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LaunchProvider()) { entry in
            SpaceXWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Pocket SpaceX Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct SpaceXWidget_Previews: PreviewProvider {
    static var previews: some View {
        SpaceXWidgetEntryView(entry: LaunchEntry(date: Date(), name: "test name"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
