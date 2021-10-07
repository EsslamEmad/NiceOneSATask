//
//  HTTPHeaders.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 6/10/21.
//

import Foundation
import Alamofire

class Defaults{
    static let HTTPHeaders: HTTPHeaders = ["Authorization": authorizationToken,
                                           "X-Oc-Merchant-Id": "2afc3973-04a5-4913-83f8-d45b0156b5f1",
                                           "X-Oc-Merchant-Language": "en-gb",
                                           "X-Oc-Currency": "SAR",
                                           "versionnumber": "3.5.6",
                                           "X-Oc-Session": "2b12982b56295dec3836ef04e4d69621",
                                           "Content-Type": "application/json",
                                           "platform": "ios"]
    
    static let authorizationToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MDM2OTY2MjMsImlzcyI6InRlc3QubmljZW9uZXNhLmNvbSIsImV4cCI6MTYzNTIzMjYyMywiZGF0YSI6eyJ1aWQiOiJleUowZVhBaU9pSktWMVFpTENKaGJHY2lPaUpJVXpJMU5pSjkuZXlKcFlYUWlPakUxTmpNME16TTJNelVzSW1semN5STZJblJsYzNRdWJtbGpaVzl1WlhOaExtTnZiU0lzSW1SaGRHRWlPbnNpZFdsa0lqb2lUbnBKZUUxVVZYZFBSRUV6VFhwSk0wNTZVVDBpZlgwLkd3cVBGNkVVU3I3Z2QtMktqMjNEdUpxVVdGWFl2TmY4SXlpNzNCT3pQNzQifX0.CoO_QD6-gIpYVZHQh7PTjxDdOnHjgjFMFAQcmJJ03qk"
}

