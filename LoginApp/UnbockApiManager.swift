import Foundation

class UnblockApiManager: NSObject {
    static let sharedInstance = UnblockApiManager()
    
    let baseURL = "https://unblock-backend.herokuapp.com/"
    
    func login(login: Com_Unblock_Proto_LoginRequest, completion: @escaping(_ loginResponse: Bool,_ token: String?) -> Void) {
        guard let loginURL = URL(string: baseURL + "login") else {
            print("Error: cannot create URL")
            completion(false, nil)
            return
        }
        
        var loginUrlRequest = URLRequest(url: loginURL)
        loginUrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON

        loginUrlRequest.httpMethod = "POST"
        
        do {
            loginUrlRequest.httpBody = try login.jsonUTF8Data();
        } catch {
            print("Error: cannot create JSON from login")
            completion(false, nil)
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: loginUrlRequest) {
            (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                completion(false, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(false, nil)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(false, nil)
                return
            }
            
            guard let token = httpResponse.allHeaderFields["Authorization"] as! String? else {
                completion(false, nil)
                return
            }
            
            completion(true, token)
        }
        task.resume()
    }
    
    func signUp(newUser: Com_Unblock_Proto_NewUserRequest, completion: @escaping(_ loginResponse: Bool,_ token: String?) -> Void) {
        guard let newUserURL = URL(string: baseURL + "newUser") else {
            print("Error: cannot create URL")
            completion(false, nil)
            return
        }
        
        var newUserUrlRequest = URLRequest(url: newUserURL)
        newUserUrlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        
        newUserUrlRequest.httpMethod = "POST"
        do {
            newUserUrlRequest.httpBody = try newUser.jsonUTF8Data()
        } catch {
            print("Error: cannot create JSON from login")
            completion(false, nil)
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: newUserUrlRequest) {
            (data, response, error) in
            print(response!.description)
            print(data!.description)
            guard error == nil else {
                print(error!.localizedDescription)
                completion(false, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(false, nil)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(false, nil)
                return
            }
            
            guard let token = httpResponse.allHeaderFields["Authorization"] as! String? else {
                completion(false, nil)
                return
            }
            
            completion(true, token)
        }
        task.resume()
        
    }

}
