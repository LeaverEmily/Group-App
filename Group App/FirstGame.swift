import Foundation
import UIKit

class FirstGame: UIViewController {
    
    var game: GameAnnotation!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    var target: Float = 0
    
    @IBAction func goButton(_ sender: UIButton) {
        let score = slider.value.rounded() - target
        numberLabel.text = "\(score)"
    
    func generateRandomNumber() {
        target = Float.random(in: 0...50).rounded()
        numberLabel.text = "\(slider.value)"

    }
    
        func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        let flake = #imageLiteral(resourceName: "flake")

            if let snowflake = snowflake {
                (view: view, particles: [flake: .white])
        self.view.layer.addSublayer(snowflake)
    
            }
            
        nameLabel.text = "Guess the number of snowflakes!"
        
        if slider.value == 0 {
            snowflake.isHidden = true
        
    }
        
    func motionEnded(_motion: UIEvent.EventSubtype, with event: UIEvent?) {
            generateRandomNumber()
            slider.value = slider.minimumValue
        }
        }
    }

}
