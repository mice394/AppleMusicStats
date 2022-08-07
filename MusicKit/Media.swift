//
//  Media.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-11-25.
//

import Foundation
import UIKit

class Media {
    var name: String?
    var artist: String?
    var numListens: Int?
    var artwork: UIImage?

    init() {}

//    init(name: String, numListens: Int, artWork: UIImage?) {
//        self.name = name
//        self.numListens = numListens
//        self.artwork = artWork
//    }
}

class Song: Media {
    init(name: String, artist: String, numListens: Int, artwork: UIImage?) {
        super.init()
        
        self.name = name
        self.artist = artist
        self.numListens = numListens
        self.artwork = artwork
    }
}

class Artist: Media {

    init(name: String, numListens: Int) {
        super.init()

        self.name = name
        self.numListens = numListens
    }
}

class Album: Media {
    init(name: String, numListens: Int) {
        super.init()

        self.name = name
        self.numListens = numListens
    }
}

