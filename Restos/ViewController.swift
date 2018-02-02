//
//  ViewController.swift
//  Restos
//
//  Created by Apple on 31/01/2018.
//  Copyright © 2018 iZu Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
	
	@IBOutlet weak var nameField: UITextField!
	
	@IBOutlet weak var streetNbField: UITextField!
	@IBOutlet weak var streetField: UITextField!
	@IBOutlet weak var zipCodeField: UITextField!
	@IBOutlet weak var cityField: UITextField!
	
	@IBOutlet weak var styleSegmentedControl: UISegmentedControl!
	
	@IBOutlet weak var averagePrice: UITextField!
	
	@IBOutlet weak var isVisitedSwitch: UISwitch!
	
	
	@IBOutlet weak var notationLabel: UILabel!
	@IBOutlet weak var notationStepper: UIStepper!
	@IBOutlet weak var notationResult: UILabel!
	
	@IBOutlet var itemsToHide: [UIView]!
	
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion:  nil)
            
        
    }
    var library = Library()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		configureSegmentedControl()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	fileprivate func configureSegmentedControl() {
		
		styleSegmentedControl.removeAllSegments()
		for style in Restaurant.RestaurantStyle.all {
			let count = styleSegmentedControl.numberOfSegments
			styleSegmentedControl.insertSegment(withTitle: style.rawValue, at:count, animated: false)
			styleSegmentedControl.selectedSegmentIndex = count
		}
	}

	
	@IBAction func visitedBtn(_ sender: UISwitch ) {
		for v in itemsToHide {
			v.isHidden = !sender.isOn
		}
	}
	
	@IBAction func notationBtn(_ sender: UIStepper) {
		let value = sender.value
		let intValue = Int(value)
		notationResult.text = "\(intValue)"
	}
	
    
    @IBAction func SaveBtn(_ sender: UIButton) {

		guard let name = nameField.text, name.count > 2 else { return }

		guard let streetNb = streetNbField.text else { return }
		guard let streetName = streetField.text else { return }
		guard let zipCode = zipCodeField.text else { return }
		guard let city = cityField.text else  {return }

		let address = "\(streetNb)  \(streetName)  \(zipCode)  \(city)"

		let index = styleSegmentedControl.selectedSegmentIndex
		let style = Restaurant.RestaurantStyle.all[index]

		guard let averagePriceStr = averagePrice.text, !averagePriceStr.isEmpty, let mediumPrice = Int(averagePriceStr) else { return }
		

		let isVisited = isVisitedSwitch.isOn
		
		guard let notationStr = notationResult.text, let notation = Int(notationStr) else { return }
		
		let newResto = Restaurant(name: name, address: address, style: style, mediumPrice: mediumPrice, notation: notation, isVisited: isVisited)

		library.add(newResto)
		
		print(newResto)
    }
	
	
    
}

