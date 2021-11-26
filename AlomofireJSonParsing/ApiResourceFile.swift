//
//  ApiResourceFile.swift
//  AlomofireJSonParsing
//
//  Created by Siddhesh Kotavdekar on 11/22/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import Foundation
import Alamofire

protocol Siddesh {
    func delegateMethod(ent:genderizeModel)
}
class getData:NSObject{
    
    var dele : Siddesh?
    
    func getDataWithAF(){
        AF.request("https://api.genderize.io?name=luc").response {response in
            if let data = response.data{
                do{
                    guard let json = try? JSONDecoder().decode(genderizeModel.self, from: data) else{return}
                    self.dele?.delegateMethod(ent: json)
                }catch{error.localizedDescription}
            }
        }
    }
}
