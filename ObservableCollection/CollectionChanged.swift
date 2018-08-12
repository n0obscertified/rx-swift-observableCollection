//
//  CollectionChanged.swift
//  ObservableCollection
//
//  Created by Otero, Alex on 8/11/18.
//  Copyright © 2018 CertifiedNoob LLC. All rights reserved.
//

import Foundation


public struct CollectionChangedEvent{
	
	public let insertedIndeces: [Int]
	public let deletedIndeces: [Int]
	public let updatedIndeces: [Int]
	
	init(inserted:[Int] = [], deleted: [Int] = [],updated:[Int] = []){
		assert(inserted.count + deleted.count + updated.count > 0)
		
		insertedIndeces = inserted
		deletedIndeces = deleted
		updatedIndeces = updated
	}
}
