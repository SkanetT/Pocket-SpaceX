//
//  CalendarManager.swift
//  Pocket SpaceX
//
//  Created by Антон on 20.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import EventKit
import EventKitUI

class CalendarManager {
    
    let eventStore = EKEventStore()
    
    static func makeEvent() -> EKEvent? {
        
        var result: EKEvent? = nil
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            
            
            if (granted) && (error == nil) {
                print("granted \(granted)")
                print("error \(String(describing: error))")
                
                let event = EKEvent(eventStore: eventStore)
                
                event.title = "Test Title4444"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "This is a note"
                result = event
                
//                event.calendar = eventStore.defaultCalendarForNewEvents
//                do {
//                    try eventStore.save(event, span: .thisEvent)
//                } catch let error as NSError {
//                    print("failed to save event with error : \(error)")
//                }
//                print("Saved Event")
            }
            else{
                
                print("failed to save event with error : \(String(describing: error)) or access not granted")
            }
        }
        
        return result
    }
    
    
    
}
