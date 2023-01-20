//
//  MyAlbumsCellHeader.swift
//  Dz14
//
//  Created by Admin on 18/01/2023.
//

import UIKit

class MyAlbumsCellHeader: UICollectionReusableView {

    static let identifier = "MyAlbumsCell"

    // MARK: - Outlets

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    lazy var seeAllLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()


    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in MyAlbumsCellHeader")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(seeAllLabel)
    }

    private func setupLayout() {

        separatorView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.top.equalTo(separatorView.snp.bottom).offset(10)
        }

        seeAllLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.right.equalTo(self).offset(-20)
        }
    }
}
