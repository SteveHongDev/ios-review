//
//  SearchResultViewController.swift
//  music-app
//
//  Created by 홍성범 on 2022/09/20.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    let networkManager = NetworkManager.shared
    
    var musics = [Music]()
    
    var searchTerm: String? {
        didSet {
            setupData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWidth * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumInteritemSpacing = CVCell.spacingWidth
        flowLayout.minimumLineSpacing = CVCell.spacingWidth
        collectionView.collectionViewLayout = flowLayout
    }
    
    func setupData() {
        // 옵셔널 바인딩
        guard let term = searchTerm else { return }
        print("네트워킹 시작 단어 \(term)")
        
        // (네트워킹 시작전에) 다시 빈배열로 만들기
        self.musics = []
        
        // 네트워킹 시작 (찾고자하는 단어를 가지고)
        networkManager.fetchMusic(searchTerm: term) { result in
            switch result {
            case .success(let musicData):
                // 결과를 배열에 담고
                self.musics = musicData
                // 컬렉션뷰를 리로드 (메인쓰레드에서)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.musicCollectionViewCellIdentifier, for: indexPath) as! MusicCollectionViewCell
        
        cell.imageUrl = musics[indexPath.item].imageUrl
        
        return cell
    }
}
