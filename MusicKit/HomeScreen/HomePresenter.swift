//
//  HomePresenter.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-10-06.
//

import Foundation
import UIKit

protocol HomePresenterType: AnyObject {
    //functions that will be executed and implemented in presenter (so that VC has access)

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
    var topArtsts: [Artist] { get }
}

protocol HomeViewType: AnyObject {
    //functions that will be executed and implemented in VC (so that presenter has access)
}

class HomePresenter: HomePresenterType {

    var screenHeader: String { return model.screenHeader }

    var topLeftQuadTitle: String { return model.topLeftQuadTitle }

    var topRightQuadTitle: String { return model.topRightQuadTitle }

    var bottomLeftQuadTitle: String { return model.bottomLeftQuadTitle }

    var bottomRightQuadTitle: String { return model.bottomRightQuadTitle }

    var minutesListened: Int { return model.minutesListened }

    var topGenre: String { return model.topGenre }

    var newSongs: Int { return model.newSongs }

    var newArtists: Int { return model.newArtists }

    var topSongs: [Song] { return model.topSongs }

    var topAlbums: [Album] { return model.topAlbums }

    var topArtsts: [Artist] { return model.topArtists }

    private var model: HomeModelType
    private weak var view: HomeViewType?

    required init(model: HomeModelType, view: HomeViewType) {
        self.model = model
        self.view = view
    }
}
