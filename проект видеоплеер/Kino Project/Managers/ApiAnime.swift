//
//  ApiAnime.swift
//  Kino Project
//
//  Created by mac on 27.06.2022.
//

import Foundation

struct Contact {
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let baseUrl = "https://api.themoviedb.org"
}

enum ApiError: Error {
    case failed
}

class ApiAnime {
    static let shared = ApiAnime()
    
    
    func getMovie(complition: @escaping (Result<[Movie], Error>) -> Void)  {
        guard let url = URL(string: "\(Contact.baseUrl)/3/trending/movie/day?api_key=\(Contact.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            
            do {
                let result =  try JSONDecoder().decode(MovieResponce.self, from: data)
                complition(.success(result.result))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrallingTv(complition: @escaping (Result<[TV], Error>) -> Void) {
        guard let url = URL(string: "\(Contact.baseUrl)/3/trending/movie/day?api_key=\(Contact.API_KEY)") else {return}
        let newTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ThreadingResponce.self, from: data)
                complition(.success(result.results))
            }
            catch {
                complition(.failure(error))
            }
            
        }
        newTask.resume()
    }
    
    func go(complition: @escaping (Result<[TV], Error>) -> Void) {
        guard let url = URL(string: "\(Contact.baseUrl)/3/trending/movie/day?api_key=\(Contact.API_KEY)") else {return}
        let taskN = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ThreadingResponce.self, from: data)
                complition(.success(result.results))
            }
            catch {
                complition(.failure(error))
            }
        }
        taskN.resume()
    }
    
    func go2(complition: @escaping (Result<[TV], Error>) -> Void) {
        guard let url = URL(string: "\(Contact.baseUrl)/3/trending/movie/day?api_key=\(Contact.API_KEY)") else {return}
        let taskN = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ThreadingResponce.self, from: data)
                complition(.success(result.results))
            }
            catch {
                complition(.failure(error))
            }
        }
        taskN.resume()
    }
    func go3(complition: @escaping (Result<[TV], Error>) -> Void) {
        guard let url = URL(string: "\(Contact.baseUrl)/3/trending/movie/day?api_key=\(Contact.API_KEY)") else {return}
        let taskN = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ThreadingResponce.self, from: data)
                complition(.success(result.results))
            }
            catch {
                complition(.failure(error))
            }
        }
        taskN.resume()
    }
    
    func getDiscovereMovie(complition: @escaping (Result<[TV], Error>) -> Void) {
        
        guard let url = URL(string: "\(Contact.baseUrl)/3/discover/movie?api_key=\(Contact.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let taskq = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ThreadingResponce.self, from: data)
                complition(.success(result.results))
            }
            catch {
                complition(.failure(ApiError.failed))
            }
        }
        taskq.resume()
    }
}
