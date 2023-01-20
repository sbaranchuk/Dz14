//
//  Model.swift
//  Dz14
//
//  Created by Admin on 18/01/2023.
//

import UIKit

struct CellContent: Hashable {
    var image: String
    var title: String
    var counter: String?
    var withHearth: Bool?
    var withLock: Bool?
}

extension CellContent {
    static var cells: [[CellContent]] = [
        [
            CellContent(image: "photo1", title: "Recents", counter: "338"),
            CellContent(image: "photo2", title: "Favourites", counter: "4", withHearth: true),
            CellContent(image: "photo3", title: "My Family", counter: "38"),
            CellContent(image: "photo4", title: "Other", counter: "27"),
            CellContent(image: "photo5", title: "Other2", counter: "58"),
            CellContent(image: "photo6", title: "Work", counter: "88"),
            CellContent(image: "photo7", title: "Gym", counter: "0"),
            CellContent(image: "photo7", title: "My diet", counter: "199"),
            CellContent(image: "photo8", title: "fdfsdf", counter: "5"),
            CellContent(image: "photo9", title: "freww", counter: "1"),
            CellContent(image: "photo10", title: ".", counter: "10")
        ],
        [
            CellContent(image: "video", title: "Videos", counter: "29"),
            CellContent(image: "person.crop.square", title: "Selfies", counter: "14"),
            CellContent(image: "livephoto", title: "Live Photos", counter: "1"),
            CellContent(image: "cube", title: "Portrait", counter: "1"),
            CellContent(image: "camera.metering.center.weighted", title: "Screenshots", counter: "63"),
            CellContent(image: "record.circle", title: "Screen Recordings", counter: "1")
        ],
        [
            CellContent(image: "square.and.arrow.down", title: "Imports", counter: "14"),
            CellContent(image: "square.stack.3d.down.right", title: "Duplicates", counter: "14"),
            CellContent(image: "eye.slash", title: "Hidden", withLock: true),
            CellContent(image: "questionmark", title: "Recently Deleted", withLock: true)
        ]
    ]
}
