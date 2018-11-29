import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
     //print "fuck"
    
    let locationManager = CLLocationManager()
    let treasureManager = TreasureManager()
    //decalarations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      locationManager.requestAlwaysAuthorization()
      locationManager.delegate = self //viewcontroller now allowed to use the location manager information
      locationManager.startUpdatingLocation()
        
      for treasure in treasureManager.treasures {
            locationManager.startMonitoring(for: treasure.region)
            mapView.addAnnotation(treasure)
      } // add the annotation for the treasure, start monitoring user coordinates to see if they've enter a region, once in region drop a pin - specifically for when the user is in the region
        
    }


}
//sup 
