//
//  ViewController.swift
//  Shake
//
//  Created by Tecnologias iis on 24/11/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake{
            let soundPath = Bundle.main.path(forResource: "loud_bang", ofType: "mp3")
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath!))
                player.play()
                
                let alert = UIAlertController(title: "Bang!", message: "UN balazo para el enemigo", preferredStyle: .alert)
                let ac1 = UIAlertAction(title: "OK", style: .default)
                alert.addAction(ac1)
                self.present(alert, animated: true)
            }catch {
                let alert = UIAlertController(title: "No Bang!", message: "Ocurrio un error al reproducir el sonido", preferredStyle: .alert)
                let ac1 = UIAlertAction(title: "OK", style: .default)
                alert.addAction(ac1)
                self.present(alert, animated: true)
            }
        }
    }


}

