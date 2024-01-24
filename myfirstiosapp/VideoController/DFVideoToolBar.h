//
//  DFVideoToolBar.h
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/1/23.
//

#import <UIKit/UIKit.h>
#import "GTScreen.h"


#define DFVideoToolbarHeight UI(60)

/**
    视频viewcontroller item 下的toolbar
 */
@interface DFVideoToolBar : UIView


- (void)layoutWithModel:(id)model;


@end
