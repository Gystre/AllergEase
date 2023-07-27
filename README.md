# AllergEase

Mobile app written in flutter. Given your allergies suggest some recipes for food that are suitable

## Steps to ship to android app store

https://www.shohruhak.com/tech/how_to_publish_flutter_app_on_play_store_beginner_guide/

### 1. Create key.properties file

In the android folder of the project, create a file called key.properties and add the following lines to it. Replace the password with your own password.

```bash
storePassword=changethis
keyPassword=changethis
keyAlias=upload
storeFile=../app/upload-keystore.jks
```

### 2. Create a key store file

Run this command and place the generated jks file in the app folder of the android project. If you don't have this file, download jdk and run it from the bin folder.

```bash
keytool -genkey -v -keystore upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias
upload
```

### 3. modify build.gradle file located at android/app/build.gradle

Check the linked tutorial for the exact changes to make

### 4. Test the app

Build in debug mode and test on vm to see if anything broke

### 5.Build app bundle

```bash
flutter build appbundle
```

### 6. Create app on play.google.com/console

Go the website and create a new app

#### Settings

- upload compiled app bundle
- set up privacy policy
- set up ads setting
- set up content rating
- set up target audience

#### Text

- short description (max 80 characters)
- full description (max 4000 characters)

#### Icons

- app icon 512x512
- feature graphic 1024x500
- 2-8 phone screenshots (can reuse for tablet screenshots) 16:9 aspect ratio, each side between 320px and 3840px
