//
//  Restaurant.swift
//  Restos
//
//  Created by Apple on 01/02/2018.
//  Copyright © 2018 iZu Corp. All rights reserved.
//

import Foundation


struct Route{
	
}

struct Restaurant: Equatable {
	
	enum RestaurantStyle: String {
		case chinese
		case japanese
		case burger
		case pizza
		case other
		
		static var all: [RestaurantStyle] {
			return [.chinese, .japanese, .burger, .pizza, .other]
		}
	}
	
	static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
		if lhs.name == rhs.name && lhs.address == rhs.address {
			return true
		}
		
		return false
	}
	
	
	let name: String
	let address: String
	let style: RestaurantStyle
	
	var mediumPrice: Int
	var notation: Int
	var isVisited: Bool
	
	func findRoute() -> Route {
		//currentPosition
		return Route()
	}
}


class Library {
	
	static let instance = Library()
	
	private init(){
		restaurants = []
	}
	
	private var restaurants: [Restaurant] = []
	// ou var restaurant = [Restaurant]()
	// ou var restaurants: Array<Restaurant> = []
	// ou var restaurants = Array<Restaurant>()
	
	func add(_ resto: Restaurant) {
		restaurants.append(resto)
	}
	
	//    func list() -> [Restaurant] {
	//        return restaurants
	//    }
	
	// Computed property get-only
	var allRestaurants: [Restaurant] {
		return restaurants
	}
	
	func remove(_ r: Restaurant){
		//trouver l'index
		if let index = restaurants.index(of: r) {
			restaurants.remove(at: index)
		}
	}

	
}
