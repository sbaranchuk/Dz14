//
//  AlbumsTabBarViewController.swift
//  Dz14
//
//  Created by Admin on 15/01/2023.
//

import UIKit
import SnapKit

class AlbumsTabBarViewController: UIViewController {

    // MARK: - Properties

    private var cells: [[CellContent]]?
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collection.register(MyAlbumsCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyAlbumsCellHeader.identifier)
        collection.register(MediaTypesCell.self, forCellWithReuseIdentifier: MediaTypesCell.identifier)
        collection.register(MediaTypeCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MediaTypeCellHeader.identifier)
        collection.register(UtilittiesCell.self, forCellWithReuseIdentifier: UtilittiesCell.identifier)
        collection.register(UtilitiesCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UtilitiesCellHeader.identifier)
        return collection
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        cells = CellContent.cells
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Albums"
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }
    
    // MARK: - Actions
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                      heightDimension: .fractionalHeight(0.5))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46),
                                                       heightDimension: .fractionalHeight(0.53))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 5)
                sectionLayout.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                
                return sectionLayout
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                       heightDimension: .fractionalHeight(0.6))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: self.cells?[sectionIndex].count ?? 0)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                
                return sectionLayout
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                       heightDimension: .fractionalHeight(0.4))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: self.cells?[sectionIndex].count ?? 0)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                
                return sectionLayout
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.8 * 2))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging

                return sectionLayout
            }
        }
    }
}

// MARK: - Extensions

extension AlbumsTabBarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells?[section].count ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cells?.count ?? 0
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as? MyAlbumsCell
            cell?.cells = cells?[indexPath.section][indexPath.item]
            cell?.backgroundColor = .clear
            return cell ?? UICollectionViewCell()
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesCell.identifier, for: indexPath) as? MediaTypesCell
            cell?.cells = cells?[indexPath.section][indexPath.item]
            cell?.backgroundColor = .clear
            if indexPath.item == (cells?[indexPath.section].count ?? 0) - 1 {
                cell?.separatorView.backgroundColor = .clear
            }
            return cell ?? UICollectionViewCell()
        case 2:
            switch cells?[indexPath.section][indexPath.item].withLock {
            case true:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UtilittiesCell.identifier, for: indexPath) as? UtilittiesCell
                cell?.cells = cells?[indexPath.section][indexPath.item]
                cell?.backgroundColor = .clear
                if indexPath.item == (cells?[indexPath.section].count ?? 0) - 1 {
                    cell?.separatorView.backgroundColor = .clear
                }
                return cell ?? UICollectionViewCell()
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesCell.identifier, for: indexPath) as? MediaTypesCell
                cell?.cells = cells?[indexPath.section][indexPath.item]
                cell?.backgroundColor = .clear
                if indexPath.item == (cells?[indexPath.section].count ?? 0) - 1 {
                    cell?.separatorView.backgroundColor = .clear
                }
                return cell ?? UICollectionViewCell()
            }

        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MyAlbumsCellHeader.identifier, for: indexPath) as? MyAlbumsCellHeader
            header?.titleLabel.text = "My Albums"
            header?.seeAllLabel.text = "See All"
            return header ?? UICollectionReusableView()

        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MediaTypeCellHeader.identifier, for: indexPath) as? MediaTypeCellHeader
            header?.titleLabel.text = "Media Types"
            return header ?? UICollectionReusableView()
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UtilitiesCellHeader.identifier, for: indexPath) as? UtilitiesCellHeader
            header?.titleLabel.text = "Utilities"
            return header ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}
