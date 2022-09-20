//
//  NetworkingManager.swift
//  music-app
//
//  Created by 홍성범 on 2022/09/20.
//

import Foundation

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    typealias NetworkCompletion = (Result<[Music], NetworkError>) -> ()
    
    func fetchMusic(searchTerm: String, completion: @escaping NetworkCompletion) {
        // URL구조체 만들기
        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
        
        performRequest(with: urlString) { result in
            completion(result) 
        }
        
    }
    
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                print("Error: Did not receive data")
                completion(.failure(.dataError))
                return
            }
            
            if let musics = self.parseJSON(safeData) {
                completion(.success(musics))
            } else {
                completion(.failure(.parseError))
            }
        }
        
        task.resume()
    }
    
    private func parseJSON(_ data: Data) -> [Music]? {
        do {
            let musicData = try JSONDecoder().decode(MusicData.self, from: data)
            return musicData.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
