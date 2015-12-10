//
//  ViewController.m
//  LoginViewController
//
//  Created by TianHaoShengShi on 15/12/10.
//  Copyright © 2015年 TianHaoShengShi. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+shake.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *_imageArray;
    UIButton *_wxGroundButton;
    UIButton *_wbGroundButton;
    UIButton *_qqGroundButton;
    UIButton *_tbGroundButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    添加图片
    _imageArray = @[@"login_reg_3icon_2",@"login_reg_3icon_3",@"login_reg_3icon_1",@"login_reg_3icon_4"];
    
//    1.旋转滚动
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(22+(self.view.bounds.size.width/4)*0, self.view.bounds.size.height - 350, 50, 50);
    [button1 setBackgroundImage:[UIImage imageNamed:_imageArray[0]] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 shakeWithOptions:SCShakeOptionsAtEndComplete force:1.0 duration:5.0 iterationDuration:0.2 completionHandler:^{
        
    }];
    
//   2持续回荡效果
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(22+(self.view.bounds.size.width/4)*1, self.view.bounds.size.height - 350, 50, 50);
    [button2 setBackgroundImage:[UIImage imageNamed:_imageArray[1]] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 shakeWithOptions:SCShakeOptionsAtEndRestart force:0.25 duration:5.0 iterationDuration:0.5 completionHandler:^{
        
    }];

//   3渐变回荡停止效果
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(22+(self.view.bounds.size.width/4)*2, self.view.bounds.size.height - 350, 50, 50);
    [button3 setBackgroundImage:[UIImage imageNamed:_imageArray[2]] forState:UIControlStateNormal];
    [self.view addSubview:button3];
    [button3 shakeWithOptions:SCShakeOptionsForceInterpolationExpDown force:0.5 duration:5.0 iterationDuration:0.5 completionHandler:^{
        
    }];
    
//   3渐变回荡停止效果
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(22+(self.view.bounds.size.width/4)*3, self.view.bounds.size.height - 350, 50, 50);
    [button4 setBackgroundImage:[UIImage imageNamed:_imageArray[3]] forState:UIControlStateNormal];
    [self.view addSubview:button4];
    [button4 shakeWithOptions:SCShakeOptionsForceInterpolationLinearDown force:0.5 duration:5.0 iterationDuration:0.5 completionHandler:^{
        
    }];
    
    //   3水平运动效果
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(22+(self.view.bounds.size.width/4)*0, self.view.bounds.size.height - 250, 50, 50);
    [button5 setBackgroundImage:[UIImage imageNamed:_imageArray[0]] forState:UIControlStateNormal];
    [self.view addSubview:button5];
    [button5 shakeWithOptions:SCShakeOptionsDirectionHorizontal|SCShakeOptionsAtEndContinue force:0.5 duration:5.0 iterationDuration:0.5 completionHandler:^{
        
    }];
    
    //   3垂直运动效果
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(22+(self.view.bounds.size.width/4)*1, self.view.bounds.size.height - 250, 50, 50);
    [button6 setBackgroundImage:[UIImage imageNamed:_imageArray[1]] forState:UIControlStateNormal];
    [self.view addSubview:button6];
    [button6 shakeWithOptions:SCShakeOptionsDirectionVertical|SCShakeOptionsAtEndContinue force:0.5 duration:5.0 iterationDuration:0.5 completionHandler:^{
        
    }];

    //   3水平运动效果
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(22+(self.view.bounds.size.width/4)*2.5, self.view.bounds.size.height - 250, 50, 50);
    [button7 setBackgroundImage:[UIImage imageNamed:_imageArray[2]] forState:UIControlStateNormal];
    [self.view addSubview:button7];
    [button7 shakeWithOptions:SCShakeOptionsDirectionHorizontalAndVertical | SCShakeOptionsAtEndContinue force:1.0 duration:5.0 iterationDuration:0.5 completionHandler:^{
        
    }];

    
    [self waveShake];
    
       // Do any additional setup after loading the view, typically from a nib.
}

//连续波浪抖动
-(void)waveShake{
    NSArray *titleArray = @[@"微信",@"微博",@"QQ",@"淘宝"];
    for (int i = 0 ; i < _imageArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(22+(self.view.bounds.size.width/4)*i, self.view.bounds.size.height - 150, 50, 50);
        [button setBackgroundImage:[UIImage imageNamed:_imageArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(threeLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i + 1;
        [self.view addSubview:button];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(22+(self.view.bounds.size.width/4)*i, CGRectGetMaxY(button.frame)+3, 50,20)];
        label.text = titleArray[i];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
    }
    
    _wxGroundButton = (UIButton *)[self.view viewWithTag:1];
    _wbGroundButton = (UIButton *)[self.view viewWithTag:2];
    _qqGroundButton = (UIButton *)[self.view viewWithTag:3];
    _tbGroundButton = (UIButton *)[self.view viewWithTag:4];
    
    //    设置button开始跳动的时间
    [self addThreeAnimation];

}

-(void)addThreeAnimation
{
    [self performSelector:@selector(wxGroundButton) withObject:@"toRootControllerView" afterDelay:0.3];
    [self performSelector:@selector(wbGroundButton) withObject:@"toRootControllerView" afterDelay:0.42];
    [self performSelector:@selector(qqGroundButton) withObject:@"toRootControllerView" afterDelay:0.54];
    [self performSelector:@selector(tbGroundButton) withObject:@"toRootControllerView" afterDelay:0.66];
}

-(void)qqGroundButton
{
    [_qqGroundButton shakeWithOptions:SCShakeOptionsDirectionVertical force:0.12 duration:0.24 iterationDuration:0.15 completionHandler:^{
        
    }];
}
-(void)wxGroundButton
{
    [_wxGroundButton shakeWithOptions:SCShakeOptionsDirectionVertical force:0.12 duration:0.24 iterationDuration:0.15 completionHandler:^{
        
    }];
}

-(void)wbGroundButton{
    [_wbGroundButton shakeWithOptions:SCShakeOptionsDirectionVertical force:0.12 duration:0.24 iterationDuration:0.15 completionHandler:^{
        
    }];
}

-(void)tbGroundButton
{
    [_tbGroundButton shakeWithOptions:SCShakeOptionsDirectionVertical force:0.12 duration:0.24 iterationDuration:0.15 completionHandler:^{
        [self addThreeAnimation];
    }];
}

-(void)threeLoginAction:(UIButton *)button
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
