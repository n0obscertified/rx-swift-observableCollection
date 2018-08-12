//
//  NotifyChanged+Extension.swift
//  ObservableCollection
//
//  Created by Otero, Alex on 8/11/18.
//  Copyright © 2018 CertifiedNoob LLC. All rights reserved.
//

import Foundation



extension NotifyChanged{
	
	func raiseChangeFor<A>(keyPath: AnyKeyPath, old:A, new:A) {
		let tuple = (keyPath, old as Any, new as Any)
		elementChanged.onNext(tuple)
	}
	
	func set<A>(keyPath: ReferenceWritableKeyPath<Self,A>, value: A)  {
		let old = self[keyPath: keyPath]
		self[keyPath: keyPath] = value
		raiseChangeFor(keyPath: keyPath,old:old, new:value)
	}
}


