import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.10.0"))
}

android {
    namespace = "com.defusername.dash_n_go"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13113456"
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.defusername.dash_n_go"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        // Load from local.properties
        val localProperties = Properties()
        val localPropertiesFile = rootProject.file("local.properties")
        if (localPropertiesFile.exists()) {
            FileInputStream(localPropertiesFile).use { inputStream ->
                localProperties.load(inputStream)
            }
        }
        val mapsApiKey: String = localProperties.getProperty("MAPS_API_KEY") ?: ""

        // Define API Key as a resource value for AndroidManifest.xml
//        resValue("string", "MAPS_API_KEY", mapsApiKey)
        // Pass API key as a manifest placeholder
        manifestPlaceholders["MAPS_API_KEY"] = mapsApiKey
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    
    buildFeatures {
        buildConfig = true
    }

}

flutter {
    source = "../.."
}
