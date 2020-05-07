//
//  MusicServices.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/30/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.

import Foundation


struct Song {
    var composers : Composers?
    var artist : Artist
    var id : String
    var genre : Genre?
    var title : String
    var album : Album?
    
    
    init(id : String ,  title : String , artist : Artist) {
        self.id = id
        self.title = title
        self.artist = artist
    }
    

}

struct Artist {
    //all variables except inutsialized variables should be optionals
    var albums : [Album]?
    var songs : [Song]?
    var composers : Composers?
    var id : String?
    var name : String
    var genre : Genre?
    
    
    init(name : String) {
        self.name = name
    }
    
    

}

struct Album {
    
    var artist : Artist
    var songs : [Song]
    var composers : Composers?
//    var id : String
    var title : String
    var genre : Genre
    
    
    init(artist : Artist , songs : [Song]  , title : String , genre : Genre) {
        self.artist = artist
        self.songs = songs
        self.title = title
        self.genre = genre
    }
    
    
    
}




struct Composers {
    var composerNames : [String]
    var artists : [Artist]
    var albums : [Album]
    var songs : [Song]
}

enum Genre {
    case HipHop
    case RB
    case Soul
    case Electronic
    
    
}

//list of songs



class test {
    
    init() {
        var lSongs = [Song]()
        
        for i in 0...20{
            //let id = "Indentification\(i)"
            var artist = Artist(name: "ebuka\(i)")
            var song = Song(id: "songid\(i)", title: "song\(i)", artist: artist)
            let album = Album(artist: artist, songs: [song], title: "album\(i)", genre: .HipHop)
            artist.albums?.append(album)
            song.album = album
            lSongs.append(song)
        }
        
        
//        var artist = Artist(name: "ebuka1")
//        var songsong = Song(id: "hey", title: "hhey", artist: artist)
//        lSongs.append(songsong)
//        songsong.genre = .HipHop
//        artist.songs!.append(songsong)
//        let album = Album(artist: artist, songs: lSongs, id: "123", title: "album1", genre: .HipHop)
    }
    
    
    func setupList() -> [Song]{
        var lSongs = [Song]()
        for i in 0...20{
            var artist = Artist(name: "ebuka\(i)")
            var song = Song(id: "songid\(i)", title: "song\(i)", artist: artist)
            let album = Album(artist: artist, songs: [song], title: "album\(i)", genre: .HipHop)
            artist.albums?.append(album)
            song.album = album
            lSongs.append(song)
        }
        return lSongs
    }
   
    
    
    
    
   
    
}
