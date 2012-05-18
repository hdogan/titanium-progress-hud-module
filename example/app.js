// TODO: Examples

ProgressHud = require('do.hi.progress.hud');

var win = Ti.UI.createWindow();
var HUD = ProgressHud.createProgressHud();

win.add(HUD);
HUD.show();
