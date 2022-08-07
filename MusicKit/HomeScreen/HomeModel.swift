//
//  HomeModel.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-10-06.
//

import Foundation
import UIKit

protocol HomeModelType {

    var screenHeader: String { get }
    var topLeftQuadTitle: String { get }
    var topRightQuadTitle: String { get }
    var bottomLeftQuadTitle: String { get }
    var bottomRightQuadTitle: String { get }
    var minutesListened: Int { get }
    var topGenre: String { get }
    var newSongs: Int { get }
    var newArtists: Int { get }

    var topSongs: [Song] { get }
    var topAlbums: [Album] { get }
    var topArtists: [Artist] { get }
}

class HomeModel: HomeModelType {

    let screenHeader = "Your Music Stats"
    let topLeftQuadTitle = "Play Time"
    let topRightQuadTitle = "Top Genre"
    let bottomLeftQuadTitle = "New Songs"
    let bottomRightQuadTitle = "New Artists"
    let minutesListened = 123456
    let topGenre = "Genre"
    let newSongs = 4321
    let newArtists = 1234

    let topSongs: [Song]
    let topAlbums: [Album]
    let topArtists: [Artist]

    //mock data
    let mockTopSong1 = Song(name: "#1", artist: "john doe", numListens: 10, artwork: nil)
    let mockTopSong2 = Song(name: "#2", artist: "john doe", numListens: 9, artwork: nil)
    let mockTopSong3 = Song(name: "#3", artist: "john doe", numListens: 8, artwork: nil)
    let mockTopSong4 = Song(name: "#4", artist: "john doe", numListens: 7, artwork: nil)
    let mockTopSong5 = Song(name: "#5", artist: "john doe", numListens: 6, artwork: nil)
    let mockTopSong6 = Song(name: "#6", artist: "john doe", numListens: 5, artwork: nil)
    let mockTopSong7 = Song(name: "#7", artist: "john doe", numListens: 4, artwork: nil)
    let mockTopSong8 = Song(name: "#8", artist: "john doe", numListens: 3, artwork: nil)
    let mockTopSong9 = Song(name: "#9", artist: "john doe", numListens: 2, artwork: nil)
    let mockTopSong10 = Song(name: "#10", artist: "john doe", numListens: 1, artwork: nil)

    let mockTopArtist1 = Artist(name: "#1", numListens: 10)
    let mockTopArtist2 = Artist(name: "#2", numListens: 9)
    let mockTopArtist3 = Artist(name: "#3", numListens: 8)
    let mockTopArtist4 = Artist(name: "#4", numListens: 7)
    let mockTopArtist5 = Artist(name: "#5", numListens: 6)
    let mockTopArtist6 = Artist(name: "#6", numListens: 5)
    let mockTopArtist7 = Artist(name: "#7", numListens: 4)
    let mockTopArtist8 = Artist(name: "#8", numListens: 3)
    let mockTopArtist9 = Artist(name: "#9", numListens: 2)
    let mockTopArtist10 = Artist(name: "#10", numListens: 1)

    let mockTopAlbum1 = Album(name: "#1", numListens: 10)
    let mockTopAlbum2 = Album(name: "#2", numListens: 9)
    let mockTopAlbum3 = Album(name: "#3", numListens: 8)
    let mockTopAlbum4 = Album(name: "#4", numListens: 7)
    let mockTopAlbum5 = Album(name: "#5", numListens: 6)
    let mockTopAlbum6 = Album(name: "#6", numListens: 5)
    let mockTopAlbum7 = Album(name: "#7", numListens: 4)
    let mockTopAlbum8 = Album(name: "#8", numListens: 3)
    let mockTopAlbum9 = Album(name: "#9", numListens: 2)
    let mockTopAlbum10 = Album(name: "#10", numListens: 1)

    required init() {
        self.topSongs = [mockTopSong1, mockTopSong2, mockTopSong3, mockTopSong4, mockTopSong5, mockTopSong6, mockTopSong7, mockTopSong8, mockTopSong9, mockTopSong10]
        self.topArtists = [mockTopArtist1, mockTopArtist9, mockTopArtist8, mockTopArtist7, mockTopArtist6, mockTopArtist5, mockTopArtist4, mockTopArtist3, mockTopArtist2, mockTopArtist10]
        self.topAlbums = [mockTopAlbum1, mockTopAlbum2, mockTopAlbum3, mockTopAlbum4, mockTopAlbum5, mockTopAlbum6, mockTopAlbum7, mockTopAlbum8, mockTopAlbum9, mockTopAlbum10]
    }
}
