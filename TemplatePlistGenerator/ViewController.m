//
//  ViewController.m
//  TemplatePlistGenerator
//
//  Created by liu on 15-4-9.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "ViewController.h"
#import "ProjectTemlatePlistGenerator.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用绝对路径才能生成到PC上
    NSString *path = @"Users/liu/Desktop/MyTemplate/TemplateInfo.plist";
    BOOL flag = [ProjectTemlatePlistGenerator generatorToPath:path];
    if (flag) {
        self.resultLabel.text = [NSString stringWithFormat:@"Plist Generate Success To Path\n\n \"%@\"", path];
    } else {
        self.resultLabel.text = @"Plist Generate Failure";
    }
}

@end
