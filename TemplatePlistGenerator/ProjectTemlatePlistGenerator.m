//
//  ProjectTemlatePlistGenerator.m
//  TemplatePlistGenerator
//
//  Created by liu on 15-4-9.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "ProjectTemlatePlistGenerator.h"

#define kAppDelegateH @"Application/AppDelegate.h"
#define kAppDelegateM @"Application/AppDelegate.m"
#define kAppConfigH @"Application/AppConfig.h"
#define kAppConstantsH @"Application/AppConstants.h"
#define kAppMarcosH @"Application/AppMarcos.h"
#define kAppNotificationH @"Application/AppNotification.h"

#define kMBProgressHUDAdditionsH @"Categories/MBProgressHUD+Additions.h"
#define kMBProgressHUDAdditionsM @"Categories/MBProgressHUD+Additions.m"
#define kJsonSerializationH @"Categories/JsonSerialization.h"
#define kJsonSerializationM @"Categories/JsonSerialization.m"
#define kUIButtonAdditionsH @"Categories/UIButton+Additions.h"
#define kUIButtonAdditionsM @"Categories/UIButton+Additions.m"
#define kUILabelAdditionsH @"Categories/UILabel+Additions.h"
#define kUILabelAdditionsM @"Categories/UILabel+Additions.m"

#define kGestureHelperH @"Utils/GestureHelper.h"
#define kGestureHelperM @"Utils/GestureHelper.m"

#define kCellObjects @"CellObjects/"

#define kBaseTableViewCellH @"Cells/TableViewCell/BaseTableViewCell.h"
#define kBaseTableViewCellM @"Cells/TableViewCell/BaseTableViewCell.m"
#define kBaseCollectionViewCellH @"Cells/CollectionViewCell/BaseCollectionViewCell.h"
#define kBaseCollectionViewCellM @"Cells/CollectionViewCell/BaseCollectionViewCell.m"

//#define kComponents @"Components"
#define kAPNSAgentH @"Components/APNSAgent/APNSAgent.h"
#define kAPNSAgentM @"Components/APNSAgent/APNSAgent.m"
#define kAPNSAgentInternalH @"Components/APNSAgent/APNSAgentInternal.h"
#define kAPNSAgentInternalM @"Components/APNSAgent/APNSAgentInternal.m"

#define kBaseViewControllerH @"Controllers/BaseViewController.h"
#define kBaseViewControllerM @"Controllers/BaseViewController.m"
#define kTSNavigationControllerH @"Controllers/TSNavigationController.h"
#define kTSNavigationControllerM @"Controllers/TSNavigationController.m"

#define kDataEngineH @"Engines/DataEngine.h"
#define kDataEngineM @"Engines/DataEngine.m"

#define kImages @"Images/"

#define kAuthenticationManagerH @"Managers/AuthenticationManager.h"
#define kAuthenticationManagerM @"Managers/AuthenticationManager.m"

#define kBaseModelH @"Models/BaseModel.h"
#define kBaseModelM @"Models/BaseModel.m"

#define kSDK @"SDK/"

#define kMaskViewH @"Views/MaskView.h"
#define kMaskViewM @"Views/MaskView.m"

#define kPrefixHeader @"PrefixHeader.pch"

#define kPodfile @"../Podfile"

@implementation ProjectTemlatePlistGenerator

+ (BOOL)generatorToPath:(NSString *)path {
    ProjectTemlatePlistGenerator *generator = [ProjectTemlatePlistGenerator new];
    NSDictionary *dict = [generator createInfoPlist];
    BOOL flag = [dict writeToFile:path atomically:YES];
    NSLog(@"flag %@", @(flag));
    return flag;
}

- (NSMutableDictionary *)createInfoPlist {
    NSMutableDictionary *plist = [NSMutableDictionary dictionary];
    [plist setObject:[self createAncestors] forKey:@"Ancestors"];
    [plist setObject:[self createNodes] forKey:@"Nodes"];
    [plist setObject:[self createDefinitions] forKey:@"Definitions"];
    //YES的模板才可以显示在new project的dialog中，此时这个模板不能被其他模板继承。
    [plist setObject:@(YES) forKey:@"Concrete"];
    //显示在new project的dialog中的位置索引
    [plist setObject:@(99) forKey:@"SortOrder"];
    //Kind：项目模板为Xcode.Xcode3.ProjectTemplateUnitKind，文件模板为Xcode.IDEKit.TextSubstitutionFileTemplateKind。
    [plist setObject:@"Xcode.Xcode3.ProjectTemplateUnitKind" forKey:@"Kind"];
    //模版描述
    [plist setObject:@"Toraysoft iOS Project Template 1.0" forKey:@"Description"];
    //模版唯一标示
    [plist setObject:@"com.apple.dt.unit.TorayApplication" forKey:@"Identifier"];
    //选项
    [plist setObject:[self createOptions] forKey:@"Options"];
    return plist;
}

//继承的模版
- (NSArray *)createAncestors {
    NSMutableArray *ancestors = [NSMutableArray array];
    [ancestors addObject:@"com.apple.dt.unit.coreDataCocoaTouchApplication"];
    [ancestors addObject:@"com.apple.dt.unit.storyboardApplication"];
    return ancestors;
}

//定义要添加到项目中的文件
- (NSArray *)createNodes {
    NSMutableArray *nodes = [NSMutableArray array];
    //Application
    [nodes addObject:kAppDelegateH];
    [nodes addObject:kAppDelegateM];
    [nodes addObject:kAppConfigH];
    [nodes addObject:kAppConstantsH];
    [nodes addObject:kAppMarcosH];
    [nodes addObject:kAppNotificationH];
    //Categories
    [nodes addObject:kMBProgressHUDAdditionsH];
    [nodes addObject:kMBProgressHUDAdditionsM];
    [nodes addObject:kJsonSerializationH];
    [nodes addObject:kJsonSerializationM];
    [nodes addObject:kUIButtonAdditionsH];
    [nodes addObject:kUIButtonAdditionsM];
    [nodes addObject:kUILabelAdditionsH];
    [nodes addObject:kUILabelAdditionsM];
    //Utils
    [nodes addObject:kGestureHelperH];
    [nodes addObject:kGestureHelperM];
    //CellObjects
    [nodes addObject:kCellObjects];
    //Cells
    [nodes addObject:kBaseTableViewCellH];
    [nodes addObject:kBaseTableViewCellM];
    [nodes addObject:kBaseCollectionViewCellH];
    [nodes addObject:kBaseCollectionViewCellM];
    //Components
    //    [nodes addObject:kComponents];
    [nodes addObject:kAPNSAgentH];
    [nodes addObject:kAPNSAgentM];
    [nodes addObject:kAPNSAgentInternalH];
    [nodes addObject:kAPNSAgentInternalM];
    //Controllers
    [nodes addObject:kBaseViewControllerH];
    [nodes addObject:kBaseViewControllerM];
    [nodes addObject:kTSNavigationControllerH];
    [nodes addObject:kTSNavigationControllerM];
    //Engines
    [nodes addObject:kDataEngineH];
    [nodes addObject:kDataEngineM];
    //Images
    [nodes addObject:kImages];
    //Managers
    [nodes addObject:kAuthenticationManagerH];
    [nodes addObject:kAuthenticationManagerM];
    //Models
    [nodes addObject:kBaseModelH];
    [nodes addObject:kBaseModelM];
    //SDK
    [nodes addObject:kSDK];
    //Views
    [nodes addObject:kMaskViewH];
    [nodes addObject:kMaskViewM];
    //PrefixHeader
    [nodes addObject:kPrefixHeader];
    //Podfile
    [nodes addObject:kPodfile];
    return nodes;
}

//将Nodes中定义的文件添加到项目中
- (NSDictionary *)createDefinitions {
    NSMutableDictionary *definitions = [NSMutableDictionary dictionary];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Application" path:kAppDelegateH] forKey:kAppDelegateH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Application" path:kAppDelegateM] forKey:kAppDelegateM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Application" path:kAppConfigH] forKey:kAppConfigH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Application" path:kAppConstantsH] forKey:kAppConstantsH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Application" path:kAppMarcosH] forKey:kAppMarcosH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Application" path:kAppNotificationH] forKey:kAppNotificationH];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kMBProgressHUDAdditionsH] forKey:kMBProgressHUDAdditionsH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kMBProgressHUDAdditionsM] forKey:kMBProgressHUDAdditionsM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kJsonSerializationH] forKey:kJsonSerializationH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kJsonSerializationM] forKey:kJsonSerializationM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kUIButtonAdditionsH] forKey:kUIButtonAdditionsH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kUIButtonAdditionsM] forKey:kUIButtonAdditionsM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kUILabelAdditionsH] forKey:kUILabelAdditionsH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Categories" path:kUILabelAdditionsM] forKey:kUILabelAdditionsM];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Utils" path:kGestureHelperH] forKey:kGestureHelperH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Utils" path:kGestureHelperM] forKey:kGestureHelperM];
    
    [definitions setObject:[self groupDefinitionWithGroup:nil path:kCellObjects] forKey:kCellObjects];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Cells/TableViewCell" path:kBaseTableViewCellH] forKey:kBaseTableViewCellH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Cells/TableViewCell" path:kBaseTableViewCellM] forKey:kBaseTableViewCellM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Cells/CollectionViewCell" path:kBaseCollectionViewCellH] forKey:kBaseCollectionViewCellH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Cells/CollectionViewCell" path:kBaseCollectionViewCellM] forKey:kBaseCollectionViewCellM];
    
    //    [definitions setObject:[self groupDefinitionWithGroup:nil path:kComponents] forKey:kComponents];
    [definitions setObject:[self groupDefinitionWithGroup:@"Components/APNSAgent" path:kAPNSAgentH] forKey:kAPNSAgentH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Components/APNSAgent" path:kAPNSAgentM] forKey:kAPNSAgentM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Components/APNSAgent" path:kAPNSAgentInternalH] forKey:kAPNSAgentInternalH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Components/APNSAgent" path:kAPNSAgentInternalM] forKey:kAPNSAgentInternalM];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Controllers" path:kBaseViewControllerH] forKey:kBaseViewControllerH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Controllers" path:kBaseViewControllerM] forKey:kBaseViewControllerM];
    [definitions setObject:[self groupDefinitionWithGroup:@"Controllers" path:kTSNavigationControllerH] forKey:kTSNavigationControllerH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Controllers" path:kTSNavigationControllerM] forKey:kTSNavigationControllerM];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Engines" path:kDataEngineH] forKey:kDataEngineH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Engines" path:kDataEngineM] forKey:kDataEngineM];
    
    [definitions setObject:[self groupDefinitionWithGroup:nil path:kImages] forKey:kImages];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Managers" path:kAuthenticationManagerH] forKey:kAuthenticationManagerH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Managers" path:kAuthenticationManagerM] forKey:kAuthenticationManagerM];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Models" path:kBaseModelH] forKey:kBaseModelH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Models" path:kBaseModelM] forKey:kBaseModelM];
    
    [definitions setObject:[self groupDefinitionWithGroup:nil path:kSDK] forKey:kSDK];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Views" path:kMaskViewH] forKey:kMaskViewH];
    [definitions setObject:[self groupDefinitionWithGroup:@"Views" path:kMaskViewM] forKey:kMaskViewM];
    
    [definitions setObject:[self groupDefinitionWithGroup:@"Supporting Files" path:kPrefixHeader] forKey:kPrefixHeader];
    
    [definitions setObject:[self groupDefinitionWithGroup:nil path:@"Podfile"] forKey:kPodfile];
    return definitions;
}

- (NSArray *)createOptions {
    NSDictionary *dict1 = @{@"Identifier" : @"universalDeviceFamily",
                            @"Units" : @{
                                    @"Universal" : @{
                                            @"Definitions" : @{
                                                    @"Base.lproj/Main.storyboard" : @{
                                                            @"Path" : @"Main_Universal.storyboard",
                                                            @"SortOrder" : @(99)
                                                            }
                                                    }
                                            },
                                    @"iPad" : @{
                                            @"Definitions" : @{
                                                    @"Base.lproj/Main.storyboard" : @{
                                                            @"Path" : @"Main_iPad.storyboard",
                                                            @"SortOrder" : @(99)
                                                            }
                                                    }
                                            },
                                    @"iPhone" : @{
                                            @"Definitions" : @{
                                                    @"Base.lproj/Main.storyboard" : @{
                                                            @"Path" : @"Main_iPhone.storyboard",
                                                            @"SortOrder" : @(99)
                                                            }
                                                    }
                                            }
                                    },
                            };
    
    NSMutableArray *options = [NSMutableArray array];
    [options addObject:dict1];
    return options;
}

- (NSDictionary *)groupDefinitionWithGroup:(NSString *)group path:(NSString *)path {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (group) {
        NSArray *groups = [group componentsSeparatedByString:@"/"];
        [dict setObject:groups forKey:@"Group"];
    }
    if (path) {
        [dict setObject:path forKey:@"Path"];
    }
    return dict;
}

@end
