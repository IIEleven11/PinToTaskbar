# Pin to taskbar 

*Pin to Taskbar allows a Windows 11 user to pin anything to their taskbar by simply right clicking it and then selecting "pin to taskbar".*


## Installation

* Download the .bat script
* Save this `PinToTaskbar.bat` file to a convenient location like `C:\Scripts`.
* Open the Registry Editor (regedit.exe) and navigate to: `HKEY_CLASSES_ROOT\batfile\shell`
* Right-click on the `shell` key, select New > Key and name it `pintotaskbar`.
* With the new `pintotaskbar` key selected, double-click the `(Default)` value in the right pane and set its data to `Pin to &Taskbar`.
* Right-click on the `pintotaskbar` key, select New > Key and name it `command`.
* With the new `command` key selected, double-click the `(Default)` value and set its data to: `"C:\Scripts\PinToTaskbar.bat" "%1"` (Adjust the path if you saved the .bat file somewhere else)
* Exit Registry Editor. **Note: You do not need to double click and run the .bat file on its own. The bat file is used only when you choose to pin to taskbar from the context menu.**

![1710669496112](image/README/1710669496112.png)

![1710669508684](image/README/1710669508684.png)
