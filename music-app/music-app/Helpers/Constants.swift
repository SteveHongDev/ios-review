//
//  Constants.swift
//  music-app
//
//  Created by 홍성범 on 2022/09/20.
//

import UIKit

public struct MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
    
    private init() {}
}

public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init() {}
}

public struct CVCell {
    static let spacingWidth: CGFloat = 1
    static let cellColumns: CGFloat = 3
    
    private init() {}
}
