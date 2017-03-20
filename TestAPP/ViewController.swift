//
//  ViewController.swift
//  TestApp


import UIKit

let cellInset: CGFloat = 10.0
let songCellIdentifier = "SongCell"

class ViewController: UIViewController {
    var songsDataSource: SongsDataSource!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsDataSource = SongsDataSource(updateChangedUI: { [unowned self] (insertedItems, deletedItems, editedItems) in
            self.collectionView.insertItems(at: insertedItems as [IndexPath])
            self.collectionView.deleteItems(at: deletedItems as [IndexPath])
            self.collectionView.reloadItems(at: editedItems as [IndexPath])
        })
        loadSongs()
    }
    
    func loadSongs() {
        StandartNetworkClient.loadSongs { [unowned self] (songs, error) in
            if let songs = songs {
                self.songsDataSource.updateSongs(songs)
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func configureUI() {
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songsDataSource.songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let song = songsDataSource.songs[(indexPath as NSIndexPath).row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: songCellIdentifier, for: indexPath) as! SongCollectionViewCell
        cell.nameLabel.text = song.name
        cell.authorLabel.text = song.author
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (self.view.frame.width - cellInset)/2
        return CGSize(width: cellSize, height: cellSize)
    }
    
}

