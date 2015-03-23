//
//  CWColors.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 23/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWColors.h"

static CWColors* _sharedColors = nil;
@interface CWColors ()
@property NSMutableDictionary* colors;
- (NSColor*) rgba:(NSString*) string;
- (NSInteger) random:(NSInteger) max;
@end

@implementation CWColors

- (NSInteger) random:(NSInteger) max {
	int r = rand();
	float ir = (float)r/(float)RAND_MAX;
	return (NSInteger)(ir*(float)max);
}

- (NSColor*) pickColor {
	NSArray* keys = self.colors.allKeys;
	NSString* key = keys[[self random:keys.count]];
	NSLog(@"Picking %@",key);
	return self.colors[key];
}

+ (CWColors*) sharedColors {
	if(!_sharedColors) {
		_sharedColors = [[CWColors alloc] init];
	}
	return _sharedColors;
}

- (instancetype) init {
	self = [super init];
	if(self) {
		_colors = [NSMutableDictionary dictionary];
		_colors[@"turquise"] = [self rgba:@"26, 188, 156,1.0"];
		_colors[@"emerald"] = [self rgba:@"46, 204, 113,1.0"];
		_colors[@"peter river"] = [self rgba:@"52, 152, 219,1.0"];
		_colors[@"amethyst"] = [self rgba:@"155, 89, 182,1.0"];
		_colors[@"wet asphalt"] = [self rgba:@"52, 73, 94,1.0"];
		_colors[@"green sea"] = [self rgba:@"22, 160, 133,1.0"];
		_colors[@"nephritis"] = [self rgba:@"39, 174, 96,1.0"];
		_colors[@"belize hole"] = [self rgba:@"41, 128, 185,1.0"];
		_colors[@"wisteria"] = [self rgba:@"142, 68, 173,1.0"];
		_colors[@"midnight blue"] = [self rgba:@"44, 62, 80,1.0"];
		_colors[@"sun flower"] = [self rgba:@"241, 196, 15,1.0"];
		_colors[@"carrot"] = [self rgba:@"230, 126, 34,1.0"];
		_colors[@"alizarin"] = [self rgba:@"231, 76, 60,1.0"];
		_colors[@"clouds"] = [self rgba:@"236, 240, 241,1.0"];
		_colors[@"concrete"] = [self rgba:@"149, 165, 166,1.0"];
		_colors[@"orange"] = [self rgba:@"243, 156, 18,1.0"];
		_colors[@"pumpkin"] = [self rgba:@"211, 84, 0,1.0"];
		_colors[@"pomegrante"] = [self rgba:@"192, 57, 43,1.0"];
		_colors[@"silver"] = [self rgba:@"189, 195, 199,1.0"];
		_colors[@"asbestor"] = [self rgba:@"127, 140, 141,1.0"];
	}
	return self;
}
- (NSColor*) rgba:(NSString*) string {
	NSArray* components = [string componentsSeparatedByString:@","];
	NSInteger r = [components[0] integerValue];
	NSInteger g = [components[1] integerValue];
	NSInteger b = [components[2] integerValue];
	NSInteger a = [components[0] integerValue];
	NSColor* col = [NSColor colorWithDeviceRed:(CGFloat)r/255.0f green:(CGFloat)g/255.0f blue:(CGFloat)b/255.0f alpha:(CGFloat)a/255.0f];
	return col;
}

@end