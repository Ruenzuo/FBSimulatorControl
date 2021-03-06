/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

#import <FBSimulatorControl/FBSimulatorControl.h>

#import "FBSimulatorControlAssertions.h"
#import "FBSimulatorControlFixtures.h"
#import "FBSimulatorControlTestCase.h"

@interface FBSimulatorFramebufferTests : FBSimulatorControlTestCase

@end

@implementation FBSimulatorFramebufferTests

- (void)testRecordsVideoForSimulatorApp
{
  FBSimulatorBootConfiguration *launchConfiguration = self.simulatorLaunchConfiguration;
  if (launchConfiguration.shouldUseDirectLaunch) {
    NSLog(@"Skipping running -[%@ %@] since the Simulator will be launched directly", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return;
  }
  if (!FBControlCoreGlobalConfiguration.isXcode8OrGreater) {
    NSLog(@"Skipping running -[%@ %@] since Xcode 8 or greater is required", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return;
  }

  FBSimulator *simulator = [self assertObtainsBootedSimulatorWithConfiguration:self.simulatorConfiguration launchConfiguration:launchConfiguration];
  [self assertSimulator:simulator launchesApplication:self.safariApplication withApplicationLaunchConfiguration:self.safariAppLaunch];
  [self assertInteractionSuccessful:[simulator.interact startRecordingVideo]];
  [self assertSimulator:simulator launchesApplication:self.tableSearchApplication withApplicationLaunchConfiguration:self.tableSearchAppLaunch];
}

@end
