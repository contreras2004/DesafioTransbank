//
//  SongDetailViewController.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {

    var song: Song

    lazy var songDetailView: SongDetailView = {
        //var dateString: String?
        /*if let date = song.releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            dateString = dateFormatter.string(from: date)
        }*/

        let viewModel = SongDetailViewModel(
            trackId: song.trackId,
            artistName: song.artistName,
            trackName: song.trackName,
            previewUrl: song.previewUrl,
            artworkUrl100: song.artworkUrl100,
            trackPrice: song.trackPrice,
            releaseDate: song.releaseDate?.date.simpleFormattedDateString())
        let view = SongDetailView(viewModel: viewModel)
        return view
    }()

    override func loadView() {
        self.view = songDetailView
    }

    init(song: Song) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
        self.title = "Detalle"
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
