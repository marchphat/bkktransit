//
//  Queue.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 24/3/2567 BE.
//

import Foundation

struct Queue<T> {
    private var elements: [T] = []

    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }

    func peek() -> T? {
        return elements.first
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }
}
