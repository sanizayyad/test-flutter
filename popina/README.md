# YMoney Test

Popina  Test project in flutter. The project supports both Android and IOS.

## Getting Started

## How to Use

**Step 1:**

Download or clone this repo 

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses `auto_route` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**Step 4:**

This command installs the flutter app in selected device:

```
flutter install 
```

**Step 5:**

This command compiles to release mode:

```
flutter run --release 
```

## Project Features:

* Orders Screen
* Detailed Order Screen
* Error Screen
* Routing

### Libraries & Tools Used

* Stacked - MVVM Architecture
* Auto route - Navigation
* Retrofit - Network
* Flutter_dotenv - Flavoring
* Logger - Logging


## How to deploy on playstore

1. Add a launcher icon. Let's first start off by setting a launcher icon. This can be done at this
   [site](https://romannurik.github.io/AndroidAssetStudio/). I'll name the icon, "icon_logo.png". Once you've created what
   the launcher icon, create an asset folder in your project directory and put your icon in it. We'll be using one of
   flutter packages called flutter_launcher_icons to change the app icon. In your pubspec.yaml file, add/update the
   following lines appropriately. Remember that indentation is very important for yaml files.

```
dev_dependencies:
flutter_launcher_icons: "^0.9.0"

flutter_icons:
android: "launcher_icon"
ios: true
image_path: "assets/icon_logo.png"
```

And then, run this command in terminal at your project directory and your app launcher icon will change.

```
flutter pub clean && flutter pub get && flutter pub run flutter_launcher_icons:main
```

2. Change the name of the App & Bundle. We'll be running some terminal commands to make this happen, using a flutter
   package called [rename](https://pub.dev/packages/rename). You can set your app name to whatever you want, with any
   language. your bundleId can also be anything, but the typical format is com.companyname.appname.

```
flutter pub global activate rename
flutter pub global run rename --appname YourAppName
flutter pub global rename --bundleId com.company.appname
```

3. key.properties. Now let's create a file called key.properties in the android directory, in the same level as
   local.properties. Inside, copy and paste the following four lines of code and adjust according to your wants.
   storePassword and keyPassword are usually the same. the value for storeFile can change to wherever you put your
   keystore in the next step.

```
storePassword=pw
keyPassword=pw
keyAlias=upload
storeFile=../app/upload-keystore.jks 
``` 

4. Generating key. This section is divided into two, depending on whether your developing device is Windows or Mac.

   Windows Copy and adjust the following code to your appropriate directories. Run it on cmd. First address is where
   your java keytool lies, and the second address after -keystore is where you want to download the key, as well as its
   name.

```
C:\\"Program Files"\Android\\"Android Studio"\jre\bin\keytool -genkeypair -v -keystore C:\Users\Administrator\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Mac It's easier for Mac users, since you can simply just copy and paste the following code to the terminal and you're
set.

```
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Next thing I would suggest you do is to move the key to where your app resides: inside android/app.

5. Update .gitignore Since we've now added key.properties and our key into the app, we don't want those to be uploaded
   into GitHub. In our .gitignore file inside the android directory, you can simply add key.properties and
   app/upload-keystore.jks to prevent that from happening.

6. Update AndroidManifest and build.gradle. In your android/src directory, there are three AndroidManifest.xml files. In
   the one in main, make sure that the following codes are added. Remember that indentations are very important in xml
   files. Add the following before the android block:

```
 def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   android {
         ...
   }
```

Find and replace the buildTypes block with the following:

```
 signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }

```

when you're done with releasing, return it back to signingConfigs.debug so that you can debug and develop.

7. Review your app. Read through the
   documentation(https://flutter.dev/docs/deployment/android#reviewing-the-app-manifest) to see if you didn't miss any
   app-breaking mistakes to be fixed.

8. Create app bundle. We are almost done! Now that our app is ready to be deployed, we will create an app bundle to
   upload to Play Console. Remember to run the following code in the project directory.

```
flutter build appbundle
```

Your app bundle will now be located at [project]/build/app/outputs/bundle/release/app.aab.

9. Play Console. At the [Play Console](https://play.google.com/store/apps), create a developer account and create a new
   app. Upload your app bundle you've created above at the Production tab. Once you do that, Play Store is great in
   telling what needs to be done to successfully publish an app. Fill in all of the information until you can submit for
   approval. Once it is approved, your app will be deployed to Play Store.

10. Updating your app. After editing or adding functionalities to your app, you'll have to update the version of the
    app. Play Store won't accept the same version number to be uploaded. Therefore, we have to go to pubspec.yaml and
    update the version of your app. Flutter documentation for version control is somewhat confusing. Basically, 1.0.0 is
    the version number and the number after + is the build number. Whenever there is a minor update, you should update
    the version as the following: 1.0.1+2. The next iteration will be 1.0.2+3, and so forth. Then, you'll build the app
    again and create another app bundle to post on Play Console. You can now add another version there.


## How to deploy on app store

1. App & BundleId Naming. We'll be running some terminal commands to make this happen, using a flutter package called
   [rename](https://pub.dev/packages/rename). You can set your app name to whatever you want, with any language. your
   bundleId can also be anything, but the typical format is com.companyname.appname.

```
flutter pub global activate rename
flutter pub global run rename --appname YourAppName
flutter pub global rename --bundleId com.company.appname
```

2. Podfile. In the flutter project/ios directory, open a file named Podfile. Uncomment line 2, and change the iOS
   platform target to whichever is required for your app. '9.0' should be sufficient for most cases. At the bottom of
   podfile, update the block for post_install to the following and match the 'IPHONEOS_DEPLOYMENT_TARGET' to the version
   you chose for the line 2.

```
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end
```

You can then click on 'Open iOS module in Xcode' to open the project in Xcode. If you're opening the project from Xcode,
open project/ios directory to open Runner.xcworkspace file.

3. Runner configuration. In the general tab, make sure all of the values are correct. We've changed the name and
   bundleId at step 1, so the Display Name, Bundle ID should have changed accordingly. Make sure the Version and Build
   is same as found in pubspec.yaml. Version would be the first three numbers (i.e. 1.0.0) and the build would be the
   number after the '+' sign. Set the iOS Version in Deployment Info to the one you set on step 2. In the Signing &
   Capabilities tab, make sure 'Automatically manage signing' is marked, and select your team. If you already have an
   App Store Developer Account, it will automatically show.

4. Info.plist configuration. This section is quite simple, just make sure the Bundle display name and Bundle name is
   correct.

5. Update the launcher icon. You can create an icon of your design at this
   [site](https://romannurik.github.io/AndroidAssetStudio/). Once you do create one, Apple requires an iconset, so go to
   [link](https://appicon.co/) and create an iconset with the icon you've created. Once you download the iconset, there
   should be a folder named Assets.xcassets, which contains another folder, but with the name AppIcon.appiconset. Now go
   back to Xcode and on the left panel, you should be able to find a folder named Assets.xcassets. It contains two
   files: AppIcon and LaunchImage. Delete AppIcon and drag/drop the Appicon.appiconset you downloaded. Now you have an
   iconset of your icon!

6. Identifier. Now let's head to
   [identifiers](https://idmsa.apple.com/IDMSWebAuth/signin?appIdKey=891bd3417a7776362562d2197f89480a8547b108fd934911bcbea0110d07f757&path=%2Faccount%2Fresources%2Fidentifiers%2Flist&rv=1)
   . In the identifiers tab, you should be able to see a number of identifiers that you've created (none, if you
   haven't). We'll create a new identifier for our app. Since flutter only supports iOS and macOS, do not check tvOS,
   and fill in the rest as you've created in the previous steps. Make sure that the Bundle ID is the same as you've set
   in the previous steps.

7. App Store Connect Let's now actually create an app in App Store by adding it in [App Store
   Connect](https://appstoreconnect.apple.com/apps). Name and BundleID should match the Runner's information and SKU can
   be anything, but many just use their display name in one word. Fill in all of the information that you can, including
   the ones on the left panel.

8. Build ipa and upload. Open terminal and use the following command at the project directory.

```
flutter build ipa
```

In the process, you'll be asked to type your password a lot. This password is simply your device's password. Since it
will constantly pop up, a neat trick is to click 'Always Allow' :)
Now in Xcode, open a new file named Runner.xcarchive in the project/build/ios/archive directory. Before you distribute
it, validate the app first to make sure it runs safely and correctly. If it runs smoothly, then distribute it. Since we
set automatic signing, there's not much for us to do then to wait until it is pushed to Apple server. Once it is
finished, go back to App Store Connect and you should be able to select the build. Remember to submit it so that Apple
can approve your app. Within 24-48 hours, your app will be approved and searchable in App Store!

9. iOS Screenshot dimensions. When deploying, App Store Connect will require you to put in some screenshots of your app
   with several dimensions: 5.5, 6.5, 12.9. Capturing screenshots of the following devices will suffice. From my
   experience, the required screenshots for iPad Pro 2nd generation can be used for iPad Pro 3rd generation, and vice
   versa.

```
5.5 - iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus 
6.5 - iPhone XS Pro Max, iPhone 11 Max 
12.9 - iPad 12.9 inch 5th generation
```

10. Updating your app. Remember that this still is a flutter app and all of the edits will be done in flutter itself.
    Therefore, we have to go to pubspec.yaml and update the version of your app. Flutter documentation for version
    control is somewhat confusing. Basically, 1.0.0 is the version number and the number after + is the build number.
    Whenever there is a minor update, you should update the version as the following: 1.0.1+2. The next iteration will
    be 1.0.2+3, and so forth. Then, you'll build again, validate the app, distribute it, and update your build at App
    Store Connect.


That sums up on how to publish an app on PlayStore and App Store for flutter apps

## Conclusion

I will be happy to answer any questions that you may have on this project.