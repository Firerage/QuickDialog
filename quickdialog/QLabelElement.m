//                                
// Copyright 2011 ESCOZ Inc  - http://escoz.com
// 
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this 
// file except in compliance with the License. You may obtain a copy of the License at 
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF 
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//


#import "QLabelElement.h"

@implementation QLabelElement {
@private
    UITableViewCellAccessoryType _accessoryType;
}


@synthesize image = _image;
@synthesize value = _value;
@synthesize accessoryType = _accessoryType;
@synthesize keepSelected = _keepSelected;


- (QLabelElement *)initWithTitle:(NSString *)title Value:(id)value {
    self = [super init];
    self.title = title;
    _value = value;
    _keepSelected = YES;
    return self;
}

-(void)setImageNamed:(NSString *)name {
    if(name != nil) {
        self.image = [UIImage imageNamed:name];
    }
}

- (NSString *)imageNamed {
    return nil;
}

-(void)setIconNamed:(NSString *)name {
#if __IPHONE_7_0
    if ([self.image respondsToSelector:@selector(imageWithRenderingMode:)] && name != nil) {
        self.image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
#endif
}


- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView {
    QTableViewCell *cell = (QTableViewCell *) [super getCellForTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.title;
    cell.detailTextLabel.text = [_value description];
    cell.imageView.image = _image;
    return cell;
}

- (void)selected:(QuickDialogTableView *)tableView indexPath:(NSIndexPath *)path {
    [super selected:tableView indexPath:path];
    if (!self.keepSelected)
        [tableView deselectRowAtIndexPath:path animated:YES];
}


@end
