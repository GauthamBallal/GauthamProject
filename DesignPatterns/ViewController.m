//
//  ViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 22/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "ViewController.h"
#import "GKBNavigationBar.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

-(UINavigationController*)currentNavigationController
{
    return self.navigationController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GKBNavigationBar *navBarView = [[[NSBundle mainBundle] loadNibNamed:@"GKBNavigationBar" owner:self options:nil] objectAtIndex:0];
    navBarView.frame = CGRectMake(0, 0, self.view.frame.size.width, navBarView.frame.size.height);
    //    navBarView.delegate = self;
    [self.navigationController.navigationBar addSubview:navBarView];
}

-(void)displayMVCHomeController
{
    UIViewController *login = [[UIStoryboard gameMVCStoryBoard] instantiateInitialViewController];
    [self pushViewController:login withAnimation:YES];
}

-(void)displayMMVMHomeController
{
    UIViewController *login = [[UIStoryboard gameMMVMStoryBoard] instantiateInitialViewController];
    [self pushViewController:login withAnimation:YES];
}

-(void)displayMVPHomeController
{
    UIViewController *login = [[UIStoryboard gameMVPStoryBoard] instantiateInitialViewController];
    [self pushViewController:login withAnimation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController*)viewControllerToBePushed withAnimation:(BOOL)animation
{
    GKBNavigationBar *customNavigationBar =  (GKBNavigationBar*)[self.navigationController.navigationBar viewWithTag:kCustomNavigationBarTag];
    [customNavigationBar shouldHideBackButton:NO];
    [customNavigationBar shouldHideHintButton:YES];
    viewControllerToBePushed.navigationItem.hidesBackButton = YES;
    
    [self.navigationController pushViewController:viewControllerToBePushed animated:animation];
}

-(void)popViewControllerAnimated:(BOOL)animation
{
    GKBNavigationBar *customNavigationBar =  (GKBNavigationBar*)[self.navigationController.navigationBar viewWithTag:kCustomNavigationBarTag];
    if(self.navigationController.viewControllers.count == 2 )
        [customNavigationBar shouldHideBackButton:YES];
    
    [customNavigationBar shouldHideHintButton:YES];
    
    [self.navigationController popViewControllerAnimated:animation];
}

-(void)popViewRootViewControllerAnimated:(BOOL)animation
{
    GKBNavigationBar *customNavigationBar =  (GKBNavigationBar*)[self.navigationController.navigationBar viewWithTag:kCustomNavigationBarTag];
    [customNavigationBar shouldHideBackButton:YES];
    [customNavigationBar shouldHideHintButton:YES];
    [self.navigationController popToRootViewControllerAnimated:animation];
}


-(NSString*)getIdentifierForRow:(NSInteger)row
{
    NSString *identifier = nil;
    switch (row) {
        case 0:
        {
            identifier = @"mvcCell";
            break;
        }
        case 1:
        {
            identifier = @"mmvmCell";
            break;
        }
        default:
            identifier = @"mvpCell";
            break;
    }
    return identifier;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self getIdentifierForRow:indexPath.row]];
    
    return cell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case eMVC:
        {
            [self displayMVCHomeController];
            break;
        }
        case eMMVM:
        {
            [self displayMMVMHomeController];
            break;
        }
        case eMVP:
        {
            [self displayMVPHomeController];
            break;
        }
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self getIdentifierForRow:indexPath.row]];
    return cell;
}

@end
