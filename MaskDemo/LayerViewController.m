//
//  LayerViewController.m
//  MaskDemo
//
//  Created by lizq on 16/8/15.
//  Copyright © 2016年 zqLee. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()

@property (nonatomic, strong)  UIImageView *grayImageView;
@property (nonatomic, strong)  UIImageView *colorImageView;
@property (nonatomic, strong)  UIView *maskView;



@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.grayImageView];
    [self.view addSubview:self.colorImageView];
}



#pragma mark 触摸时间处理

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.maskView.center = point;

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.maskView.center = point;
}



#pragma mark getter or setter
- (UIImageView *)grayImageView {
    if (_grayImageView == nil) {
        _grayImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _grayImageView.image = [UIImage imageNamed:@"jobs_gray"];
    }
    return _grayImageView;
}


- (UIImageView *)colorImageView {
    if (_colorImageView == nil) {
        _colorImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _colorImageView.image = [UIImage imageNamed:@"jobs_color"];
        _colorImageView.layer.mask = self.maskView.layer;
        _colorImageView.layer.masksToBounds = YES;
    }
    return _colorImageView;
}

- (UIView *)maskView {
    if (_maskView == nil) {
        _maskView = [[UIView alloc] init];
        _maskView.frame = CGRectMake(0, 0, 200, 200);
        _maskView.center = self.view.center;
        [self.view addSubview:_maskView];
#warning 使用涂层蒙板时， 图层必须是有背景色， 否则图层无效
        _maskView.backgroundColor = [UIColor redColor];
        _maskView.layer.cornerRadius = 100;
        _maskView.layer.masksToBounds = YES;

    }
    return  _maskView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
