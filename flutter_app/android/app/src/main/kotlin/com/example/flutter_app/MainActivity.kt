package com.example.flutter_app

import android.os.Bundle
import android.widget.Button
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("<platform-view-type>", NativeViewFactory())
    }

//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_main)
//
//
//        /**----------------Configuration Flutter---------------*/
//        val flutterEngine = FlutterEngine(this)
//        flutterEngine.dartExecutor.executeDartEntrypoint(
//            DartExecutor.DartEntrypoint.createDefault()
//        )
//
//        FlutterEngineCache
//            .getInstance()
//            .put("my_engine_id", flutterEngine)
//
//
//        var button = findViewById<Button>(R.id.button)
//        button.setOnClickListener {
//
//            val intent = CustomFlutterActivy
//                .withCachedEngine("my_engine_id")
//                .build(this@MainActivity)
//            startActivity(intent)
//
//        }
//        /**---------------------------------------------------*/
//    }
}
