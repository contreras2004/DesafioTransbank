//
//  SongDetailView.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Components

struct SongDetailViewModel {
    let trackId: Int?
    let artistName: String?
    let trackName: String?
    let previewUrl: URL?
    let artworkUrl100: URL?
    let trackPrice: Double?
    let releaseDate: String?
}

class SongDetailView: UIView {

    let viewModel: SongDetailViewModel

    lazy var trackImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.kf.setImage(with: self.viewModel.artworkUrl100)
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return image
    }()

    lazy var songNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = self.viewModel.trackName
        view.font = .systemFont(ofSize: 26)
        view.numberOfLines = 0
        return view
    }()

    lazy var artistNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = .systemFont(ofSize: 22)
        view.textColor = .darkGray
        view.numberOfLines = 0
        if let artistName = self.viewModel.artistName {
            view.text = "Artista: \(artistName)"
        }
        return view
    }()

    lazy var releaseDate: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = .systemFont(ofSize: 16)
        view.textColor = .lightGray
        view.numberOfLines = 0
        if let releaseDate = self.viewModel.releaseDate {
            view.text = "Fecha de lanzamiento: \(releaseDate)"
        }
        return view
    }()

    lazy var trackPriceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = .systemFont(ofSize: 16)
        view.textColor = .darkGray
        view.numberOfLines = 0
        if let price = self.viewModel.trackPrice {
            view.text = "$ \(price)"
        }
        return view
    }()

    lazy var songPreview: PreviewMediaView = {
        let view = PreviewMediaView(url: self.viewModel.previewUrl)
        return view
    }()

    init(viewModel: SongDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildUI()
        backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SongDetailView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(trackImage)
        addSubview(songNameLabel)
        addSubview(artistNameLabel)
        addSubview(trackPriceLabel)
        addSubview(releaseDate)
        addSubview(songPreview)
    }

    func addConstraints() {
        trackImage.layout.applyConstraint { view in
            view.topAnchor(equalTo: safeTopAnchor)
            view.leftAnchor(equalTo: leftAnchor)
            view.rightAnchor(equalTo: rightAnchor)
            view.heightAnchor(equalTo: 100)
        }

        trackPriceLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: trackImage.bottomAnchor, constant: 24)
            view.rightAnchor(equalTo: rightAnchor, constant: -8)
            view.widthAnchor(lessThanOrEqualToConstant: 80)
        }

        songNameLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: trackImage.bottomAnchor, constant: 16)
            view.leftAnchor(equalTo: leftAnchor, constant: 8)
            view.rightAnchor(equalTo: trackPriceLabel.leftAnchor, constant: -16)
        }

        artistNameLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: songNameLabel.bottomAnchor, constant: 16)
            view.leftAnchor(equalTo: leftAnchor, constant: 8)
            view.rightAnchor(equalTo: trackPriceLabel.leftAnchor, constant: -16)
        }

        releaseDate.layout.applyConstraint { view in
            view.topAnchor(equalTo: artistNameLabel.bottomAnchor, constant: 16)
            view.leftAnchor(equalTo: leftAnchor, constant: 8)
            view.rightAnchor(equalTo: trackPriceLabel.leftAnchor, constant: -16)
        }

        songPreview.layout.applyConstraint { view in
            view.bottomAnchor(equalTo: safeBottomAnchor)
            view.leftAnchor(equalTo: leftAnchor)
            view.rightAnchor(equalTo: rightAnchor)
            view.heightAnchor(equalTo: 60)
        }
    }
}
