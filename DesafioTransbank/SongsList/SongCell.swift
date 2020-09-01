//
//  SongCell.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Components
import Kingfisher

struct SongCellViewModel {
    let songTitle: String
    let artistName: String
    let imageUrl: URL
}

class SongCell: UITableViewCell {
    static let reusableID = "SongsCelReusablelID"

    var viewModel: SongCellViewModel? {
        didSet {
            titleLabel.text = self.viewModel?.songTitle
            artisteLabel.text = self.viewModel?.artistName
            imageView?.kf.setImage(with: self.viewModel?.imageUrl) { [weak self] _ in
                self?.setNeedsLayout()
            }
        }
    }

    lazy var songImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 18)
        view.textColor = .darkGray
        return view
    }()

    lazy var artisteLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = .darkText
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SongCell: ViewCodable {
    func buildViewHierarchy() {
        addSubview(songImage)
        addSubview(titleLabel)
        addSubview(artisteLabel)
    }

    func addConstraints() {

        songImage.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 8)
            view.leftAnchor(equalTo: leftAnchor, constant: 8)
            view.widthAnchor(equalTo: 100)
            view.aspectRadio(constant: 1)
            view.bottomAnchor(equalTo: bottomAnchor, constant: -8)
        }

        titleLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 8)
            view.leftAnchor(equalTo: songImage.rightAnchor, constant: 16)
            view.rightAnchor(equalTo: rightAnchor, constant: -16)
        }

        artisteLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: titleLabel.bottomAnchor, constant: 8)
            view.leftAnchor(equalTo: songImage.rightAnchor, constant: 16)
            view.rightAnchor(equalTo: rightAnchor, constant: -16)
        }
    }
}
