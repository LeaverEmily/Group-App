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
                print(game.segueName)
            }
        }
        
        
    }
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOne"{}
        else if segue.identifier == "gameTwo"{}
        else if segue.identifier == "gameThree"{}
        } // prepare the forward segue from viewcontroller to second viewcontroller
}



//if let destinationViewController = segue.destination as? FirstGame {
   // destinationViewController.game = sender as? Game
    


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        gameManager.updateDistance(from: location)
    }
    
}

extension ViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        guard let game = view.annotation as? GameAnnotation else { return }
        guard game.active else { return }
        performSegue(withIdentifier: game.segueName, sender: game)
    }
   
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?//return annotation view
    {
        
        guard let annotation = annotation as? GameAnnotation else { return nil }
        
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
        guard let annotation = view.annotation as? GameAnnotation else { return }
        print(annotation.active)
    }
    
    
}
