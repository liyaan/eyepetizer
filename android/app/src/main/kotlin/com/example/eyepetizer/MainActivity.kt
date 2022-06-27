package com.example.eyepetizer

import android.R
import android.os.Build
import android.os.Bundle;
import android.view.View
import android.view.Window
import android.view.WindowInsets

import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;

import org.devio.flutter.splashscreen.SplashScreen;
import androidx.core.content.ContextCompat

import androidx.core.view.ViewCompat

class MainActivity: FlutterActivity() {
    override fun onCreate(@Nullable savedInstanceState: Bundle?) {
        SplashScreen.show(this, true)
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val window: Window = window
            val decorView: View = window.decorView
            decorView.setOnApplyWindowInsetsListener { v, insets ->
                val defaultInsets: WindowInsets = v.onApplyWindowInsets(insets)
                defaultInsets.replaceSystemWindowInsets(
                    defaultInsets.getSystemWindowInsetLeft(),
                    0,
                    defaultInsets.getSystemWindowInsetRight(),
                    defaultInsets.getSystemWindowInsetBottom()
                )
            }
            ViewCompat.requestApplyInsets(decorView)
            //将状态栏设成透明，如不想透明可设置其他颜色
            window.setStatusBarColor(ContextCompat.getColor(this, R.color.transparent))
        }
    }
}
