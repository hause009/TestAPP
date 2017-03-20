//
//  DataBaseHelper.swift
//  TestApp


import UIKit

class SongsDataSource {
    var songs: [Song] = []
    var updateChangedUI: ((_ insertedItems: [IndexPath], _ deletedItems: [IndexPath], _ editedItems: [IndexPath]) -> ())?
    
    init(updateChangedUI: @escaping (_ insertedItems: [IndexPath], _ deletedItems: [IndexPath], _ editedItems: [IndexPath]) -> ()) {
        self.updateChangedUI = updateChangedUI
        let songs = [Song()] //songs from base and mark all added or edite
        updateSongs(songs )
    }
    
    func updateSongs(_ songs: [Song]){
        prepareForSongsUpdate()
        
        let insertedItems = [IndexPath()]
        let editedItems = [IndexPath()]
        let deletedItems = [IndexPath()]
        
        if let updateChangedUI = updateChangedUI {
            updateChangedUI(insertedItems, deletedItems, editedItems)
        }
        
        cleanDataBase()
        completeSongsUpdate()
    }
    
    func prepareForSongsUpdate(){
        for song in songs {
            song.status = SongStatus.deleted
        }
    }
    
    func completeSongsUpdate(){
        for song in songs {
            song.status = SongStatus.notChanged
        }
    }
    
    // MARK:
    
    func cleanDataBase() {
        // delete song from base and fetch new array
    }
    
}
