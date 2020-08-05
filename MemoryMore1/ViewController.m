//
//  ViewController.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/2.
//  Copyright © 2020年 xiekunpeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)case1:(id)sender {
    ViewController1 *c = [[ViewController1 alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

- (IBAction)case2:(id)sender {
    ViewController2 *c = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}
//
//- (IBAction)case3:(id)sender {
//    ViewController3 *c = [[ViewController3 alloc] init];
//       [self.navigationController pushViewController:c animated:YES];
//}
//
//- (IBAction)case4:(id)sender {
//    ViewController4 *c = [[ViewController4 alloc] init];
//       [self.navigationController pushViewController:c animated:YES];
//}
//
//- (IBAction)case5:(id)sender {
//    ViewController5 *c = [[ViewController5 alloc] init];
//    [self.navigationController pushViewController:c animated:YES];
//}
//
//- (IBAction)case6:(id)sender {
//    ViewController6 *c = [[ViewController6 alloc] init];
//    [self.navigationController pushViewController:c animated:YES];
//}
//
//- (IBAction)case7:(id)sender {
//    ViewController7 *c = [[ViewController7 alloc] init];
//      [self.navigationController pushViewController:c animated:YES];
//}
//
//- (IBAction)case8:(id)sender {
//    ViewController8 *c = [[ViewController8 alloc] init];
//    [self.navigationController pushViewController:c animated:YES];
//}
//
//- (IBAction)cae9:(id)sender {
//      ViewController9 *c = [[ViewController9 alloc] init];
//        [self.navigationController pushViewController:c animated:YES];
//    }
//
//- (IBAction)case10:(id)sender {
//      ViewController10 *c = [[ViewController10 alloc] init];
//        [self.navigationController pushViewController:c animated:YES];
//    }
//
//- (IBAction)case11:(id)sender {
//      ViewController11 *c = [[ViewController11 alloc] init];
//        [self.navigationController pushViewController:c animated:YES];
//    }
@end
