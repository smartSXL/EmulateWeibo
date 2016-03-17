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

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}


#pragma mark -
#pragma mark -设置子控制器

- (void)addChildViewControllers
{
    self.tabBar.tintColor = [UIColor orangeColor];
    
    // 添加所有的自控制器
    [self addChildViewController:[[HomeViewController alloc] init] title:@"首页" imageName:@"tabbar_home"];
    [self addChildViewController:[[MessageViewController alloc] init] title:@"消息" imageName:@"tabbar_message_center"];
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
