import Foundation
import UIKit

    
    var activeGame = true
    var playingPlayer = 1 //X
    var placeState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombo = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    class SecondGame: UIViewController{
        
        @IBOutlet var winLabel: UILabel!
        @IBOutlet var playBtn: UIButton!
        @IBAction func playAgain(_ sender: AnyObject) {
            activeGame = true
            placeState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            playingPlayer = 1
            for i in 1..<10 {
                
                if let button = view.viewWithTag(i) as? UIButton {
                    
                }
            }
        }
    
    
}

