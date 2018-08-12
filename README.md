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

This protocol really only has one thing of note and that this the  generic set method that can be used as below.

```swift
final class something:NotifyChanged { //any class that inherits this must be a final class probably because im still a n0_ob
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
			print(event.element?.event.updatedIndeces.count)
		}
		
		var elements = something(string: "", int: 0, money: 0.0)
		
		t.append(elements)
		elements.set(keyPath: \something.money, value: 100) /// you can use the set method to set any variable in your class this method emits an event on the obeservable collection letting the subscriber that an element in the observable collection has changed.
        ///
		t.append(something(string: "", int: 0, money: 100.0))
		t[1].money = 0 // or set the class directly.

```