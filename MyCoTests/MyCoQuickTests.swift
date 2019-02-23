//
//  MyCoQuickTests.swift
//  MyCoTests
//
//  Created by Yong Su on 2/23/19.
//  Copyright © 2019 Yong Su. All rights reserved.
//

import Quick
import Nimble
import MyCo

class MyCoQuickTests: QuickSpec {

    override func spec() {
        describe("these will fail") {
            
            it("can do maths") {
                let co = MyCo(x: 0, y: 0)
                expect(co.add(a: 1, b: 1)) == 2
            }
            
            it("can read") {
                expect("number") == "number"
            }
            
            it("will eventually fail") {
                expect("time").toEventually( equal("time") )
            }
            
            context("these will pass") {
                
                it("can do maths") {
                    expect(23) == 23
                }
                
                it("can read") {
                    expect("🐮") == "🐮"
                }
                
                it("will eventually pass") {
                    var time = "passing"
                    
                    DispatchQueue.main.async {
                        time = "done"
                    }
                    
                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"
                        
                        done()
                    }
                }
            }
        }
    }

}
