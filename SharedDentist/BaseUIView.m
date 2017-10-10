#import "BaseUIView.h"
//#import "Common.h"
//#import "UIView+WhenTappedBlocks.h"

@interface BaseUIView ()

@property(nonatomic, retain) UIView *searchInputAccessoryView;

@end

@implementation BaseUIView

//-(void)dealloc
//{
//    [super dealloc];
//}

-(id)initWithFrame:(CGRect)frame rootController:(MainController *)controller
{
    self = [super initWithFrame:frame];
    if (self) {
        _controller = controller;
       // self.backgroundColor=UIColorFromRGB(0xfff6f6f6);
//        _tableView = [[UITableViewEx alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        _tableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        _tableView.dataSource = self;
//        _tableView.delegate = self;
//        
//        _tableView.backgroundColor = [UIColor clearColor] ;
//        _tableView.separatorStyle = NO;
//        [_tableView setExtraCellLineHidden:YES];
        
//        self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
//        self.tableView.separatorColor=UIColorFromRGB(0xffe5e5e5);
//        [self addSubview:_tableView];
       // [self initSearchBar];
    }
    return self;
}


//-(void)reload
//{
//    NSLog(@"play new music");
//    int height;
//    if(IOS6_PRE)
//    {
//        height=60;
//    }
//    else
//    {
//        height=40;
//    }
//    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
//    [self addSubview:view];
//}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
-(void)showToast:(NSString *)msg
{
    AppDelegate* delegate = nil;
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate showToastOnMainThread:msg];
}
@end
