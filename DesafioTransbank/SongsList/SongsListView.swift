//
//  SongsListView.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Components

protocol SongsListViewDelegate: AnyObject {
    func didSelectSong(song: Song)
}

class SongsListViewModel {
    var songs: [Song] = []

    init(songs: [Song]) {
        self.songs = songs
    }
}

class SongsListView: UIView {

    weak var delegate: SongsListViewDelegate?

    var viewModel: SongsListViewModel {
        didSet {
            self.tableView.reloadData()
            if self.viewModel.songs.isEmpty {
                self.addAnimation(viewModel: .init(message: "No hay resultados", animation: .emptyResults))
            }
        }
    }

   lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Ej: Bohemian Rhapsody"
        return view
    }()

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.delegate = self
        view.dataSource = self
        view.register(SongCell.self, forCellReuseIdentifier: SongCell.reusableID)
        view.estimatedRowHeight = 112
        view.separatorStyle = .none
        view.backgroundColor = .clear
        view.backgroundView = UIView()
        view.keyboardDismissMode = .onDrag
        return view
    }()

    init(viewModel: SongsListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SongsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension SongsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reusableID) as? SongCell {
            let song = self.viewModel.songs[indexPath.row]
            cell.viewModel = SongCellViewModel(
                songTitle: song.trackName ?? "",
                artistName: song.artistName ?? "",
                imageUrl: song.artworkUrl100 ?? URL(fileURLWithPath: ""))
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectSong(song: self.viewModel.songs[indexPath.row])
    }
}

extension SongsListView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(searchBar)
        addSubview(tableView)
    }

    func addConstraints() {
        searchBar.layout.applyConstraint { view in
            view.leftAnchor(equalTo: leftAnchor)
            view.topAnchor(equalTo: safeTopAnchor)
            view.rightAnchor(equalTo: rightAnchor)
        }
        tableView.layout.applyConstraint { view in
            view.leftAnchor(equalTo: leftAnchor)
            view.topAnchor(equalTo: searchBar.bottomAnchor)
            view.rightAnchor(equalTo: rightAnchor)
            view.bottomAnchor(equalTo: safeBottomAnchor)
        }
    }
}
