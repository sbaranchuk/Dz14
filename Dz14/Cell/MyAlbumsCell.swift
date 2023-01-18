//
//  MyAlbumsCell.swift
//  Dz14
//
//  Created by Admin on 17/01/2023.
//

import UIKit

class MyAlbumsCell: UICollectionViewCell {

    static let identifier = "MyAlbumsCell"

    // MARK: - Outlets

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "IMG_6827")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.contentMode = .center

        imageView.layer.cornerRadius = 5
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recents"
        label.font = label.font.withSize(14)
        return label
    }()

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "129"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.systemGray
        return label
    }()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(counterLabel)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
            make.height.width.equalTo(170)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.left.equalTo(imageView.snp.left)
        }

        counterLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(imageView.snp.left)
        }
    }
}
