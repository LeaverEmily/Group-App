import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to track the user location
        mapView.userTrackingMode = .follow
        mapView.delegate = self 
    
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        

        gameManager.loadPoints { [unowned self] in
            for game in self.gameManager.games {
                self.mapView.addAnnotation(game)
            }
        }
        
        
    }
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? FirstGame {
            destinationViewController.game = sender as? Game
        } // prepare the forward segue from viewcontroller to second viewcontroller
    }

    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        gameManager.updateDistance(from: location)
    }
    
}

extension ViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        guard let game = view.annotation as? Game else { return }
        guard game.active else { return }
        performSegue(withIdentifier: "snowflakes", sender: game)
    }
   
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?//return annotation view
    {
        
        guard let annotation = annotation as? Game else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        } //get the info part of button maybe???????
        
        view.markerTintColor = .orange  // change it back
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? Game else { return }
        print(annotation.active)
    }
    
    
}
