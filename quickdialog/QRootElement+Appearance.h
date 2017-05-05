//
//  QRootElement+Appearance.h
//  QuickDialog
//
//  Created by 陈嗣圣 on 2017/5/5.
//
//

#import "QRootElement.h"

@class QAppearance;

@interface QRootElement (Appearance)

@property(nonatomic, retain) QAppearance *appearance;

+ (QAppearance *)appearance;
+ (void)setAppearance:(QAppearance *)newAppearance;

@end
