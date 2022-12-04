//
//  protocol.swift
//  2m6work2h
//
//  Created by Nazar Kydyraliev on 3/12/22.
//

import Foundation

//2. Создать протокол Товар
//Указать параметры - название, цена, срок годности, вес

protocol Product{
    var name: String {get set}
    var price: Int {get set}
    var expirationDate: Int {get set}
    var weight: Int {get set}
    var count: Int {get set}
}
