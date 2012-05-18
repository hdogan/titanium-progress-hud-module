Appcelerator Titanium Progress HUD Module for iOS
=================================================

This is a Progress HUD module ([MBProgressHUD](https://github.com/jdg/MBProgressHUD) Titanium binding) for iOS development by Hidayet Dogan.
[MBProgressHUD](https://github.com/jdg/MBProgressHUD) class has been used. Thanks to [Matej Bukovinski](https://github.com/matej) for his work.

Requirements:
-------------
Minimum Titanium SDK version is **2.0.1GA2**

Installation from Source:
-------------------------

1. Run `build.py` which creates module distribution zip file.
2. Copy or unzip the zip file into your Titanium SDK folder.

Installation from Distribution:
-------------------------------

1. Grap the zip file from [downloads section](https://github.com/hdogan/titanium-progress-hud-module/downloads).
2. Copy or unzip the zip file into your Titanium SDK folder.

Registering Module:
-------------------

Edit your project tiapp.xml file and include:

```
<modules>
    <module version="0.1" platform="iphone">do.hi.progress.hud</module>
</modules>
```

or use TiApp Editor on Titanium Studio to add module.

Basic Usage:
------------

```JavaScript
// Fullscreen Example
ProgressHUD = require('do.hi.progress.hud');

var HUD = ProgressHud.createProgressHud({
    text: 'Loading...',
    fullscreen: true
});

HUD.setGradientBackground(true);

// Fired when Progress HUD has been completely hidden.
HUD.addEventListener('hidden', function(e) {
    alert('Progress HUD has been vanished!');
});

// You don't need to attach HUD to window or view. Just show it.
HUD.show({
    animated: true
});

HUD.hide({
    animated: true,
    after: 5
});

// Progress HUD attached to view
ProgressHud = require('do.hi.progress.hud');

var win = Ti.UI.createWindow();

var HUD = ProgressHud.createProgressHud({
    text: 'Loading...'
    detailsText: 'Loading assets.'
});

win.add(HUD);

HUD.show({
    animated: true,
    type: 'zoom'
});
```

TODO:
-----
* `text` and `detailsText` color
* Documentation
* Examples

License:
--------

GNU General Public License, Version 3.0

Copyright:
----------
Copyright (c) 2012 by Hidayet Dogan. All rights reserved.
