package com.safia.client

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // Ensure platform view is registered
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("MFCardView", NativeCardViewFactory())
    }
}
