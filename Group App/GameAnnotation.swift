import Foundation
import CoreLocation
import MapKit
import Firebase

class GameAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var active = false
    var distance: CLLocationDistance = 1000
    var segueName: String
    
    var location: CLLocation {
        return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    init(document: QueryDocumentSnapshot) {
        
        let geopoint = document.data()["location"] as! GeoPoint
        self.coordinate = CLLocationCoordinate2D(geopoint: geopoint)
        self.title = document.data()["name"] as? String
        self.segueName = document.data()["segueName"] as! String
    }
    
    func updateDistance(_ userLocation: CLLocation) {
        distance = location.distance(from: userLocation)
        active = distance < 500
    }
    
}
