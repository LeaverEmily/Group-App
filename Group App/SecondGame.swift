import Foundation
import UIKit

class SecondGame: UIViewController {
    
    var activePlayer = 1 //cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    @IBAction func naughtButton(_ sender: UIButton) {
        
        if (gameState[sender.tag-1] == 0)
            
        {   if (activePlayer == 1) {
            sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
            activePlayer = 2
        }
        else { sender.setImage(UIImage(named: "naught.png"), for: UIControl.State())
            activePlayer = 1
      
            
        }
        
      }
    }

}

