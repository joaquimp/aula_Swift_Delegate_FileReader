//
//  ViewController.swift
//  aula_Swift_Delegate_FileReader
//
//  Created by Joaquim Pessoa Filho on 27/04/20.
//  Copyright © 2020 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParserDelegate {
    func startDocument(fileName: String) {
        print("Startou \(fileName)")
    }

    func startElement(element: String) {
        print("Elemento \(element)")
    }

    func characters(text: String) {
        print("Texto \(text)")
    }

    func endElement(element: String) {
        print("Acabou \(element)")
    }

    func endDocument(fileName: String) {
        print("Acabou \(fileName)")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let parser = XMLParser()
        parser.delegate = self
        parser.startDocument(fileURL: Bundle.main.url(forResource: "input", withExtension: "xml")!)
    }


}

