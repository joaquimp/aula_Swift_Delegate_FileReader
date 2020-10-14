//
//  ViewController.swift
//  aula_Swift_Delegate_FileReader
//
//  Created by Joaquim Pessoa Filho on 27/04/20.
//  Copyright © 2020 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SaxParserDelegate {
    
    let parser = SaxParser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let fileURL = Bundle.main.url(forResource: "input", withExtension: "xml") {
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                parser.run(documento: text2)
            } catch {
                print(error)
            }
        } else {
            print("Erro - Arquivo não encontrado")
        }
    }
    
    func startDocument() {
        print("Inicio da leitura")
    }
    
    func endDocumet() {
        print("Fim da leitura")
    }
    
    func endElement(element: String) {
        print("Elemento fim \(element)")
    }
    
    func characters(text: String) {
        print("Texto \(text)")
    }
    
    func startElement(element: String) {
        print("Elemento início \(element)")
    }
}


protocol SaxParserDelegate: AnyObject {
    func startDocument()
    func startElement(element: String)
    func endElement(element: String)
    func characters(text: String)
    func endDocumet()
}

class SaxParser {
    weak var delegate: SaxParserDelegate?
    
    func run(documento: String) {
        delegate?.startDocument()
        
        // detectei um elemento <CD>
        delegate?.startElement(element: "CD")
        
        delegate?.endDocumet()
    }
}
