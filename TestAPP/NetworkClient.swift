//
//  APIClient.swift
//  TestApp
//
//  Created by Anna Goman on 29.09.16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
//import Alamofire

let StandartNetworkClient = NetworkClient()

let kBaseURL = "http://tomcat.kilograpp.com/songs/api/"
let kSongURLKey = "songs"

class NetworkClient {
    
    func loadSongs(_ completionHandler: (_ songs: [Song]?, _ error: NSError?) -> ()) {
        ////////////////////////////
        
    }
    
}
