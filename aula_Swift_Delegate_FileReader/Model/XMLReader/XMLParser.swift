//
//  XmlParser.swift
//  aula_Swift_Delegate_FileReader
//
//  Created by Pedro Giuliano Farina on 27/04/20.
//  Copyright © 2020 Joaquim Pessoa Filho. All rights reserved.
//

import Foundation

public class XMLParser {
    private static let xmlQueue = DispatchQueue(label: "MyXMLParser")
    init() {
    }

    weak var delegate: ParserDelegate?

    public private(set) var currentDocument: String? {
        willSet {
            if let value = currentDocument {
                delegate?.endDocument(fileName: value)
            }
        }
        didSet {
            if let value = currentDocument {
                delegate?.startDocument(fileName: value)
            }
        }
    }

    func startDocument(fileURL: URL) -> Bool {
        currentDocument = fileURL.lastPathComponent
        do {
            let text = try String(contentsOf: fileURL, encoding: .utf8)
            XMLParser.xmlQueue.async {
                self.readDocument(text: text)
            }
        } catch {
            return false
        }
        return true
    }

    private func readDocument(text: String) {
        let lines = text.split(separator: "\n")
        for line in lines {
            var cut = line.split(separator: ">")
            let element: String
            if !cut.isEmpty {
                var sub = cut.removeFirst()
                _ = sub.popFirst()

                let action: ((String) -> Void)?
                if sub.first == "/" {
                    _ = sub.popFirst()
                    action = delegate?.endElement(element:)
                } else {
                    action = delegate?.startElement(element:)
                }
                element = String(sub)
                action?(element)
            } else {
                element = ""
            }


            if !cut.isEmpty {
                let dirtyCharacters = cut.removeFirst()
                let cut2 = dirtyCharacters.split(separator: "<")
                delegate?.characters(text: String(cut2.first ?? ""))
                delegate?.endElement(element: element)
            }
        }
        currentDocument = nil
    }
}
