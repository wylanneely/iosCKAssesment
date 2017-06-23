//
//  ImageController.swift
//  AssesmentObectiveC
//
//  Created by ALIA M NEELY on 6/23/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static let baseImageURL = URL(string: "http://image.tmdb.org/t/p/w500")
    
    static func getImageURL(imageEndPoint: String, completion: @escaping (UIImage?)-> Void){
        guard let baseImageURL = baseImageURL else { return }
        let imageURL = baseImageURL.appendingPathComponent(imageEndPoint)
        self.image(forURL: imageURL) { (image) in
            completion(image)
        }
    }
    
   fileprivate static func image(forURL url: URL , completion: @escaping (UIImage?) -> Void) {
        self.performRequest(for: url, httpMethod: "GET") { (data, error) in
            guard let data = data else {completion(nil);return}
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                completion(image)
                return
            }
        }
    }
    
   fileprivate static func performRequest(for url: URL,
                               httpMethod: String,
                               urlParameters: [String: String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod
        request.httpBody = body
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion?(data, error)
        }
        dataTask.resume()
    }
    
   fileprivate static func url(byAdding parameters: [String: String]?, to url: URL) -> URL {
        var componets = URLComponents(url: url, resolvingAgainstBaseURL: true)
        componets?.queryItems = parameters?.flatMap{ URLQueryItem(name: $0.key, value: $0.value) }
        guard let url = componets?.url else { fatalError("URL Optional is nil") }
        return url
    }
    
}
