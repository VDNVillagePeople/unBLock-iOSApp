import Foundation
import UIKit

class BlockService: NSObject {
    static let sharedInstance = BlockService()
    
    let baseURL = "http://localhost:8080/"
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.orange, UIColor.magenta, UIColor.purple, UIColor.yellow]
    
    func getBlocks(completion: @escaping(_ blocks: [Block]) -> Void) {
        guard let URL = URL(string: baseURL + "neighborhood/1") else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: URL)
        urlRequest.httpMethod = "GET"
        
        
        let keychain = KeychainSwift()
        let token = keychain.get(LoginViewController.LOGIN_TOKEN)
        
        guard token != nil else {
            print("Token not set")
            return
        }
        
        urlRequest.addValue(token!, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Response error")
                print(response)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Status code")
                print(httpResponse.statusCode)
                print(httpResponse)
                return
            }
            
            let neighborhood = try? Com_Unblock_Proto_Neighborhood(serializedData: data!)

            var blocks: [Block] = []
            for block in neighborhood!.blocks {
                let newBlock = Block(block: block)
                newBlock.set(color: self.getRandomColor())
                blocks.append(newBlock)
            }
            
            completion(blocks)
        }
        task.resume()
        
    }
    
    private func getRandomColor() -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(colors.count)))]
    }
}
