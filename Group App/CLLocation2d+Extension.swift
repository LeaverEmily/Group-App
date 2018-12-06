import CoreLocation
import Firebase

extension CLLocationCoordinate2D {
    
    init(geopoint: GeoPoint) {
        self.init()
        self.latitude = geopoint.latitude
        self.longitude = geopoint.longitude
    }
    
}
