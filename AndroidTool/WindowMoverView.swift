//
//  WindowMoverView.swift
//  AndroidTool
//
//  Created by Morten Just Petersen on 11/12/15.
//  Copyright © 2015 Morten Just Petersen. All rights reserved.
//

import Cocoa

class WindowMoverView: NSView {
    
    override func registerForDraggedTypes(_ newTypes: [NSPasteboard.PasteboardType]) {
// Local variable inserted by Swift 4.2 migrator.
let newTypes = convertFromNSPasteboardPasteboardTypeArray(newTypes)

        Swift.print("$$ registering")
        let fileTypes = [
            ".apk"
        ]
        registerForDraggedTypes(convertToNSPasteboardPasteboardTypeArray(fileTypes));
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        Swift.print("dragging entered")
        return NSDragOperation.copy
    }
    
    override func acceptsFirstMouse(for theEvent: NSEvent?) -> Bool {
        return true
    }
    
    override var acceptsFirstResponder: Bool {
        return true
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override var mouseDownCanMoveWindow:Bool {
        return true
    }
    
    override func mouseUp(with theEvent: NSEvent) {
        Swift.print("mouse up windowmoverview")
        super.mouseUp(with: theEvent)
    }
    
    override func mouseEntered(with theEvent: NSEvent) {
        Swift.print("mouse entered windowmoverivew")
        super.mouseEntered(with: theEvent)
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSPasteboardPasteboardTypeArray(_ input: [NSPasteboard.PasteboardType]) -> [String] {
	return input.map { key in key.rawValue }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSPasteboardPasteboardTypeArray(_ input: [String]) -> [NSPasteboard.PasteboardType] {
	return input.map { key in NSPasteboard.PasteboardType(key) }
}
