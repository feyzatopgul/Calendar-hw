//
//  ViewController.swift
//  HelloCalendar
//
//  Created by fyz on 7/6/18.
//  Copyright © 2018 Feyza Topgul. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {
    
    @IBAction func addEventButton(_ sender: Any) {
        let eventStore: EKEventStore = EKEventStore ()
        eventStore.requestAccess(to: .event, completion: {(granted, error) in
            if (granted) && (error == nil){
                print("granted \(granted)")
                print("error \(String(describing: error))")
                let event: EKEvent = EKEvent(eventStore: eventStore)
                event.title = "Hello Event"
                event.startDate = Date ()
                event.endDate = Date ()
                event.notes = "This is a new event"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                }
                catch let error as NSError {
                    print("error \(error)")
                }
                print("Event saved")
            }
            else {
                print("error \(String(describing: error))")
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

