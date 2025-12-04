package com.example.inter_hospital_app

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class PdfViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        val params = args as? Map<String, Any>
        val filePath = params?.get("filePath") as? String ?: ""
        return PdfView(context, filePath)
    }
}