import Foundation
import UIKit

class FirstGame: UIViewController {
    
    var game: GameAnnotation!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    var target: Float = 0
    
    
    func generateRandomNumber() {
        target = Float.random(in: 0...50).rounded()
        numberLabel.text = "\(slider.value)"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        
        if slider.value == 0 {
            Snowflake.isHidden = true
        }
        
        
        nameLabel.text = "Guess the number of snowflakes!"
        
        override func motionEnded(_motion: UIEvent.EventSubtype, with event: UIEvent?) {
            generateRandomNumber()
            slider.value = slider.minimumValue
        }
        
        }
        
    }
    
    @IBAction func goButton(_ sender: UIButton) {
        let score = slider.value.rounded() - target
        numberLabel.text = "\(score)"
    }
}

