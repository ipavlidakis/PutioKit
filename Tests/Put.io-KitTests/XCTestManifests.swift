import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Put_io_KitTests.allTests),
    ]
}
#endif
