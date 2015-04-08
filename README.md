# Functional test setup

## Install Appium

You can choose to install command line Appium or the GUI application.

###  Command line Appium

####Install brew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
(See [http://brew.sh/](http://brew.sh/) for more details)

####Install npm 
(npm comes packaged with node)

```
$	brew install node
```

####Install appium

```
$	npm install -g appium
```
####Start appium

```
$	appium
```

###  GUI Appium
Can be downloaded [here](http://appium.io/downloads.html)


## Running the functional tests
#### Use Xcode to build your app
#### Point the functional tests at the built app
In PolDriver.java, set APP_HOME:

```
//private static final String APP_HOME = System.getenv("HOME") + "/pol-ios/POL.app";
private static final String APP_HOME = "";
```