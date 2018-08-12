//
//  ObservableCollectionTests.swift
//  ObservableCollectionTests
//
//  Created by Otero, Alex on 7/13/18.
//  Copyright © 2018 CertifiedNoob LLC. All rights reserved.
//

import XCTest
import RxSwift
@testable import ObservableCollection

class ObservableCollectionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
		final class something:NotifyChanged{
			var elementChanged: PublishSubject<(keyPath: AnyKeyPath, old: Any, new: Any)>
			
			var string:String
			var int:Int
			var money: Double
			init(string:String,int:Int, money:Double) {
				self.string = string
				self.int = int
				
				self.money = money
				
				
				elementChanged = PublishSubject<(keyPath: AnyKeyPath, old: Any, new: Any)>()
			}
		}
		var t = ObservableCollection<something>()
		
		
		t.rx.subscribe { (event) in
			print(event.element?.event.updatedIndices.count)
		}
		
		var elements = something(string: "", int: 0, money: 0.0)
		
		t.append(elements)
		elements.set(keyPath: \something.money, value: 100)
		t.append(something(string: "", int: 0, money: 100.0))
		t[1].money = 0

        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	
	
}
