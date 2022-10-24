
import UIKit

class ViewController: UIViewController {
   
    let eggTimes = ["Soft": 3,"Medium": 4,"Hard": 7]
    var timer=Timer()
    var totalTime=0
    var secondsPassed=0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress=0.0
        let hardness=sender.currentTitle!
        titleLabel.text=hardness
        secondsPassed=0
        totalTime=eggTimes[hardness]!
        timer=Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if secondsPassed <= totalTime {
            
            
            secondsPassed += 1
            let percentageProgress=Float(secondsPassed)/Float(totalTime)
        }
        else{
            timer.invalidate()
            titleLabel.text="Done!"
        }
    }
    
}
