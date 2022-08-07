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
    let topGenre = "Pop"
    let newSongs = 4321
    let newArtists = 1234

    let topSongs: [Song]
    let topAlbums: [Album]
    let topArtists: [Artist]

    //mock data
    let mockTopSong1 = Song(name: "Shivers", artist: "Ed Sheeran", numListens: 255, artwork: nil)
    let mockTopSong2 = Song(name: "Turn Off Time", artist: "David Myles", numListens: 237, artwork: nil)
    let mockTopSong3 = Song(name: "Angels", artist: "Robbie Williams", numListens: 208, artwork: nil)
    let mockTopSong4 = Song(name: "Hesitate", artist: "Jonas Brothers", numListens: 194, artwork: nil)
    let mockTopSong5 = Song(name: "Starlight", artist: "Taylor Swift", numListens: 158, artwork: nil)
    let mockTopSong6 = Song(name: "I Hear a Symphony", artist: "Cody Fry", numListens: 156, artwork: nil)
    let mockTopSong7 = Song(name: "The Wonder of You", artist: "Villagers", numListens: 134, artwork: nil)
    let mockTopSong8 = Song(name: "Revolution", artist: "The Beatles", numListens: 122, artwork: nil)
    let mockTopSong9 = Song(name: "No Time To Die", artist: "Billie Eilish", numListens: 110, artwork: nil)
    let mockTopSong10 = Song(name: "Our Song", artist: "Taylor Swift", numListens: 105, artwork: nil)

    let mockTopArtist1 = Artist(name: "Taylor Swift", numListens: 1002)
    let mockTopArtist2 = Artist(name: "The Beatles", numListens: 980)
    let mockTopArtist3 = Artist(name: "Ed Sheeran", numListens: 923)
    let mockTopArtist4 = Artist(name: "Villagers", numListens: 861)
    let mockTopArtist5 = Artist(name: "Phantom Planet", numListens: 762)
    let mockTopArtist6 = Artist(name: "Jonas Brothers", numListens: 754)
    let mockTopArtist7 = Artist(name: "Oasis", numListens: 708)
    let mockTopArtist8 = Artist(name: "Enya", numListens: 702)
    let mockTopArtist9 = Artist(name: "Cher", numListens: 689)
    let mockTopArtist10 = Artist(name: "Al Green", numListens: 677)

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
