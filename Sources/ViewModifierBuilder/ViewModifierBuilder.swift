
import SwiftUI

public typealias Style = ViewModifier

@resultBuilder public enum ViewModifierBuilder {
    static func buildBlock<S1>(_ s1: S1) -> ModifiedContent<S1, EmptyModifier> where S1: ViewModifier{
        return s1.concat(EmptyModifier())
    }
    
    static func buildBlock<S1, S2>(_ s1: S1, _ s2: S2) -> ModifiedContent<S1, S2> where S1: ViewModifier, S2: ViewModifier  {
        return s1.concat(s2)
    }
    static func buildBlock<S1, S2, S3>(_ s1: S1, _ s2: S2, _ s3: S3) -> ModifiedContent<ModifiedContent<S1, S2>, S3> where S1: ViewModifier, S2: ViewModifier, S3: ViewModifier  {
        return s1.concat(s2).concat(s3)
    }
    
    static func buildBlock<S1, S2, S3, S4>(_ s1: S1, _ s2: S2, _ s3: S3, _ s4: S4) -> ModifiedContent<ModifiedContent<ModifiedContent<S1, S2>, S3>, S4> where S1: ViewModifier, S2: ViewModifier, S3: ViewModifier, S4: ViewModifier  {
        return s1.concat(s2).concat(s3).concat(s4)
    }
    
    static func buildBlock<S1, S2, S3, S4, S5>(_ s1: S1, _ s2: S2, _ s3: S3, _ s4: S4, _ s5: S5) -> ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<S1, S2>, S3>, S4>, S5> where S1: ViewModifier, S2: ViewModifier, S3: ViewModifier , S4: ViewModifier , S5: ViewModifier  {
        return s1.concat(s2).concat(s3).concat(s4).concat(s5)
    }
    
    public static func buildEither<S1>(first: S1) -> ModifiedContent<S1, EmptyModifier> where S1: ViewModifier {
        return first.concat(EmptyModifier())
    }
    
    public static func buildEither<S1>(second: S1) -> ModifiedContent<S1, EmptyModifier> where S1: ViewModifier {
        return second.concat(EmptyModifier())
    }
//    static func buildOptional<S1, S3>(_ s1: S1?) -> ModifiedContent<EmptyModifier, S3> where S1: ViewModifier, S3: ViewModifier {
//        guard let s1 = s1 else {
//            return EmptyModifier().concat(EmptyModifier())
//        }
//        return EmptyModifier().concat(s1)
//    }
}

public typealias StyleBuilder = ViewModifierBuilder


extension View {
    func modifiers<S1: ViewModifier, S2: ViewModifier>(
        @ViewModifierBuilder _ modifiers: () -> ModifiedContent<S1, S2>
    ) -> some View {
        let result = modifiers()
        return self.modifier(result)
    }
}
