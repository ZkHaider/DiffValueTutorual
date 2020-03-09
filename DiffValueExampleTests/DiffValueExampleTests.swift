//
//  DiffValueExampleTests.swift
//  DiffValueExampleTests
//
//  Created by Haider Khan on 3/8/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import XCTest
@testable import DiffValueExample

struct RandomStruct {
    let someRandomValue: Int
}

enum TestActions: Action {
    case actionOne
    case actionTwo
    case actionThree
    case actionFour(String)
    case actionFive(RandomStruct)
}

struct TestAction: Action {
    let value: Int
}

class DiffValueExampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNameParsing() {
        let actionOne = TestActions.actionOne.name
        let actionFour = TestActions.actionFour("Something").name
        let actionFive = TestActions.actionFive(RandomStruct(someRandomValue: 10)).name
        let testAction = TestAction(value: 10).name
        let testStaticAction = TestAction.name
     
        assert(actionOne == "DiffValueExampleTests.TestActions.actionOne")
        assert(actionFour == "DiffValueExampleTests.TestActions.actionFour")
        assert(actionFive == "DiffValueExampleTests.TestActions.actionFive")
        assert(testAction == "DiffValueExampleTests.TestAction")
        assert(testStaticAction == "DiffValueExampleTests.TestAction")
    }
    
    func testRootActions() {
        let appLoadedName = RootActions.appLoaded.name
        assert(appLoadedName == "DiffValueExample.RootActions.appLoaded")
        
        let typeOfString = String(reflecting: type(of: RootActions.appLoaded))
        print(typeOfString)
    }
    
    func testFeedActions() {
        let fetchStoriesAction = FeedActions.fetchTopStories.name
        let didFetchStoriesAction = FeedActions.didFetchTopStories([]).name
        assert(fetchStoriesAction == "DiffValueExample.FeedActions.fetchTopStories")
        assert(didFetchStoriesAction == "DiffValueExample.FeedActions.didFetchTopStories")
    }
    
    func testFavoritesActions() {
        let saveFavoritesAction = FavoritesActions.saveStory.name
        assert(saveFavoritesAction == "DiffValueExample.FavoritesActions.saveStory")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
