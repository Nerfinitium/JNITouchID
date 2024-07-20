#include <jni.h>
#include <stdio.h>
#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#include "TouchID.h"

JNIEXPORT jboolean JNICALL Java_TouchID_authenticate(JNIEnv *env, jobject obj) {
    @autoreleasepool {
        LAContext *context = [[LAContext alloc] init];
        NSError *error = nil;

        // Check if Touch ID is available
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            // Perform the Touch ID authentication
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            __block jboolean success = JNI_FALSE;

            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                    localizedReason:@"Authenticate to access this feature"
                              reply:^(BOOL authenticated, NSError *error) {
                if (authenticated) {
                    success = JNI_TRUE;
                } else {
                    success = JNI_FALSE;
                }
                dispatch_semaphore_signal(semaphore);
            }];

            // Wait for the authentication result
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            return success;
        } else {
            // Touch ID is not available
            return JNI_FALSE;
        }
    }
}
