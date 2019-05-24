//
//  DropReceiverView.swift
//  Shellpad
//
//  Created by Morten Just Petersen on 10/30/15.
//  Copyright © 2015 Morten Just Petersen. All rights reserved.
//

import Cocoa

protocol DropDelegate {
    func dropDragEntered(_ filePath:String)
    func dropDragPerformed(_ filePath:String)
    func dropDragExited()
    func dropUpdated(_ mouseAt:NSPoint)
}

class DropReceiverView: NSView {
    
    var delegate:DropDelegate?
    var testVar = "only you can see this";
    
    func removeBackgroundColor(){
        layer?.backgroundColor = NSColor.clear.cgColor
        }
    
    func addBackgroundColor(){
        layer?.backgroundColor = NSColor(red:0.267, green:0.251, blue:0.290, alpha:1).cgColor
        }
    
    func setup(){
        wantsLayer = true
        let fileTypes = [
            "public.data"
        ]
        registerForDraggedTypes(convertToNSPasteboardPasteboardTypeArray(fileTypes));
    }
    //https://developer.apple.com/library/mac/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        
        //        Swift.print("HELLO \(getPathFromBoard(sender.draggingPasteboard()))")
        let path = getPathFromBoard(sender.draggingPasteboard)
        delegate?.dropDragEntered(path)
        addBackgroundColor()
        return NSDragOperation.copy
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return true
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        delegate?.dropUpdated(sender.draggingLocation)
        return NSDragOperation.copy
    }
    override func draggingExited(_ sender: NSDraggingInfo?) {
        removeBackgroundColor()
        delegate?.dropDragExited()
    }
    
    override func concludeDragOperation(_ sender: NSDraggingInfo?) {
        let path = getPathFromBoard((sender?.draggingPasteboard)!)
        Swift.print("path is \(path)")
        removeBackgroundColor()
        delegate?.dropDragPerformed(path)
    }
    
    func getPathFromBoard(_ board:NSPasteboard) -> String {
        return (NSURL.init(from: board)?.path)!
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSPasteboardPasteboardTypeArray(_ input: [String]) -> [NSPasteboard.PasteboardType] {
	return input.map { key in NSPasteboard.PasteboardType(key) }
}
