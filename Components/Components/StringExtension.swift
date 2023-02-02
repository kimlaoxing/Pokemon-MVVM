import Foundation
import UIKit

extension String {

   public func removingAllWhitespaces() -> String {
       return removingCharacters(from: .whitespaces)
   }

   public func removingCharacters(from set: CharacterSet) -> String {
       var newString = self
       newString.removeAll { char -> Bool in
           guard let scalar = char.unicodeScalars.first else { return false }
           return set.contains(scalar)
       }
       return newString
   }
}
