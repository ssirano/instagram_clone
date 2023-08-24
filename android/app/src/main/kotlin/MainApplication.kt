package com.example.instagram_clone

import android.content.Context
import io.flutter.app.FlutterApplication
import androidx.multidex.MultiDex

class MainApplication : FlutterApplication() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
}
