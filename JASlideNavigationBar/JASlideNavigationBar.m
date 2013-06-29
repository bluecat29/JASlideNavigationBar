//
//  JASlideNavigationBar.m
//  JASlideNavigationBar
//
//  Created by Javier Daniel Peralta Azuara on 6/28/13.
//  Copyright (c) 2013 Javier Daniel Peralta Azuara. All rights reserved.
//

#import "JASlideNavigationBar.h"

@interface JASlideNavigationBar () <UIScrollViewDelegate>
{
    BOOL hideBackground;
}
@end

@implementation JASlideNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initialize];
}

- (void)initialize
{
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    hideBackground = YES;
    
    [self setTranslucent:YES];
    [self.window setBackgroundColor:[UIColor clearColor]];
}

- (void)dealloc
{
    self.scrollableView = nil;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    hideBackground = scrollView.contentOffset.y > 44 ? NO : YES;
    [self setNeedsDisplay];

    /*
    for (UIView *subView in [self subviews]) {
        if ([subView respondsToSelector:@selector(setAlpha:)]) {
            [subView setAlpha: hideBackground ? 0.3 : 1.0];
        }
    }*/
}

- (void)setScrollableView:(UIScrollView *)scrollableView
{
    if (_scrollableView != scrollableView) {
        _scrollableView = scrollableView;
        
        [_scrollableView setDelegate:self];
    }
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (hideBackground) {
        CGContextClearRect(context, rect);
    }else
    {
        CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
        CGContextFillRect(context, rect);
    }
}


@end
