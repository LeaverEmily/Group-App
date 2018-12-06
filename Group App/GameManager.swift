import Foundation
import CoreLocation
import Firebase

class GameManager{
    
    var games = [Game]()
    
    init(){
        
//        let gameOneCoordinate = CLLocationCoordinate2D(latitude: 50.727023, longitude: -1.863535)
//        let gameOneGame = Game(coordinate: gameOneCoordinate, title: "Train Station")
//        games.append(gameOneGame)
//
//        let gameTwoCoordinate = CLLocationCoordinate2D(latitude: 50.720034, longitude: -1.879796)
//        let gameTwoGame = Game(coordinate: gameTwoCoordinate, title: "Square")
//        games.append(gameTwoGame)
//
//        let gameThreeCoordinate = CLLocationCoordinate2D(latitude: 50.715272, longitude: -1.875261)
//        let gameThreeGame = Game(coordinate: gameThreeCoordinate, title: "Pier")
//        games.append(gameThreeGame)
        
        
    }
    
    func loadPoints(completion: @escaping () -> ()) {
        let ref = Firestore.firestore().collection("locations")
        ref.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            for document in snapshot.documents {
                let newPoint = Game(document: document)
                self.games.append(newPoint)
            }
            completion()
        }
    }
    
    
    func getGame(by name: String) -> Game? {
        return games.first() {$0.title == name}
    }
    
    func updateDistance(from location: CLLocation) {
        for game in games {
            game.updateDistance(location)
            
            
        }
    }
    
}
