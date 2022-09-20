//
//  Music.swift
//  music-app
//
//  Created by 홍성범 on 2022/09/20.
//

import Foundation

// MARK: - Welcome
struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

// MARK: - Result
struct Music: Codable {
    let artistName: String?
    let albumName: String?
    let trackName: String?
    let previewUrl: String?
    let imageUrl: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case artistName, trackName, previewUrl, releaseDate
        case albumName = "collectionName"
        case imageUrl = "artworkUrl100"
    }
    
    // Date format 변경
    var releaseDateString: String? {
        guard let isoDate = ISO8601DateFormatter().date(from: releaseDate ?? "") else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = formatter.string(from: isoDate)
        
        return dateString
    }
}
