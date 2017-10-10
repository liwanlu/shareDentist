#import <UIKit/UIKit.h>
#import "MainController.h"
//#import "Constants.h"
//#import "UITableViewEx.h"
//#import "ArcBulidingConfig.h"
#import "BaseViewController.h"
#import "AppDelegate.h"

@interface BaseUIView : UIView<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    MainController *_controller;
   // UISearchBar *_searchBar;
    
}
@property(nonatomic,retain) NSMutableArray *dataSource;
-(void) beginGetDatas;
//@property(nonatomic, readonly) UITableViewEx *tableView;
@property(nonatomic, assign) BOOL searchBarInTopBar;
-(id)initWithFrame:(CGRect)frame rootController:(BaseViewController *)controller;
-(void)reload;
-(void) onSearchKeyWordChange:(NSString *)keyword;
-(void) showToast:(NSString *)msg;
@end
