//
//  UtilitiesCell.swift
//  Dz14
//
//  Created by Admin on 18/01/2023.
//

import UIKit

class UtilittiesCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "UtilitiesCell"

    var cells: CellContent? {
        didSet {
            let config = UIImage.SymbolConfiguration(pointSize: CGFloat(23))
            imageView.image = UIImage(systemName: (cells?.image ?? "questionmark"), withConfiguration: config)
            titleLabel.text = cells?.title
        }
    }

    // MARK: - Outlets

    private lazy var imageView: UIImageView = {
        let image: UIImage? = nil
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Videos"
        label.font = label.font.withSize(22)
        label.textColor = .systemBlue
        return label
    }()

    private lazy var counterLabelView: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: CGFloat(13.0))
        let image = UIImage(systemName: "lock.fill", withConfiguration: config)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.contentMode = .left
        imageView.tintColor = .systemGray
        return imageView
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
        addSubview(counterLabelView)
        addSubview(chevronImageView)
        addSubview(separatorView)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
            make.height.width.equalTo(30)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageView.snp.right).offset(15)
        }

        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
        }

        counterLabelView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(chevronImageView.snp.left).offset(-10)
        }

        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
