//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //library for interact with different hardware of the device (AudioVideo Foundation)

class ViewController: UIViewController {

    // we create a variable called player and we assigne it a new AV audio player
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        // Show "button pressed" in console
        //print("Button pressed")
        
        let button_title = sender.currentTitle!
        //print(button_title)
        
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Put here the code that has to be executed a 0.2 secs from now
            
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        playSound(sound_name:button_title)
        
    }
    
    // Create a function that can play sounds
    func playSound(sound_name:String) {
        /*
         // devo creare link alla mia risorsa, Bundle è semplicemente contenitore che rappre le risorse di una directory su disco, io gli sto passando una risorsa (se c'è, altrimenti return) e ci sto collegando un url
         // Bundle.main è lo spazio su disco riservato alla mia app, quindi vado a cercare lì
         guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
         
         do {
         try
         // AVAudioSession è un oggetto che comunica al mio hardware come voglio che venga riprodotto il suono
         // la categoria playback è per dire che la riproduzione di questo audio è importante per la nostra app, quindi anche se ho modalità silenzioso suonerà
         AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
         try AVAudioSession.sharedInstance().setActive(true)
         
         // qui stiamo creando un oggetto AudioPlayer collegato al mio url
         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
         
         // qui stiamo salvato il mio oggetto player nella variabile costante player (se c'è)
         guard let player = player else { return }
         
         // qui lanciamo il play sulla mia variabile player che contiene l'oggetto AVAudioPlayer che è collegato a quell'url che punta alle risorse app speficicate all'inizio nella variabile url
         player.play()
         
         } catch let error {
         print(error.localizedDescription)
         }
         }*/
        
        let url = Bundle.main.url(forResource: sound_name, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        // N.B. siccome non abbiamo settato la modalità qui, occhio che telefono deve essere in sonoro e non silenzioso per sentire il suono
    }
    
    

}

