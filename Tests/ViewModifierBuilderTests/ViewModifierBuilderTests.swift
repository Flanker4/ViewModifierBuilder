import XCTest
import SwiftUI

#if !os(macOS)
import UIKit
#endif

@testable import ViewModifierBuilder


@available(macOS 12.0, *)
struct Rounded: Style {
    func body(content: Content) -> some View {
        content.cornerRadius(20.0)
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
struct Green: Style {
    func body(content: Content) -> some View {
        content.padding(30).background(.green)
    }
}

struct HelloWorld: Style {
    func body(content: Content) -> some View {
        content.foregroundColor(.red)
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
struct ContentView: View {
    var isEnabled = true
    var body: some View {
        VStack {
            Text("Hello, world!").modifiers {
                Green()
                Rounded()
                HelloWorld()
            }
            Text("Hello, world!").modifiers { HelloWorld() }
            Button("Delete") {
                
            }.modifiers {
                Green()
                Rounded()
            }
            
        }
    }
}



@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if !os(macOS)
@available(macOS 12.0, *)
@available(iOS 15.0, *)
final class ViewModifierBuilderTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let savedSnapshot = "VStack<TupleView<(ModifiedContent<Text, ModifiedContent<ModifiedContent<Green, Rounded>, HelloWorld>>, ModifiedContent<Text, ModifiedContent<HelloWorld, EmptyModifier>>, ModifiedContent<Button<Text>, ModifiedContent<Green, Rounded>>)>>(_tree: SwiftUI._VariadicView.Tree<SwiftUI._VStackLayout, SwiftUI.TupleView<(SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI.ModifiedContent<SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>, ViewModifierBuilderTests.HelloWorld>>, SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI.ModifiedContent<ViewModifierBuilderTests.HelloWorld, SwiftUI.EmptyModifier>>, SwiftUI.ModifiedContent<SwiftUI.Button<SwiftUI.Text>, SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>>)>>(root: SwiftUI._VStackLayout(alignment: SwiftUI.HorizontalAlignment(key: SwiftUI.AlignmentKey(bits: 2)), spacing: nil), content: SwiftUI.TupleView<(SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI.ModifiedContent<SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>, ViewModifierBuilderTests.HelloWorld>>, SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI.ModifiedContent<ViewModifierBuilderTests.HelloWorld, SwiftUI.EmptyModifier>>, SwiftUI.ModifiedContent<SwiftUI.Button<SwiftUI.Text>, SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>>)>(value: (SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI.ModifiedContent<SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>, ViewModifierBuilderTests.HelloWorld>>(content: SwiftUI.Text(storage: SwiftUI.Text.Storage.anyTextStorage(SwiftUI.(unknown context at $7fff5df154d8).LocalizedTextStorage), modifiers: []), modifier: SwiftUI.ModifiedContent<SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>, ViewModifierBuilderTests.HelloWorld>(content: SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>(content: ViewModifierBuilderTests.Green(), modifier: ViewModifierBuilderTests.Rounded()), modifier: ViewModifierBuilderTests.HelloWorld())), SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI.ModifiedContent<ViewModifierBuilderTests.HelloWorld, SwiftUI.EmptyModifier>>(content: SwiftUI.Text(storage: SwiftUI.Text.Storage.anyTextStorage(SwiftUI.(unknown context at $7fff5df154d8).LocalizedTextStorage), modifiers: []), modifier: SwiftUI.ModifiedContent<ViewModifierBuilderTests.HelloWorld, SwiftUI.EmptyModifier>(content: ViewModifierBuilderTests.HelloWorld(), modifier: SwiftUI.EmptyModifier())), SwiftUI.ModifiedContent<SwiftUI.Button<SwiftUI.Text>, SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>>(content: SwiftUI.Button<SwiftUI.Text>(role: nil, action: (Function), label: SwiftUI.Text(storage: SwiftUI.Text.Storage.anyTextStorage(SwiftUI.(unknown context at $7fff5df154d8).LocalizedTextStorage), modifiers: [])), modifier: SwiftUI.ModifiedContent<ViewModifierBuilderTests.Green, ViewModifierBuilderTests.Rounded>(content: ViewModifierBuilderTests.Green(), modifier: ViewModifierBuilderTests.Rounded()))))))"
        
        let snapshot = String(describing: ContentView().body)
        
        XCTAssertEqual(snapshot, savedSnapshot)
    }
}


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
#endif
