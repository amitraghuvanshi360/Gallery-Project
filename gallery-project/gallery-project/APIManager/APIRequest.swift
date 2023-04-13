//
//  APIRequest.swift
//  gallery-project
//
//  Created by Ankush Sharma on 10/04/23.
//

import Foundation


struct APIUrls {
    static let UserLogin = "api/Authorization/Login"
}

class APIMAnager : NSObject {
    
    
    class func LoginRequestAPI(completion:@escaping (User?) -> Void){
        let base_url = "\(Constant.BASE_URL)\(APIUrls.UserLogin)"
        guard let url = URL.init(string: base_url) else {
            return
        }
        
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = "POST"
        
        let params :[String: Any] = ["email" : "amit@gamil.com", "password" : "Amit@123"]
        let postStr = self.getPostString(params: params)
        urlRequest.httpBody = postStr.data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data , response , error in
            if let errors = error {
                print(errors.localizedDescription)
            }
            
            guard let getdata = data else {
                print("Error in Data")
                return
            }
            if let dataObj = try? JSONDecoder().decode(User.self, from: getdata ) {
                completion(dataObj)
            }
        }).resume()
    }
    
    class func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }

}
