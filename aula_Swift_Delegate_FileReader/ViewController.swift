//
//  ViewController.swift
//  aula_Swift_Delegate_FileReader
//
//  Created by Joaquim Pessoa Filho on 27/04/20.
//  Copyright © 2020 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let fileURL = Bundle.main.url(forResource: "input", withExtension: "xml") {
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print(text2)
            } catch {
                print(error)
            }
        } else {
            print("Erro - Arquivo não encontrado")
        }
    }


}

