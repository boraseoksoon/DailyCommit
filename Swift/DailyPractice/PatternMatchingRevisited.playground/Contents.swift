//: Playground - noun: a place where people can play

import UIKit

var introductionStr = "2017/09/15 TEST CODE"

var dict = ["K":"V", "K2":"V2"]

for i in dict {
  print(i)
}

for (k,v) in dict {
  print(k,v)
}


//extension RequestConformable {
//  var auth_header: HTTPHeaders {
//    get {
//      return ["X-Xiaoring-ID" : ""]
//    }
//  }
//
//  var _auth_header_expansion: HTTPHeaders {
//    get {
//      return auth_header_expansion
//    }
//
//    set {
//      auth_header_expansion = newValue
//    }
//  }
//
//  var isAccessFirst: Bool { return false }
//  var auth_header_expansion: HTTPHeaders {
//    get {
//      if isAccessFirst {
//        return self.auth_header.forEach { (key: String, value: String) in self._auth_header_expansion[key] = value }
//      }
//      return self._auth_header_expansion
//    }
//
//    set {
//      self._auth_header_expansion = newValue
//    }
//  }
//}

