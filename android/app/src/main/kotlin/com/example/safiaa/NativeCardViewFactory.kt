package com.safia.client

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.StandardMessageCodec

class NativeCardViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, id: Int, args: Any?): PlatformView {
        return NativeCardView(context)
    }
}

class NativeCardView(context: Context?) : PlatformView {
    private val view: View = View(context)

    override fun getView(): View {
        return view
    }

    override fun dispose() {}
}
