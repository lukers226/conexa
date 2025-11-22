plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.conexa.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    flavorDimensions += "mode"

    productFlavors {
        create("development") {
            dimension = "mode"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "flutter_flavor", "development")
        }
        create("production") {
            dimension = "mode"
            resValue("string", "flutter_flavor", "production")
        }
    }

    defaultConfig {
        applicationId = "com.conexa.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
