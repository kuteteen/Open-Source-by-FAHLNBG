#include "CheatsRootListController.h"
#import <spawn.h>

@implementation CheatsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

//•••••••••• Donate ••••••••
	- (void) donate {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"App Cheats bởi TTJB Team"
	message:@"Cám ơn đã sử dụng sản phẩm của TTJB Team \n Team luôn mang đến những thủ thuật hay và hứu ích \n Hãy Ủng Hộ Team để có nhiều Thủ thuật hơn nhé :)"
	preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *paypalBtn = [UIAlertAction actionWithTitle:@"📮Via Paypal : @fahlnbg "
	style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://paypal.me/fahlnbg"]];
	}];
UIAlertAction *momoBtn = [UIAlertAction actionWithTitle:@"📮Via Momo : 0392749479 "
	style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"momo://"]];
	}];

	UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"Cancel"
	style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
		//nothing lol
	}];

	[alert addAction:paypalBtn];
[alert addAction:momoBtn];
	[alert addAction:cancelBtn];

	[self presentViewController:alert animated:YES completion:nil];
}

		//•••••••••Twitter button••••••••
	- (void) twitter {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/fahlnbg"]];
	}

		//•••••••••Mail button••••••••
	- (void) mail {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"mailto://fahlnbg@gmail.com"]];
	}

	//••••••••••Respring button•••••••••••••


-(void)loadView{
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)]; 
}


- (void) respring {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Respring"
	message:@"Bạn chắc chứ "
	preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *respringBtn = [UIAlertAction actionWithTitle:@"Ngay bây giờ"
	style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		pid_t pid;
		int status;
		const char* args[] = {"killall", "SpringBoard", NULL};
		posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char*
		const*)args, NULL);
		waitpid(pid, &status, WEXITED);
	}];

	UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"Không !!!"
	style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
		//nothing lol
	}];

	[alert addAction:respringBtn];
	[alert addAction:cancelBtn];

	[self presentViewController:alert animated:YES completion:nil];
}

@end



