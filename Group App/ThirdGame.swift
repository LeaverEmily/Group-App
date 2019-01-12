import Foundation
import UIKit

class ThirdGame: UIViewController {
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    let imageNames = ["ChristmasTree", "Santa", "Snowman", "Rudolf"]
    
    
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        func randomImage() -> UIImage {
            let unsignedArrayCount = UInt32(imageNames.count)
            let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            let randomNumber = Int(unsignedRandomNumber)
            return UIImage(named: imageNames[randomNumber])!
            
            
        }
        
        
        
     // imageView.image =  imageNames.randomImage() 
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func correctButton(_ sender: UIButton) {
        
        // if correctButton == (imageView){
        //   let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        //  alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        //    NSLog("The \"OK\" alert occured.")
        //     }))
        //     self.present(alert, animated: true, completion: nil)
        //  }
    }
    @IBAction func firstIncorrectButton(_ sender: Any) {
    }
    
    @IBAction func secondIncorrectButton(_ sender: Any) {
    }
    
    @IBAction func thirdIncorrectButton(_ sender: Any) {
    }
    
    //let imageView = ["snowman.png"]
    //var random = arc4random_uniform(3) //returns 0 to 2 randomly
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // imageView.image = UIImage(named: "Image\(arc4random_uniform(3) + 1).png")
        
        //generateRandomImage()
    }
    
    //func generateRandomImage() {
    // var guess = UIImage(named: "Christmas Tree", "Rudolf", "Santa", "Snowman")
    //var imageView = UIImageView(image: christmasTree, Rudolf, Santa, Snowman)
    
    //}
}
