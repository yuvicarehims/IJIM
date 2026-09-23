<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>PDF Viewer - ${article.title}</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: Arial, sans-serif;
                    background: #f5f5f5;
                    overflow: hidden;
                }

                .pdf-container {
                    width: 100%;
                    height: 100vh;
                    display: flex;
                    flex-direction: column;
                }

                .pdf-header {
                    background: linear-gradient(135deg, #0b5633, #2b8a5f);
                    color: white;
                    padding: 15px 20px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                    z-index: 1000;
                }

                .pdf-header h2 {
                    font-size: 1.2rem;
                    font-weight: 600;
                    margin: 0;
                    flex: 1;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                }

                .pdf-header-actions {
                    display: flex;
                    gap: 10px;
                    align-items: center;
                }

                .pdf-header-btn {
                    background: rgba(255, 255, 255, 0.2);
                    border: none;
                    color: white;
                    padding: 8px 16px;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 0.9rem;
                    font-weight: 600;
                    transition: all 0.3s ease;
                    display: inline-flex;
                    align-items: center;
                    gap: 6px;
                }

                .pdf-header-btn:hover {
                    background: rgba(255, 255, 255, 0.3);
                    transform: translateY(-1px);
                }

                .pdf-header-btn.download {
                    background: #e74c3c;
                }

                .pdf-header-btn.download:hover {
                    background: #c0392b;
                }

                .pdf-viewer-container {
                    flex: 1;
                    width: 100%;
                    overflow: auto;
                    background: #525252;
                    position: relative;
                    display: flex;
                    justify-content: center;
                    align-items: flex-start;
                    padding: 20px;
                }

                .pdf-viewer-canvas {
                    background: white;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
                    margin: 0 auto;
                }

                .pdf-loading {
                    color: white;
                    font-size: 1.2rem;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    height: 100%;
                    gap: 20px;
                }

                .pdf-loading-spinner {
                    border: 4px solid rgba(255, 255, 255, 0.3);
                    border-top: 4px solid white;
                    border-radius: 50%;
                    width: 50px;
                    height: 50px;
                    animation: spin 1s linear infinite;
                }

                @keyframes spin {
                    0% {
                        transform: rotate(0deg);
                    }

                    100% {
                        transform: rotate(360deg);
                    }
                }

                .pdf-controls {
                    position: fixed;
                    bottom: 20px;
                    left: 50%;
                    transform: translateX(-50%);
                    background: rgba(0, 0, 0, 0.7);
                    padding: 10px 20px;
                    border-radius: 25px;
                    display: flex;
                    gap: 15px;
                    align-items: center;
                    z-index: 1001;
                }

                .pdf-control-btn {
                    background: rgba(255, 255, 255, 0.2);
                    border: none;
                    color: white;
                    padding: 8px 15px;
                    border-radius: 20px;
                    cursor: pointer;
                    font-size: 0.9rem;
                    transition: all 0.3s ease;
                }

                .pdf-control-btn:hover {
                    background: rgba(255, 255, 255, 0.3);
                }

                .pdf-page-info {
                    color: white;
                    font-size: 0.9rem;
                    padding: 0 10px;
                }

                @media (max-width: 768px) {
                    .pdf-header {
                        padding: 12px 15px;
                    }

                    .pdf-header h2 {
                        font-size: 1rem;
                    }

                    .pdf-header-btn {
                        padding: 6px 12px;
                        font-size: 0.85rem;
                    }
                }
            </style>
        </head>

        <body>
            <div class="pdf-container">
                <div class="pdf-header">
                    <h2>${article.title}</h2>
                    <div class="pdf-header-actions">
                        <button class="pdf-header-btn download" onclick="downloadPdf()">
                            <i class="fas fa-download"></i> Download
                        </button>
                        <button class="pdf-header-btn" onclick="window.print()">
                            <i class="fas fa-print"></i> Print
                        </button>
                        <button class="pdf-header-btn" onclick="window.close()">
                            <i class="fas fa-times"></i> Close
                        </button>
                    </div>
                </div>
                <div class="pdf-viewer-container" id="pdfViewerContainer">
                    <div class="pdf-loading" id="pdfLoading">
                        <div class="pdf-loading-spinner"></div>
                        <div>Loading PDF...</div>
                    </div>
                    <canvas id="pdfCanvas" class="pdf-viewer-canvas" style="display: none;"></canvas>
                </div>
                <div class="pdf-controls" id="pdfControls" style="display: none;">
                    <button class="pdf-control-btn" onclick="previousPage()" id="prevBtn">
                        <i class="fas fa-chevron-left"></i> Previous
                    </button>
                    <span class="pdf-page-info">
                        Page <span id="pageNum">1</span> of <span id="pageCount">-</span>
                    </span>
                    <button class="pdf-control-btn" onclick="nextPage()" id="nextBtn">
                        Next <i class="fas fa-chevron-right"></i>
                    </button>
                    <button class="pdf-control-btn" onclick="zoomIn()">
                        <i class="fas fa-search-plus"></i> Zoom In
                    </button>
                    <button class="pdf-control-btn" onclick="zoomOut()">
                        <i class="fas fa-search-minus"></i> Zoom Out
                    </button>
                </div>
            </div>

            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
            <script src="${pageContext.request.contextPath}/dist/pdf_loader.bundle.js"></script>
            <script src="${pageContext.request.contextPath}/dist/pdf.bundle.js"></script>
            <script>
                // Wait for PDF.js to load
                let pdfjsLib = null;
                let pdfDoc = null;
                let pageNum = 1;
                let pageRendering = false;
                let pageNumPending = null;
                let scale = 1.5;
                const canvas = document.getElementById('pdfCanvas');
                const ctx = canvas.getContext('2d');
                const pdfUrl = '${pageContext.request.contextPath}${pdfUrl}';

                // Check for PDF.js library (could be pdfjsLib, pdfjs, or window.pdfjs)
                function getPdfJsLib() {
                    if (typeof pdfjsLib !== 'undefined') return pdfjsLib;
                    if (typeof pdfjs !== 'undefined') return pdfjs;
                    if (typeof window.pdfjs !== 'undefined') return window.pdfjs;
                    if (typeof window.pdfjsLib !== 'undefined') return window.pdfjsLib;
                    return null;
                }

                // Initialize PDF.js after scripts load
                function initPdfViewer() {
                    pdfjsLib = getPdfJsLib();

                    if (!pdfjsLib) {
                        console.error('PDF.js library not found');
                        document.getElementById('pdfLoading').innerHTML =
                            '<div style="color: #ff6b6b;">PDF.js library not loaded. Please ensure pdf_loader.bundle.js and pdf.bundle.js are available.</div>';
                        return;
                    }

                    // Set worker if available
                    if (pdfjsLib.GlobalWorkerOptions) {
                        pdfjsLib.GlobalWorkerOptions.workerSrc = '${pageContext.request.contextPath}/dist/pdf.worker.min.js';
                    }

                    // Load PDF
                    loadPdf();
                }

                function loadPdf() {
                    pdfjsLib.getDocument(pdfUrl).promise.then(function (pdf) {
                        pdfDoc = pdf;
                        document.getElementById('pageCount').textContent = pdf.numPages;
                        document.getElementById('pdfLoading').style.display = 'none';
                        document.getElementById('pdfCanvas').style.display = 'block';
                        document.getElementById('pdfControls').style.display = 'flex';
                        renderPage(pageNum);
                    }).catch(function (error) {
                        console.error('Error loading PDF:', error);
                        document.getElementById('pdfLoading').innerHTML =
                            '<div style="color: #ff6b6b;">Error loading PDF: ' + error.message + '<br><a href="' + pdfUrl + '" download style="color: #4ecdc4; text-decoration: underline;">Download instead</a></div>';
                    });
                }

                function renderPage(num) {
                    pageRendering = true;
                    pdfDoc.getPage(num).then(function (page) {
                        const viewport = page.getViewport({ scale: scale });
                        canvas.height = viewport.height;
                        canvas.width = viewport.width;

                        const renderContext = {
                            canvasContext: ctx,
                            viewport: viewport
                        };

                        const renderTask = page.render(renderContext);

                        renderTask.promise.then(function () {
                            pageRendering = false;
                            if (pageNumPending !== null) {
                                renderPage(pageNumPending);
                                pageNumPending = null;
                            }
                        });
                    });

                    document.getElementById('pageNum').textContent = num;
                    updateButtons();
                }

                function queueRenderPage(num) {
                    if (pageRendering) {
                        pageNumPending = num;
                    } else {
                        renderPage(num);
                    }
                }

                function previousPage() {
                    if (pageNum <= 1) return;
                    pageNum--;
                    queueRenderPage(pageNum);
                    canvas.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }

                function nextPage() {
                    if (pageNum >= pdfDoc.numPages) return;
                    pageNum++;
                    queueRenderPage(pageNum);
                    canvas.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }

                function zoomIn() {
                    scale += 0.25;
                    queueRenderPage(pageNum);
                }

                function zoomOut() {
                    if (scale <= 0.5) return;
                    scale -= 0.25;
                    queueRenderPage(pageNum);
                }

                function updateButtons() {
                    document.getElementById('prevBtn').disabled = (pageNum <= 1);
                    document.getElementById('nextBtn').disabled = (pageNum >= pdfDoc.numPages);
                }

                function downloadPdf() {
                    const downloadUrl = '${pageContext.request.contextPath}/download/${article.id}';
                    const link = document.createElement('a');
                    link.href = downloadUrl;
                    link.download = 'article_${article.id}.pdf';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                }

                // Keyboard navigation
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'ArrowLeft') {
                        previousPage();
                    } else if (e.key === 'ArrowRight') {
                        nextPage();
                    }
                });

                // Initialize when page loads
                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', initPdfViewer);
                } else {
                    // If scripts are already loaded, wait a bit for them
                    setTimeout(initPdfViewer, 100);
                }
            </script>
        </body>

        </html>