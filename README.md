# rx-swift-observableCollection
Observable Collection With A NotifyChanged Elelement


# Observable Collection

This observable collection works just likes any other providing collection changed events on insertions and deletions. Where this differs is that each element must implement the NotifyChanged protocol discussed below.

# NotifyChanged Protocol

```swift
protocol NotifyChanged: class {
	func raiseChangeFor<A>(keyPath: AnyKeyPath, old:A, new:A)
	func set<A>(keyPath: ReferenceWritableKeyPath<Self, A>, value: A)
	var elementChanged: PublishSubject<(keyPath: AnyKeyPath, old:Any, new:Any)>{ get }
    }
```