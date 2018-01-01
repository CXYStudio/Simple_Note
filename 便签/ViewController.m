//
//  ViewController.m
//  便签
//
//  Created by 曹修远 on 2016/12/13.
//  Copyright © 2016年 曹修远. All rights reserved.
//

#import "ViewController.h"
NSMutableArray*memoNameArray;
NSMutableArray *dataArray;
int selectdNum;
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@property (nonatomic,strong) UIImageView *imageViewBackground;

@end

@implementation ViewController
#pragma mark -- data init --
- (void)ArrayInit{
    
    NSArray *array =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //得到文件的具体路径(默认在数组的最后一个)
    NSString *documents = [array lastObject];
    //拼接我们自己创建的文件的路径
    NSString *documentPath = [documents stringByAppendingPathComponent:@"arrayXML.xml"];
    
    
    dataArray = [NSMutableArray arrayWithContentsOfFile:documentPath];
    //第四步：准备好要存到本地的数组
    if (dataArray == nil) {
        dataArray = [NSMutableArray arrayWithObjects:@"iOS平台使用了构建Mac OS X时积累的知识，iOS平台的许多工具和技术也源自Mac OS X平台。尽管它和Mac OS X很类似，但是没有Mac OS X开发经验也可以开发iOS程序。iOS SDK提供了创建iOS应用程序所需要的环境和工具。利用iOS SDK开发应用时所用的编程语言是Objective-C。iPhone SDK包含开发、安装及运行本地应用程序所需的工具和接口。本地应用程序使用iOS系统框架和Objective-C语言进行构建，并且直接运行于iOS设备。它与web应用程序不同，一是它位于所安装的设备上，二是不管是否有网络连接它都能运行。可以说本地应用程序和其他系统应用程序具有相同地位。本地应用程序和用户数据都可以通过iTunes同步到用户计算机。",@"iOS平台使用了构建Mac OS X时积累的知识，iOS平台的许多工具和技术也源自Mac OS X平台。尽管它和Mac OS X很类似，但是没有Mac OS X开发经验也可以开发iOS程序。iOS SDK提供了创建iOS应用程序所需要的环境和工具。利用iOS SDK开发应用时所用的编程语言是Objective-C。iPhone SDK包含开发、安装及运行本地应用程序所需的工具和接口。本地应用程序使用iOS系统框架和Objective-C语言进行构建，并且直接运行于iOS设备。它与web应用程序不同，一是它位于所安装的设备上，二是不管是否有网络连接它都能运行。可以说本地应用程序和其他系统应用程序具有相同地位。本地应用程序和用户数据都可以通过iTunes同步到用户计算机。",@"iOS平台使用了构建Mac OS X时积累的知识，iOS平台的许多工具和技术也源自Mac OS X平台。尽管它和Mac OS X很类似，但是没有Mac OS X开发经验也可以开发iOS程序。iOS SDK提供了创建iOS应用程序所需要的环境和工具。利用iOS SDK开发应用时所用的编程语言是Objective-C。iPhone SDK包含开发、安装及运行本地应用程序所需的工具和接口。本地应用程序使用iOS系统框架和Objective-C语言进行构建，并且直接运行于iOS设备。它与web应用程序不同，一是它位于所安装的设备上，二是不管是否有网络连接它都能运行。可以说本地应用程序和其他系统应用程序具有相同地位。本地应用程序和用户数据都可以通过iTunes同步到用户计算机。",@"iOS平台使用了构建Mac OS X时积累的知识，iOS平台的许多工具和技术也源自Mac OS X平台。尽管它和Mac OS X很类似，但是没有Mac OS X开发经验也可以开发iOS程序。iOS SDK提供了创建iOS应用程序所需要的环境和工具。利用iOS SDK开发应用时所用的编程语言是Objective-C。iPhone SDK包含开发、安装及运行本地应用程序所需的工具和接口。本地应用程序使用iOS系统框架和Objective-C语言进行构建，并且直接运行于iOS设备。它与web应用程序不同，一是它位于所安装的设备上，二是不管是否有网络连接它都能运行。可以说本地应用程序和其他系统应用程序具有相同地位。本地应用程序和用户数据都可以通过iTunes同步到用户计算机。",@"iOS平台使用了构建Mac OS X时积累的知识，iOS平台的许多工具和技术也源自Mac OS X平台。尽管它和Mac OS X很类似，但是没有Mac OS X开发经验也可以开发iOS程序。iOS SDK提供了创建iOS应用程序所需要的环境和工具。利用iOS SDK开发应用时所用的编程语言是Objective-C。iPhone SDK包含开发、安装及运行本地应用程序所需的工具和接口。本地应用程序使用iOS系统框架和Objective-C语言进行构建，并且直接运行于iOS设备。它与web应用程序不同，一是它位于所安装的设备上，二是不管是否有网络连接它都能运行。可以说本地应用程序和其他系统应用程序具有相同地位。本地应用程序和用户数据都可以通过iTunes同步到用户计算机。", nil];
    }
    //第五步：将数组存入到指定的本地文件
    
    //第六步：可对已经存储的数组进行查询等操作
    NSArray *resultArray = [NSArray arrayWithContentsOfFile:documentPath];
    NSLog(@"%@", resultArray);
    NSLog(@"%@", documentPath);
    
    
    NSArray *arrayName =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //得到文件的具体路径(默认在数组的最后一个)
    NSString *documentsName = [arrayName lastObject];
    //拼接我们自己创建的文件的路径
    NSString *documentNamePath = [documentsName stringByAppendingPathComponent:@"arrayNameXML.xml"];
    memoNameArray = [NSMutableArray arrayWithContentsOfFile:documentNamePath];
    if (memoNameArray == nil) {
        memoNameArray = [[NSMutableArray alloc]initWithObjects:@"春天",@"夏天",@"神奇宝贝",@"Iron Man",@"有趣",nil];
    }
    
    
}

#pragma mark -- table data source --

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return [dataArray count];
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * cellID = [NSString stringWithFormat:@"cell_sec_%ld", (long)indexPath.section ];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID]; // there are more built-in styles
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.textLabel.text = [memoNameArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [dataArray objectAtIndex:indexPath.row];
    
    return cell;
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
//    
//    
//}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [dataArray removeObjectAtIndex:indexPath.row];
         // Delete the row from the data source.
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [memoNameArray removeObjectAtIndex:indexPath.row];
    }
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    
    //写入文件持久保存
    NSArray *array =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //得到文件的具体路径(默认在数组的最后一个)
    NSString *documents = [array lastObject];
    //拼接我们自己创建的文件的路径
    NSString *documentPath = [documents stringByAppendingPathComponent:@"arrayXML.xml"];
    [dataArray writeToFile:documentPath atomically:YES];
    
    NSArray *arrayName =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //得到文件的具体路径(默认在数组的最后一个)
    NSString *documentsName = [arrayName lastObject];
    //拼接我们自己创建的文件的路径
    NSString *documentNamePath = [documentsName stringByAppendingPathComponent:@"arrayNameXML.xml"];
    [memoNameArray writeToFile:documentNamePath atomically:YES];
    
}


#pragma mark -- table events --
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected %d,%d",(int)indexPath.section,(int)indexPath.row);
    selectdNum = (int)indexPath.row;
    [self performSegueWithIdentifier:@"showExistMemo" sender:self];
    
}


-(IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
//    [self reloadData];
    
}


#pragma mark -- view controller data passing --
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showExistMemo"]) {
        //indexPath
        
    }
}
- (void)reloadData{
//    [NSThread sleepForTimeInterval:0.2f];
//    [self delayMethod];
    [self.mainTableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self ArrayInit];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
