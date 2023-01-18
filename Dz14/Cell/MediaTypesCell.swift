//
//  MediaTypesCell.swift
//  Dz14
//
//  Created by Admin on 18/01/2023.
//

import UIKit

class MediaTypesCell: UICollectionViewCell {

    static let identifier = "MediaTypesCell"

    // MARK: - Outlets

    private lazy var imageView: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: CGFloat(23.0))
        let image = UIImage(systemName: "video", withConfiguration: config)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.contentMode = .left
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Videos"
        label.font = label.font.withSize(22)
        label.textColor = .systemBlue
        return label
    }()

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor.systemGray
        return label
    }()

    private lazy var chevronImageView: UIImageView = {
        let image = UIImage(systemName: "chevron.forward")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.tintColor = .systemGray3
        return imageView
    }()

    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
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
        addSubview(chevronImageView)
        addSubview(separatorView)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageView.snp.right).offset(15)
        }

        counterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(chevronImageView.snp.left).offset(-10)
        }

        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
        }

        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
