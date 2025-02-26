
import UIKit


struct GitHubUser: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let userViewType: String
    let siteAdmin: Bool
}
/*:
### Create create a function that will retrieve the data
*/
func getJSON(){
    guard let link = URL(string:"https://api.github.com/users/TwoStraws/followers") else{
        return
    }
    
    let request = URLRequest(url:link)
    
    URLSession.shared.dataTask(with: request){ (data, response, error) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else{
            return
        }
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode([GitHubUser].self, from: data) else{
            fatalError("Could not convert JSON into data")
        }
        
        let followers = decodedData
        
        for follower in followers{
            print(follower.login)
        }
    } .resume()
}

getJSON()
