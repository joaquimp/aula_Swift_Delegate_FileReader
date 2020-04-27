//
//  ParserDelegate.swift
//  aula_Swift_Delegate_FileReader
//
//  Created by Pedro Giuliano Farina on 27/04/20.
//  Copyright © 2020 Joaquim Pessoa Filho. All rights reserved.
//

public protocol ParserDelegate: AnyObject {
    func startDocument(fileName: String)
    func startElement(element: String)
    func characters(text: String)
    func endElement(element: String)
    func endDocument(fileName: String)
}
