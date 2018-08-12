//
//  NotifyChanged.swift
//  ObservableCollection
//
//  Created by Otero, Alex on 8/11/18.
//  Copyright © 2018 CertifiedNoob LLC. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol NotifyChanged:class {
	
	func raiseChangeFor<A>(keyPath: AnyKeyPath, old:A, new:A)
	func set<A>(keyPath: ReferenceWritableKeyPath<Self, A>, value: A)
	var elementChanged: PublishSubject<(keyPath: AnyKeyPath, old:Any, new:Any)>{ get }
}
