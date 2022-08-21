
import SwiftUI



@resultBuilder public enum ViewModifierBuilder {
    public static func buildBlock<S1>(_ s1: S1) -> ModifiedContent<S1, EmptyModifier> where S1: ViewModifier{
        return s1.concat(EmptyModifier())
    }
    
    public static func buildBlock<S1, S2>(_ s1: S1, _ s2: S2) -> ModifiedContent<S1, S2> where S1: ViewModifier, S2: ViewModifier  {
        return s1.concat(s2)
    }
    public static func buildBlock<S1, S2, S3>(_ s1: S1, _ s2: S2, _ s3: S3) -> ModifiedContent<ModifiedContent<S1, S2>, S3> where S1: ViewModifier, S2: ViewModifier, S3: ViewModifier  {
        return s1.concat(s2).concat(s3)
    }
    
    public static func buildBlock<S1, S2, S3, S4>(_ s1: S1, _ s2: S2, _ s3: S3, _ s4: S4) -> ModifiedContent<ModifiedContent<ModifiedContent<S1, S2>, S3>, S4> where S1: ViewModifier, S2: ViewModifier, S3: ViewModifier, S4: ViewModifier  {
        return s1.concat(s2).concat(s3).concat(s4)
    }
    
    public static func buildBlock<S1, S2, S3, S4, S5>(_ s1: S1, _ s2: S2, _ s3: S3, _ s4: S4, _ s5: S5) -> ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<S1, S2>, S3>, S4>, S5> where S1: ViewModifier, S2: ViewModifier, S3: ViewModifier , S4: ViewModifier , S5: ViewModifier  {
        return s1.concat(s2).concat(s3).concat(s4).concat(s5)
    }
    
    public static func buildOptional<S1>(_ s1: S1?) -> ConditionalViewModifier<S1> where S1: ViewModifier {
        return ConditionalViewModifier(condition: s1 != nil, modifier: s1)
    }
}


public struct ConditionalViewModifier<S: ViewModifier>: Style {
    let condition: Bool
    let modifier: S?
    
    public func body(content: Content) -> some View {
        if (condition) {
            content.modifier(modifier!)
        } else {
            content.modifier(EmptyModifier())
        }
    }
}
public extension View {
    public func modifiers<S1: ViewModifier, S2: ViewModifier>(
        @ViewModifierBuilder _ modifiers: () -> ModifiedContent<S1, S2>
    ) -> some View {
        let result = modifiers()
        return self.modifier(result )
    }
}

public typealias StyleBuilder = ViewModifierBuilder
public typealias Style = ViewModifier
public extension View {
    public func styles<S1: ViewModifier, S2: ViewModifier>(
        @ViewModifierBuilder _ modifiers: () -> ModifiedContent<S1, S2>
    ) -> some View {
        let result = modifiers()
        return self.modifier(result )
    }
}
