//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Feb 20 2016 22:04:40).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

@class NSError, NSString;
@protocol MDKMobileSyncDelegate;

@interface MDKMobileSync : NSObject
{
    NSError *mLastError;
    unsigned long long mState;
    id <MDKMobileSyncDelegate> _delegate;
    NSString *_UDID;
}

+ (id)deviceInfoForIdentifier:(id)arg1;
+ (id)sourcesForRestoreAndReturnError:(id *)arg1;
+ (void)initialize;
@property(readonly, copy) NSString *UDID; // @synthesize UDID=_UDID;
@property __weak id <MDKMobileSyncDelegate> delegate; // @synthesize delegate=_delegate;
- (void).cxx_destruct;
- (void)delegateDidFinish;
- (void)delegateDidFailWithError:(id)arg1;
- (void)delegateDidProgress:(unsigned long long)arg1;
- (void)delegateWillBegin;
- (void)handleProgress:(long long)arg1 forIdentifier:(id)arg2;
- (BOOL)backupWithDeviceInfo:(id)arg1 options:(id)arg2 error:(id *)arg3;
- (BOOL)changeBackupPassword:(id)arg1 oldPassword:(id)arg2 error:(id *)arg3;
- (BOOL)restoreFromIdentifier:(id)arg1 appIdentifiers:(id)arg2 options:(id)arg3 error:(id *)arg4;
- (id)initWithUDID:(id)arg1 error:(id *)arg2;

@end
