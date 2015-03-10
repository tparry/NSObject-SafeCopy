//
//  This is free and unencumbered software released into the public domain.
//
//  Anyone is free to copy, modify, publish, use, compile, sell, or
//  distribute this software, either in source code form or as a compiled
//  binary, for any purpose, commercial or non-commercial, and by any
//  means.
//
//  In jurisdictions that recognize copyright laws, the author or authors
//  of this software dedicate any and all copyright interest in the
//  software to the public domain. We make this dedication for the benefit
//  of the public at large and to the detriment of our heirs and
//  successors. We intend this dedication to be an overt act of
//  relinquishment in perpetuity of all present and future rights to this
//  software under copyright law.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  For more information, please refer to <http://unlicense.org/>
//

#import "NSObject+SafeCopy.h"

@implementation NSObject (SafeCopy)

- (NSString*) safeStringCopy
{
	return [self isKindOfClass:[NSString class]] ? [self copy] : ([self respondsToSelector:@selector(stringValue)] ? [(id)self stringValue] : nil);
}

- (NSArray*) safeArrayCopy
{
	return [self isKindOfClass:[NSArray class]] ? [self copy] : nil;
}

- (NSDictionary*) safeDictionaryCopy
{
	return [self isKindOfClass:[NSDictionary class]] ? [self copy] : nil;
}

- (NSNumber*) safeNumberCopy
{
	return [self isKindOfClass:[NSNumber class]] ? [self copy] : nil;
}

- (NSDate*) safeDateCopy
{
	return [self isKindOfClass:[NSDate class]] ? [self copy] : nil;
}

#pragma mark -

- (double) safeDoubleValue
{
	return [self respondsToSelector:@selector(doubleValue)] ? [(id)self doubleValue] : 0;
}

- (float) safeFloatValue
{
	return [self respondsToSelector:@selector(floatValue)] ? [(id)self floatValue] : 0;
}

- (int) safeIntValue
{
	return [self respondsToSelector:@selector(intValue)] ? [(id)self intValue] : 0;
}

- (NSInteger) safeIntegerValue
{
	return [self respondsToSelector:@selector(integerValue)] ? [(id)self integerValue] : 0;
}

- (long long) safeLongLongValue
{
	return [self respondsToSelector:@selector(longLongValue)] ? [(id)self longLongValue] : 0;
}

- (BOOL) safeBoolValue
{
	return [self respondsToSelector:@selector(boolValue)] ? [(id)self boolValue] : NO;
}

@end
