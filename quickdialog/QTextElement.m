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

#import <CoreGraphics/CoreGraphics.h>
#import "QTextElement.h"
#import "QAppearance.h"
#import "QElement+Appearance.h"

@interface QTextElement ()

@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *detailText;
@property(nonatomic, strong) UIImage *image;

@end

@implementation QTextElement

- (QTextElement *)init {
   self = [super init];
    self.color = [UIColor blackColor];
    return self;
}

- (QTextElement *)initWithText:(NSString *)text {
    self = [self init];
    self.text = text;
    return self;
}

- (QTextElement *)initWithText:(NSString *)text detailText:(NSString *)detailText
{
    self = [self init];
    self.text = text;
    self.detailText = detailText;
    return self;
}

- (QTextElement *)initWithKey:(NSString *)key text:(NSString *)text detailText:(NSString *)detailText
{
    self = [self initWithKey:key];
    self.text = text;
    self.detailText = detailText;
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformText"]];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"QuickformText"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.numberOfLines = 0;

    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.text = self.text;
    cell.detailTextLabel.font = self.appearance.valueFont;
    cell.detailTextLabel.textColor = _color;
    cell.detailTextLabel.text = self.detailText;

    cell.imageView.image = _image;

    return cell;
}


- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {

    if (_text.length == 0){
        return [super getRowHeightForTableView:tableView];
    }
    CGSize constraint = CGSizeMake(tableView.frame.size.width-(tableView.root.grouped ? 40.f : 20.f), 20000);
    CGSize  size= [_text sizeWithFont:self.appearance.valueFont constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
	CGFloat predictedHeight = size.height + 40.0f;
    if (self.text!=nil)
        predictedHeight+=30;
	return (_height >= predictedHeight) ? _height : predictedHeight;
}

- (void)fetchValueIntoObject:(id)obj {
	if (_key==nil)
		return;
	
	[obj setValue:_text forKey:_key];
}

@end
