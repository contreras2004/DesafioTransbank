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

    private lazy var songsListView: SongsListView = {
        let view = SongsListView(viewModel: SongsListViewModel(songs: []))
        view.delegate = self
        return view
    }()

    init() {
        // this should initialize with a provider that handles the network requests..
        // but for the sake of this example we will use a static function to fetch the data
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = songsListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Canciones" //this should be in a localized file... but for the sake of this test...
        self.view.backgroundColor = .white
        self.songsListView.searchBar.delegate = self
        self.songsListView.addAnimation(
            viewModel: .init(
                message: "Para comenzar ingresa\nlo que quieres buscar",
                animation: .searchTerm,
                loopAnimation: false))
    }

    private func search(searchTerm: String) {
        self.view.addAnimation(viewModel: .init(message: "Cargando", animation: .loading))
        guard let fullUrl = EndpointBuilder.buildEndpoint(endpoint: Endpoint.itunes, extraQueryItems: [
            .init(name: "term", value: searchTerm)
        ]) else { return }
        debugPrint(fullUrl)
        TBRequest.request(endpoint: fullUrl) { [weak self] (result: Result<ItunesResponseModel, Error>) in
            self?.view.removeAnimation()
            switch result {
            case .success(let itunesResponse):
                self?.songsListView.viewModel = SongsListViewModel(songs: itunesResponse.results)
            case .failure(let error):
                self?.view.addAnimation(viewModel: .init(
                    message: "Ocurrió un error",
                    animation: .genericError))
                debugPrint("Error: \(error)")
            }
        }
    }
}

extension SongsListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.search(searchTerm: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.songsListView.searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.songsListView.searchBar.resignFirstResponder()
    }
}

extension SongsListViewController: SongsListViewDelegate {
    func didSelectSong(song: Song) {
        self.songsListView.searchBar.resignFirstResponder()
        let viewController = SongDetailViewController(song: song)
        self.present(viewController, animated: true)
    }
}
