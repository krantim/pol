//
//  WaterView.m
//  WaterAnimation
//
//  Created by Chanintorn Asavavichairoj on 4/4/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

#import "WaterView.h"

@interface WaterView () {
    UIColor *_currentWaterColor;
    
    float a;
    float b;
    BOOL jia;
}

@end

@implementation WaterView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:236/255.0f green:240/255.0f blue:241/255.0f alpha:1.0]];
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.masksToBounds = YES;
        
        a = 1.5;
        b = 0;
        jia = NO;
        
        _currentWaterColor = [UIColor colorWithRed:52/255.0f green:152/255.0f blue:219/255.0f alpha:0.9];
        _currentLinePointY = 100;
        
        [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}

- (void)animateWave {
    if (jia) {
        a += 0.01;
    } else {
        a -= 0.01;
    }
    
    if (a <= 1) {
        jia = YES;
    }
    
    if (a >= 1.5) {
        jia = NO;
    }
    
    b += 0.1;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float y=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, 0, y);
    for(float x=0; x <= rect.size.width; x++){
        y = a * sin( x / 180 * M_PI + 4 * b / M_PI ) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}

@end
