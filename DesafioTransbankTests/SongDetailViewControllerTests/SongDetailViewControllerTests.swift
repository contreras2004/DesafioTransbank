//
//  SongDetailViewControllerTests.swift
//  DesafioTransbankTests
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioTransbank


final class SongsDetailViewControllerTests: QuickSpec {

    override func spec() {
        var sut: SongDetailViewController!
        var window: UIWindow!

        beforeEach {
            let itunesResponse: ItunesResponseModel = JSONHelper.loadJSON(withFile: "SongsResponse", inBundle: Bundle(for: type(of: self)))!
            sut = SongDetailViewController(song: itunesResponse.results.first!)

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
        }
    }

}
