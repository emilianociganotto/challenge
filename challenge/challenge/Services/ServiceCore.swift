//
//  ServiceCore.swift
//  challenge
//
//  Created by Fernando Noya on 04/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import Foundation

enum HttpMethod : String {
    case  GET
    case  POST
    case  DELETE
    case  PUT
}

class HttpClientApi: NSObject{
    
    var request : URLRequest?
    var session : URLSession?
    static func instance() ->  HttpClientApi{
        return HttpClientApi()
    }
    
    func makeAPICall(baseUrl: String, opKey: String, params: String, method: HttpMethod, completion: @escaping(Data?, HTTPURLResponse?, NSError?) -> Void, failure: @escaping (Data?, HTTPURLResponse?, NSError?) -> Void) {
        var finalParams = ""
        if !params.isEmpty {
            finalParams = params.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        }
        request = URLRequest(url: URL(string: baseUrl + opKey + finalParams) ?? URL(string: baseUrl + opKey)!)
        request?.httpMethod = method.rawValue
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        session = URLSession(configuration: configuration)

        session?.dataTask(with: request! as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                  completion(data , response , error as NSError?)
                } else {
                  failure(data , response as? HTTPURLResponse, error as NSError?)
                }
            }else {
              failure(data , response as? HTTPURLResponse, error as NSError?)
            }
        }.resume()
    }

}

