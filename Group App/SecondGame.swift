import Foundation
import UIKit

class SecondGame: UIViewController {
    
    var activePlayer = 1 //cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4 , 8], [2, 4, 6]]
    var gameIsActive = true

    @IBAction func naughtButton(_ sender: UIButton) {
        
        if (gameState[sender.tag-1] == 0)
            
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1) {
            sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
            activePlayer = 2
        }
        else { sender.setImage(UIImage(named: "naught.png"), for: UIControl.State())
            activePlayer = 1
      
            
        }
        
      }
        
        for combination in winningCombinations
        {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if  gameState[combination[0]] == 1 {
               
            //cross has won
                print ("CROSS")
        }
            else {
            
            //nought has won
                print ("NAUGHT")
    }

    
}


}


}
    
    @IBAction func restartButton(_ sender: UIButton) {
       // gameState.remove(at: [0, 0, 0, 0, 0, 0, 0, 0, 0])
    }

}
