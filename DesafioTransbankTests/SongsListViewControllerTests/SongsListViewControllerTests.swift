//
//  SongsListViewControllerTests.swift
//  DesafioTransbankTests
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import TBNetwork
import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioTransbank


final class SongsListViewControllerTests: QuickSpec {

    override func spec() {
        var sut: SongsListViewController!
        var requestPerformer: MockSongsListRequestPerfomer!
        var window: UIWindow!

        beforeEach {
            requestPerformer = MockSongsListRequestPerfomer()

            sut = SongsListViewController(requestPerformer: requestPerformer)

            window = UIWindow(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            window.rootViewController = sut

            sut.beginAppearanceTransition(true, animated: false)
            sut.endAppearanceTransition()
        }

        describe("#init") {
            it("has the correct layout") {
                expect(sut).to(haveValidSnapshot())
            }

            it("has the correct layout when searching") {
                let searchTerm = "Bohemian Rhapsody"
                requestPerformer.state = .noResponse
                sut.songsListView.searchBar.text = searchTerm
                sut.searchBar(sut.songsListView.searchBar, textDidChange: searchTerm)
                expect(sut).to(haveValidSnapshot())
            }

            it("has the correct layout when searching and empty response from server") {
                let searchTerm = "Bohemian Rhapsody"
                requestPerformer.state = .emptyResponse
                sut.songsListView.searchBar.text = searchTerm
                sut.searchBar(sut.songsListView.searchBar, textDidChange: searchTerm)
                expect(sut).to(haveValidSnapshot())
            }

            it("has the correct layout when searching and correct response from server") {
                let searchTerm = "Bohemian Rhapsody"
                requestPerformer.state = .withData
                sut.songsListView.searchBar.text = searchTerm
                sut.searchBar(sut.songsListView.searchBar, textDidChange: searchTerm)
                expect(sut).to(haveValidSnapshot())
            }

            it("has the correct layout when searching and error response from server") {
                let searchTerm = "Bohemian Rhapsody"
                requestPerformer.state = .error
                sut.songsListView.searchBar.text = searchTerm
                sut.searchBar(sut.songsListView.searchBar, textDidChange: searchTerm)
                expect(sut).to(haveValidSnapshot())
            }
        }
    }

}
