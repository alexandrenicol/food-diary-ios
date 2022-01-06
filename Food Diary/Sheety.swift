//
//  Sheety.swift
//  Food Diary
//
//  Created by Raoul on 04/01/2022.
//
import Alamofire
import Foundation

class Sheety {
    class func send(date: Date, category: String, type: String, note: String, callback:  @escaping () -> Void) -> Void {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd HH:mm:ss"
        
        let data: [String: String] = [
            "date": dateFormatter.string(from: date),
            "category": category,
            "type": type,
            "note": note
        ]
        
        let parameters  = ["sheet1": data]
        
        let authorization = ProcessInfo.processInfo.environment["SHEETSU_AUTHORIZATION"] ?? ""
        let url = ProcessInfo.processInfo.environment["SHEETSU_URL"] ?? ""
        
        let headers: HTTPHeaders = [
            "Authorization": authorization,
            "Accept": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseData { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                callback()
            case let .failure(error):
                print("Error")
                print(error)
            }
        }
    }

}

