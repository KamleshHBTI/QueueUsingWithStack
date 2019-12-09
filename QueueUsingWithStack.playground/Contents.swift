/*
 First-in first-out queue (FIFO)
 
 New elements are added to the end of the queue. Dequeuing pulls elements from
 the front of the queue.



A queue can be implemented using two stacks. Let queue to be implemented be q and stacks used to implement q be stack1 and stack2.
*/



import UIKit
import Foundation

public struct Stack1<T> {
    var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count:Int {
        return array.count
    }
    
    public mutating func push(_ element:T){
        array.append(element)
    }
    public mutating func pop() -> T{
       return  array.popLast()!
    }
    
    public var top:T? {
        return array.last
    }
    
}

struct Stack2<T>{
    var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count:Int {
        return array.count
    }
    
    public mutating func push(_ element:T){
        array.append(element)
    }
    public mutating func pop() -> T{
        return array.popLast()!
    }
    
    public var top:T? {
        return array.last
    }
}

struct QueueWithStack<T> {
    var stack1 = Stack1<T>()
    var stack2 = Stack2<T>()
    
    mutating func enQueue(_ element:T) {
        if stack1.isEmpty {
            self.stack1.push(element)
        }else {
            while !stack1.isEmpty {
                self.stack2.push(self.stack1.pop())
            }
            self.stack1.push(element)
            while !stack2.isEmpty {
                self.stack1.push(self.stack2.pop())
            }
        }
        print("stack1 is: ", stack1.array)
        print("stack2 is", stack2.array)
    }
    
     mutating func deQueue()->T? {
        if stack1.isEmpty {
           return nil
        }else {
           return  stack1.pop()
        }
        print("stack1 is: ",stack1.array)
        print("stack2 is" ,stack2.array)
    }
}

var queue = QueueWithStack<Int>()
queue.enQueue(1)
queue.enQueue(2)
queue.enQueue(3)
print(queue.deQueue())
print(queue.stack1)
print(queue.deQueue())
print(queue.stack1)
