import java.util.Properties  // برای Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// لود کردن key.properties
val localProperties = Properties()
val localPropertiesFile = rootProject.file("key.properties")
if (localPropertiesFile.exists()) {
    localProperties.load(localPropertiesFile.inputStream())
} else {
    throw IllegalArgumentException("key.properties not found at ${localPropertiesFile.absolutePath}. Create it in android/ with storeFile, keyAlias, storePassword, keyPassword.")
}

android {
    namespace = "com.example.physio"
    compileSdk = flutter.compileSdkVersion
//    ndkVersion = "28.0.12674087"
    ndkVersion = "28.1.13356709"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.rose.physio"  // منحصربه‌فرد نگه دارید
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true  // اضافه شد: جلوگیری از خطای 64K methods
    }

    signingConfigs {
        create("release") {
            val storeFilePath = localProperties.getProperty("storeFile")
                ?: throw IllegalArgumentException("storeFile missing in key.properties")

            storeFile = rootProject.file(storeFilePath)  // مسیر نسبی نسبت به ریشه پروژه (physio/) – حالا درست کار می‌کنه!
            storePassword = localProperties.getProperty("storePassword")
                ?: throw IllegalArgumentException("storePassword missing in key.properties")
            keyAlias = localProperties.getProperty("keyAlias")
                ?: throw IllegalArgumentException("keyAlias missing in key.properties")
            keyPassword = localProperties.getProperty("keyPassword")
                ?: throw IllegalArgumentException("keyPassword missing in key.properties")
            enableV1Signing = true
            enableV2Signing = true
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}