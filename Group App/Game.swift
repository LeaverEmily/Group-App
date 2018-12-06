import Foundation
import CoreLocation
import MapKit
import Firebase

class Game: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
//    let region: CLCircularRegion
    var active = false
    
    
    init(document: QueryDocumentSnapshot) {
        
        let geopoint = document.data()["location"] as! GeoPoint
        self.coordinate = CLLocationCoordinate2D(geopoint: geopoint)
        self.title = document.data()["name"] as? String
//        region = CLCircularRegion(center: coordinate, radius: 200, identifier: title)
    }
    
}
