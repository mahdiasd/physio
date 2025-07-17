import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// خواندن local.properties برای نسخه‌بندی فلاتر
val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

// خواندن key.properties برای اطلاعات امضا
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}


android {
    namespace = "com.rose.physio"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "28.1.13356709"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
    }

    defaultConfig {
        applicationId = "com.rose.physio"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
    }

    signingConfigs {
        // ساخت کانفیگ امضای release
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as? String
            keyPassword = keystoreProperties["keyPassword"] as? String
            // بررسی وجود فایل قبل از تخصیص
            val storeFilePath = keystoreProperties["storeFile"] as? String
            if (storeFilePath != null) {
                storeFile = file(storeFilePath)
            }
            storePassword = keystoreProperties["storePassword"] as? String
        }
    }

    // تعریف ابعاد طعم‌ها (Flavor Dimensions)
    flavorDimensions.add("default")

    productFlavors {
        // تعریف طعم production
        create("production") {
            dimension = "default"
            applicationIdSuffix = ""
            manifestPlaceholders["appName"] = "Physio"
        }
        // تعریف طعم staging
        create("staging") {
            dimension = "default"
            applicationIdSuffix = ".stg"
            manifestPlaceholders["appName"] = "[STG] Physio"
        }
        // تعریف طعم development
        create("development") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["appName"] = "[DEV] Physio"
        }
    }

    buildTypes {
        // تنظیمات build type برای release
        getByName("release") {
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
            // استفاده از کانفیگ امضای ساخته شده
            signingConfig = signingConfigs.getByName("release")
        }
        // تنظیمات build type برای debug
        getByName("debug") {
            // به طور پیش‌فرض از debug signing config استفاده می‌کند
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.9.20")
}
