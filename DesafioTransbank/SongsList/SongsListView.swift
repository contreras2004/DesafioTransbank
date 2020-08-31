//
//  SongsListView.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Components


class SongCell: UITableViewCell {
    static let reusableID = "SongsCelReusablelID"


    func configure(with song: Song) {
//        self.contentView.te
    }
}

class SongsListViewModel {
    var songs: [Song] = []

    init(songs: [Song]) {
        self.songs = songs
    }
}

class SongsListView: UIView {

    var viewModel: SongsListViewModel {
        didSet {
            self.tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.delegate = self
        view.dataSource = self
        view.register(SongCell.self, forCellReuseIdentifier: SongCell.reusableID)
        return view
    }()

    init(viewModel: SongsListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SongsListView: UITableViewDelegate {

}

extension SongsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reusableID) as? SongCell {
            cell.configure(with: self.viewModel.songs[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension SongsListView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(tableView)
    }

    func addConstraints() {
        tableView.layout.applyConstraint { view in
            view.inset(to: self)
        }
    }
}
