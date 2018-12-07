import Foundation
import UIKit

class SecondGame: UIViewController {
    
    var activePlayer = 1 //cross

    @IBAction func naughtButton(_ sender: UIButton) {
        if (activePlayer == 1) {
            sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
            activePlayer = 2
        }
        else { sender.setImage(UIImage(named: "naught.png"), for: UIControl.State())
            activePlayer = 1
            
        }
        
      }
    }

