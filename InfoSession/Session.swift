//
//  Session.swift
//  InfoSession
//
//  Created by Seun Makinde on 2015-12-09.
//  Copyright © 2015 Seun Makinde. All rights reserved.
//

import UIKit


class Session{
    
    //MARK:Properties
    
    let companyName: String!
    let date:String!
    let startTime: String!
    let endTime: String!
    let location: String!
    let website: String!
    let audience: String!
    let programs: String!
    
    //MARK: Initialization
    
    init?(info:[String: String])
    {
        self.companyName = info["companyName"];
        self.date = info["date"];
        self.startTime = info["startTime"];
        self.endTime = info["endTime"];
        self.location = info["location"];
        self.website = info["website"];
        self.audience = info["audience"];
        self.programs = info["programs"];
        
        if self.companyName.isEmpty || self.date.isEmpty{
            return nil;
        }
    }
}
