//
//  ViewController.swift
//  pokedex
//
//  Created by Cameron Hurt on 11/12/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonTextfield: UITextField!

    
    @IBOutlet weak var pokemonTextView: UITextView!
    
    //Base URL for request
    let pokeAPIBaseURL = "https://pokeapi.co/api/v2/pokemon/"
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        //Dissmissing keyboard
        pokemonTextfield.resignFirstResponder()
       
        
        //Checking to make sure both textfields have values
        guard let pokemon = pokemonTextfield.text
             else {
                return
        }
        //clearing out textfield
        pokemonTextfield.text = ""
       
        
        //Clearing up the URL so the computer can read it
        let pokemonURL = pokemon.replacingOccurrences(of: " ", with: "")
        
       
        
        //Building our complete request URL
        let requestURL = pokeAPIBaseURL + pokemonURL + "/"
        
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.pokemonTextView.text = json.rawString()
                
            case .failure(let error):
                self.pokemonTextView.text = "Invalid selection entered or an error occured. Please Try Again!"
                print(error.localizedDescription)
            }
            
            
        }
        
        
    }
    
}
