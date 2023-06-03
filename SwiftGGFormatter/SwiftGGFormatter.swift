//
//  main.swift
//  SwiftGGFormatter
//
//  Created by 朱浩宇 on 2023/6/3.
//

import Foundation
import SwiftGGFormater
import ArgumentParser

@main
struct SwiftGGFormatterCLI: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        .init(commandName: "SwiftGGFormatter")
    }

    @Argument(help: "Please provide the file path of the text you want to reorder.")
    var path: String

    mutating func run() async throws {
        let file = URL.init(filePath: path)
        let formater = SwiftGGFormater(file: file, web: URL(string: mapper[file.lastPathComponent]!)!)
        try await formater.formate()
    }
}
