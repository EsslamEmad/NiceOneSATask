//
//  APIResponse.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 6/10/21.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let success: Int
    let error: [String]
    let data: T
}


