package com.example.neweffortmani

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "flavor"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "getFlavor") {

                    // Read flavor from Android string resource
                    val flavor = resources.getString(
                        resources.getIdentifier("flutter_flavor", "string", packageName)
                    )

                    result.success(flavor)

                } else {
                    result.notImplemented()
                }
            }
    }
}
