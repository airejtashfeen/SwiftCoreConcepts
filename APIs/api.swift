import UIKit

struct RandomUser: Codable{
    let results: [User]
}

struct User: Codable {
    var gender: String
    var name: Name
    var email: String
    var phone: String
    var cell: String
    var picture: Picture
}

struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

func fetchRandomUser(){
    guard let link = URL(string:"https://randomuser.me/api/") else{
        print("Invalid response")
        return
    }
    
    let request = URLRequest(url: link)
    
    URLSession.shared.dataTask(with: request){
        data, response, error in
        
        if let error = error{
            print("Network Error")
            return
        }
        
        guard let data = data else{
            print("No data received")
            return
        }
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(RandomUser.self, from: data)
            
            if let user = decodedData.results.first{
                DispatchQueue.main.async{
                    print("Name:\(user.name.title) \(user.name.first) \(user.name.last)")
                }
            }
        }
        catch{
            print("Decoding error: \(error)")
        }
        
    }.resume()
}

fetchRandomUser()
