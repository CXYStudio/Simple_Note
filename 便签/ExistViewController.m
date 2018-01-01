//
//  ExistViewController.m
//  便签
//
//  Created by 曹修远 on 2016/12/13.
//  Copyright © 2016年 曹修远. All rights reserved.
//

#import "ExistViewController.h"
#import "ViewController.h"
extern NSMutableArray *memoNameArray;
extern NSMutableArray *dataArray;
extern int selectdNum;
@interface ExistViewController ()
@property (weak, nonatomic) IBOutlet UILabel *memoName;

@property (weak, nonatomic) IBOutlet UITextView *ExistMemoTextView;

@end

@implementation ExistViewController
- (IBAction)saveMemo:(id)sender {

//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"小提示" message:@"已经保存啦，点击返回可以回到主界面" preferredStyle:(UIAlertControllerStyleAlert)];
//    //创建按键
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"确定");
//    }];
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
    
    
    [dataArray replaceObjectAtIndex:selectdNum withObject:self.ExistMemoTextView.text];
    
    NSArray *array =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //得到文件的具体路径(默认在数组的最后一个)
    NSString *documents = [array lastObject];
    //拼接我们自己创建的文件的路径
    NSString *documentPath = [documents stringByAppendingPathComponent:@"arrayXML.xml"];
    [dataArray writeToFile:documentPath atomically:YES];
    
}
-(IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *textData = [NSString stringWithFormat:@"%@",dataArray[selectdNum]];
    NSString *textName = [NSString stringWithFormat:@"%@",memoNameArray[selectdNum]];
    self.memoName.text = textName;
    self.ExistMemoTextView.text = textData;
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
