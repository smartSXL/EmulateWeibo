//
//  MainViewController.m
//  EmulateWeibo
//
//  Created by 001号 on 16/3/17.
//  Copyright © 2016年 001号. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
@interface MainViewController ()
// 撰写按钮
@property (nonatomic, strong) UIButton *composeBtn;
@end

@implementation MainViewController


#pragma mark -
#pragma mark - 视图生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self setupComposeBtn];
    
    
}

#pragma mark - 设置UI
- (void)setupComposeBtn
{
    CGRect rect = self.tabBar.bounds;
    CGFloat w = rect.size.width / self.childViewControllers.count - 1;
    NSLog(@"%ld",self.childViewControllers.count);
    self.composeBtn.frame = CGRectInset(rect, 2 * w, 0);
}


#pragma mark -
#pragma mark -composeBtn的点击事件
- (void)clickComposeBtn
{
    NSLog(@"点击composeBtn");
    
}

#pragma mark -
#pragma mark -设置子控制器

- (void)addChildViewControllers
{
    // 设置tabbar的tintColor  t  tabbar_compose_button_highlighted
    self.tabBar.tintColor = [UIColor orangeColor];
    
    // 添加所有的zi控制器
    [self addChildViewController:[[HomeViewController alloc] init] title:@"首页" imageName:@"tabbar_home"];
    [self addChildViewController:[[MessageViewController alloc] init] title:@"消息" imageName:@"tabbar_message_center"];
    
    // 添加一个空白控制器
    [self addChildViewController:[[UIViewController alloc] init]];
    
    [self addChildViewController:[[DiscoverViewController alloc] init] title:@"发现" imageName:@"tabbar_discover"];
    [self addChildViewController:[[ProfileViewController alloc] init] title:@"我" imageName:@"tabbar_profile"];
}

/// 添加子控制器
///
/// @param childController 子控制器
/// @param title           标题
/// @param imageName       图像名称
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName
{
    // 设置标题
    childController.title = title;
    // 设置标题字体的属性
//    NSDictionary *textAttributesDict = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:12]};
//    [childController.tabBarItem setTitleTextAttributes:textAttributesDict forState:UIControlStateNormal];
    
    // 设置图像
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    NSString *seletedImageName = [NSString stringWithFormat:@"%@_selected",imageName];
//    childController.tabBarItem.selectedImage = [[UIImage imageNamed:seletedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:seletedImageName];
    
    // 设置添加子控制器
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}


#pragma mark - 
#pragma mark - 懒加载composeBtn按钮

- (UIButton *)composeBtn
{
    if (_composeBtn == nil)
    {
        _composeBtn = [[UIButton alloc] init];
        
        CGRect rect = self.tabBar.bounds;
        CGFloat w = rect.size.width / self.childViewControllers.count - 1;
        self.composeBtn.frame = CGRectInset(rect, 2 * w, 0);
        
        // 设置按钮图像
        [ _composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [ _composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [ _composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [ _composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 将按钮添加到tabBar
        [self.tabBar addSubview: _composeBtn];
        
        // 给按钮添加监听事件
        [_composeBtn addTarget:self action:@selector(clickComposeBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _composeBtn;
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
