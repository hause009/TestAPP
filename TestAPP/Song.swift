
import Foundation
import CoreData

enum SongStatus {
    case notChanged
    case added
    case changed
    case deleted
}

@objc(Song)
class Song: NSManagedObject {
    var status = SongStatus.notChanged
    
    
    //update woth dictionary instead init
    func update(_ jsonDictionary: [String: AnyObject]){
        id = jsonDictionary["id"] as? NSNumber
        name = jsonDictionary["name"] as? String
        author = jsonDictionary["author"] as? String
        let newVersion = jsonDictionary["version"] as? NSNumber
        if let version = version, let newVersion = newVersion {
            if newVersion == version {
                status = .notChanged
            } else {
                status = .changed
            }
        } else {
            status = .added
        }
    }
    
}
