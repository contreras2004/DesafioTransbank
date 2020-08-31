//
//  ViewController.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 28-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Components
import TBNetwork

class SongsListViewController: UIViewController {

    private lazy var songsListView = SongsListView(viewModel: SongsListViewModel(songs: []))

    init() {
        // this should initialize with a provider that handles the network requests..
        // but for the sake of this example we will use a static function to fetch the data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = songsListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.loadSongs()

    }

    private func loadSongs() {
        self.view.addAnimation(viewModel: .init(message: "Cargando", animation: .loading))
        TBRequest.request(
            endpoint: Endpoint.itunes.rawValue
        ) { [weak self] (result: Result<ItunesResponseModel, Error>) in

            switch result {
            case .success(let itunesResponse):
                debugPrint("encontró \(itunesResponse.results.count)")
                self?.songsListView.viewModel = SongsListViewModel(songs: itunesResponse.results)
                self?.view.removeAnimation()
            case .failure(let error):
                debugPrint("error: \(error)")
            }
        }
    }
}
