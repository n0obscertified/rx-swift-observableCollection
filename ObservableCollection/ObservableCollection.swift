//
//  ObservableArray.swift
//  ObservableArray
//
//  Created by Otero, Alex on 7/13/18.
//  Copyright © 2018 CertifiedNoob LLC. All rights reserved.
//
import Foundation
import RxSwift

struct ObservableCollection<T> : ExpressibleByArrayLiteral where T: NotifyChanged {
	typealias arrayChangedType = (event:CollectionChangedEvent, element:[T])
	typealias collectionType = [T]
	internal var rx: PublishSubject<arrayChangedType>!
	internal var rxElements: collectionType
	internal var rxChangeType:[arrayChangedType]
	internal let disposeBag = DisposeBag()
	public init(){
		rx = PublishSubject<arrayChangedType>()
		rxElements = []
		rxChangeType = []
	}
	
	public init(count:Int, repeatedValue:T){
		rx = PublishSubject<arrayChangedType>()
		rxElements = Array(repeating: repeatedValue, count: count)
		rxChangeType =  [(CollectionChangedEvent(inserted:[1]),rxElements)]
	}
	
	public init<S: Sequence>(_ s: S) where S.Iterator.Element == T{
		rx = PublishSubject<arrayChangedType>()
		rxElements = Array(s)
		
		rxChangeType = [(event: CollectionChangedEvent(
							inserted:(0...rxElements.count).map {$0}),
							element: rxElements)]
		
		
	}
	
	public init(arrayLiteral elements: T...) {
		rxElements = elements
		rxChangeType = [(event: CollectionChangedEvent(
						inserted:(0...rxElements.count).map {$0}),
						element: rxElements)]
	}
}








