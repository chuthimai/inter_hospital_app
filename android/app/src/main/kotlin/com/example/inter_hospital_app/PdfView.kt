package com.example.inter_hospital_app

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView
import com.github.barteksc.pdfviewer.PDFView
import java.io.File

class PdfView(context: Context, filePath: String) : PlatformView {
    private val pdfView: PDFView = PDFView(context, null)

    init {
        val file = File(filePath)
        if (file.exists()) {
            pdfView.fromFile(file)
                .enableSwipe(true)
                .swipeHorizontal(false)
                .enableDoubletap(true)
                .load()
        }
    }

    override fun getView(): View {
        return pdfView
    }

    override fun dispose() {}
}
