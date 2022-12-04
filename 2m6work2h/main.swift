//
//  main.swift
//  2m6work2h
//
//  Created by Nazar Kydyraliev on 3/12/22.
//

import Foundation

var foodBread = Food(count: 4, name: "Хлеб", price: 20, expirationDate: 2022, weight: 250)
var foodFish = Food(count: 10, name: "Рыба", price: 350, expirationDate: 2022, weight: 2000)
var foodMilk = Food(count: 123, name: "Молоко", price: 55, expirationDate: 2023, weight: 1000)
var foodPotatoes = Food(count: 40, name: "Картошка", price: 140, expirationDate: 2023, weight: 10000)
var foodTomato = Food(count: 24, name: "Помидор", price: 350, expirationDate: 2023, weight: 5000)


var water = Drink(count: 23, name: "Вода", price: 30, expirationDate: 2023, weight: 1000)
var cola = Drink(count: 5, name: "КокаКола", price: 70, expirationDate: 2023, weight: 500)
var vodka = Drink(count: 33, name: "Водка", price: 450, expirationDate: 2035, weight: 700)
var whiskey = Drink(count: 34, name: "Виски", price: 10000, expirationDate: 2040, weight: 1000)
var beer = Drink(count: 54, name: "Пиво", price: 150, expirationDate: 2023, weight: 1500)


var vanish = SoapWasher(count: 43, name: "Ваниш", price: 450, expirationDate: 2024, weight: 5000)
var tide = SoapWasher(count: 41, name: "Тайд", price: 535, expirationDate: 2025, weight: 3000)
var komet = SoapWasher(count: 32, name: "Комет", price: 150, expirationDate: 2024, weight: 750)
var shampoo = SoapWasher(count: 84, name: "Шампунь", price: 175, expirationDate: 2022, weight: 250)
var soap = SoapWasher(count: 49, name: "Мыло", price: 100, expirationDate: 2022, weight: 50)

var tv = Technics(count: 13, name: "ТВ", price: 17000, expirationDate: 2032, weight: 4000)
var sony = Technics(count: 24, name: "СониПлейстейшен", price: 35000, expirationDate: 2028, weight: 3500)
var pc = Technics(count: 44, name: "ПК", price: 75000, expirationDate: 2035, weight: 10000)
var macBook = Technics(count: 84, name: "Макбоок", price: 103000, expirationDate: 2050, weight: 2300)
var phone = Technics(count: 54, name: "Телефон", price: 76000, expirationDate: 2027, weight: 1350)


var products: [Product] = [foodFish, foodMilk, foodBread, foodTomato, foodPotatoes, water, cola, vodka, whiskey, beer, vanish, tide, komet, shampoo, soap, tv, sony, pc, macBook, phone]
var totalProducts = [Product]()

func checkProducts(name: String, count: Int) -> Bool{
    var returnBool = false
    for product in products {
        if name == product.name{
            if count <= product.count{
               returnBool = true
            }
        }
    }
    return returnBool
}

func addProduct(){
    print("Куда будем отправлять? Турция, США, Франция")
    let country = readLine()!
    print("Ваше имя:")
    let name = readLine()!
    print("Ваше фамилия:")
    let surname = readLine()!
    var text = "\nВыбери из: "
    for product in products {
        text += "\(product.name ), "
    }
    print("\(text)\n")
    
    while true{
        print("Что выберешь?")
        let chooseProduct = readLine()!
        print("Сколько штук?")
        let chooseCount = readLine()!
        
        for (index,addChooseProduct) in products.enumerated(){
            if chooseProduct.lowercased() == addChooseProduct.name.lowercased(){
                if addChooseProduct is Food{
                    totalProducts.append(Food(count: Int(chooseCount)!, name: addChooseProduct.name, price: addChooseProduct.price, expirationDate: addChooseProduct.expirationDate, weight: addChooseProduct.weight))
                    
                } else if addChooseProduct is Drink{
                    totalProducts.append(Drink(count: Int(chooseCount)!, name: addChooseProduct.name, price: addChooseProduct.price, expirationDate: addChooseProduct.expirationDate, weight: addChooseProduct.weight))
                }else if addChooseProduct is SoapWasher{
                    totalProducts.append(SoapWasher(count: Int(chooseCount)!, name: addChooseProduct.name, price: addChooseProduct.price, expirationDate: addChooseProduct.expirationDate, weight: addChooseProduct.weight))
                }else if addChooseProduct is Technics{
                    totalProducts.append(Technics(count: Int(chooseCount)!, name: addChooseProduct.name, price: addChooseProduct.price, expirationDate: addChooseProduct.expirationDate, weight: addChooseProduct.weight))
                }
                products[index].count -= Int(chooseCount)!
                break
            }
        }
        print("Дальше заказываем? да / нет")
        let stopWhile = readLine()!
        if stopWhile == "нет"{
            break
        }
        
    }
    
    print("\nВаш список товаров:")
    for (_, name) in totalProducts.enumerated(){
        print("Товар - \(name.name), количество - \(name.count)")
    }
    
    var sumDelivery = 0
    if country.lowercased() == "турция"{
        sumDelivery += 5000
    } else if country.lowercased() == "франция"{
        sumDelivery += 10000
    } else if country.lowercased() == "сша"{
        sumDelivery += 20000
    }
    
    var sumOrder = 0
    for sumTotal in totalProducts{
        sumOrder += sumTotal.price
    }
    
    let totalSum = sumOrder + sumDelivery
    
    let hour = Int.random(in: 0 ..< 24)
    let min = Int.random(in: 0 ..< 60)
    
    let day = Int.random(in: 1...31)
    let month = Int.random(in: 1...12)
    
    let timeDelivery = Int.random(in: 10...30)
    let grade = Int.random(in: 1...10)
    print("\nВаш заказ был принят. \nСтрана отправки: \(country.uppercased())\nВаше имя: \(name)\nВаша фамилия: \(surname)")
    print("Дата заказа: \(day).\(month).2022. Время заказа: \(hour):\(min). Примерное время доставки: \(timeDelivery) дней.")
    print("\nЦена за доставка: \(sumDelivery) сом.\nСумма товаров: \(sumOrder) сом.\nОбщая сумма: \(totalSum) сом.")
    print("\nВаша оценка: \(grade) из 10")
    
}

addProduct()

