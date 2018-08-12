//
//  CollectionChanged.swift
//  ObservableCollection
//
//  Created by Otero, Alex on 8/11/18.
//  Copyright © 2018 CertifiedNoob LLC. All rights reserved.
//

import Foundation


public struct CollectionChangedEvent{
	
	public let insertedIndices: [Int]
	public let deletedIndices: [Int]
	public let updatedIndices: [Int]
	
	init(inserted:[Int] = [], deleted: [Int] = [],updated:[Int] = []){
		assert(inserted.count + deleted.count + updated.count > 0)
		
		insertedIndices = inserted
		deletedIndices = deleted
		updatedIndices = updated
	}
}
