<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Page Content - NATURE AYURVED Admin</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
    --deep-green: rgb(30, 140, 193);;
    --leaf: #2b8a5f;
    --rust: #7a4b3a;
    --gold: #c9a25a;
    --cream: #fbf6ee;
    --paper: #f7efe6;
    --text: #2d2d2d;
    --radius: 12px;
    --shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
    --primary: var(--deep-green);
    --primary-dark: #083c23;
    --light-gray: #e8e0d5;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--cream);
    color: var(--text);
    line-height: 1.6;
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 250px;
    background: var(--deep-green);
    color: var(--cream);
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;
    z-index: 1000;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
}

.sidebar-header {
    padding: 1.5rem 1rem;
    border-bottom: 1px solid rgba(251, 246, 238, 0.1);
    text-align: center;
    background: var(--primary-dark);
}

.sidebar-header h2 {
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--gold);
}

.sidebar-menu {
    padding: 1rem 0;
}

.sidebar-menu ul {
    list-style: none;
}

.sidebar-menu li {
    margin-bottom: 0.5rem;
}

.sidebar-menu a {
    display: flex;
    align-items: center;
    padding: 0.8rem 1.5rem;
    color: rgba(251, 246, 238, 0.9);
    text-decoration: none;
    transition: all 0.3s;
}

.sidebar-menu a:hover, .sidebar-menu a.active {
    background: rgba(201, 162, 90, 0.15);
    color: var(--gold);
    border-left: 4px solid var(--gold);
}

.sidebar-menu i {
    margin-right: 0.8rem;
    font-size: 1.2rem;
    width: 20px;
    text-align: center;
}

/* Main Content */
.main-content {
    flex: 1;
    margin-left: 250px;
    padding: 1.5rem;
    width: calc(100% - 250px);
    min-height: 100vh;
}

/* Page Header */
.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    flex-wrap: wrap;
    gap: 1rem;
}

.page-header h1 {
    font-size: 1.8rem;
    color: var(--deep-green);
}

/* Page Filter Tabs */
.page-tabs {
    display: flex;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.page-tab {
    padding: 0.8rem 1.5rem;
    background: var(--paper);
    border: 2px solid var(--light-gray);
    border-radius: var(--radius);
    color: var(--text);
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
}

.page-tab:hover, .page-tab.active {
    background: var(--deep-green);
    color: white;
    border-color: var(--deep-green);
}

/* Content Cards */
.content-grid {
    display: grid;
    gap: 1.5rem;
}

.content-card {
    background: white;
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    border: 1px solid var(--light-gray);
    overflow: hidden;
}

.content-card-header {
    background: var(--paper);
    padding: 1rem 1.5rem;
    border-bottom: 1px solid var(--light-gray);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.content-card-header h3 {
    color: var(--rust);
    font-size: 1.1rem;
    margin: 0;
}

.content-card-header .section-key {
    font-size: 0.85rem;
    color: var(--deep-green);
    background: rgba(11, 86, 51, 0.1);
    padding: 0.3rem 0.8rem;
    border-radius: 20px;
}

.content-card-body {
    padding: 1.5rem;
}

.content-textarea {
    width: 100%;
    min-height: 150px;
    padding: 1rem;
    border: 1px solid var(--light-gray);
    border-radius: 8px;
    font-size: 1rem;
    line-height: 1.6;
    resize: vertical;
    font-family: inherit;
    transition: border-color 0.3s;
}

.content-textarea:focus {
    outline: none;
    border-color: var(--deep-green);
    box-shadow: 0 0 0 3px rgba(11, 86, 51, 0.1);
}

.content-card-footer {
    background: var(--cream);
    padding: 1rem 1.5rem;
    border-top: 1px solid var(--light-gray);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.last-updated {
    font-size: 0.85rem;
    color: #666;
}

.btn-save {
    background: var(--deep-green);
    color: white;
    border: none;
    padding: 0.6rem 1.5rem;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.btn-save:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
}

.btn-save:disabled {
    background: #999;
    cursor: not-allowed;
    transform: none;
}

/* Alerts */
.alert {
    padding: 1rem 1.5rem;
    border-radius: var(--radius);
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.8rem;
}

.alert-success {
    background: rgba(43, 138, 95, 0.15);
    border: 1px solid var(--leaf);
    color: var(--deep-green);
}

.alert-error {
    background: rgba(220, 53, 69, 0.15);
    border: 1px solid #dc3545;
    color: #dc3545;
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 4rem 2rem;
    background: white;
    border-radius: var(--radius);
    box-shadow: var(--shadow);
}

.empty-state i {
    font-size: 4rem;
    color: var(--light-gray);
    margin-bottom: 1rem;
}

.empty-state h3 {
    color: var(--text);
    margin-bottom: 0.5rem;
}

.empty-state p {
    color: #666;
}

/* Save Status */
.save-status {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.85rem;
    padding: 0.3rem 0.8rem;
    border-radius: 20px;
}

.save-status.saving {
    background: rgba(201, 162, 90, 0.2);
    color: var(--rust);
}

.save-status.saved {
    background: rgba(43, 138, 95, 0.2);
    color: var(--deep-green);
}

.save-status.error {
    background: rgba(220, 53, 69, 0.2);
    color: #dc3545;
}

/* Responsive */
@media (max-width: 768px) {
    .sidebar {
        width: 70px;
    }
    .sidebar-header h2, .sidebar-menu span {
        display: none;
    }
    .main-content {
        margin-left: 70px;
        width: calc(100% - 70px);
    }
    .page-header {
        flex-direction: column;
        align-items: flex-start;
    }
    .page-tabs {
        flex-wrap: wrap;
    }
}

#content{
    width:100%;
    height:300px;
}
</style>
</head>
<body>
    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h2>NATURE AYURVED</h2>
        </div>
        <nav class="sidebar-menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/dashboard"> 
                    <i class="fas fa-home"></i> 
                    <span>Dashboard</span>
                </a></li>
                
                <li><a href="${pageContext.request.contextPath}/admin/submissions"> 
                    <i class="fas fa-file"></i> <span>Submissions</span>
                </a></li>
                
                <li><a href="${pageContext.request.contextPath}/admin/submissions1"> 
                    <i class="fas fa-file-alt"></i> <span>Paper Review</span> 
                </a></li>

               <%--  <li><a href="${pageContext.request.contextPath}/admin/conferences"> 
                    <i class="fas fa-calendar"></i> <span>Conferences</span>
                </a></li> --%>

                <li><a href="${pageContext.request.contextPath}/editorial-board" target="_blank"> 
                    <i class="fas fa-users"></i> <span>Editorial Board</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/about" target="_blank"> 
                    <i class="fas fa-info-circle"></i> <span>About & Contact Us</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/admin/author-login-details"> 
                    <i class="fas fa-user-lock"></i> <span>Author Login Details</span>
                </a></li>

               <%--  <li><a href="${pageContext.request.contextPath}/admin/manage-content" class="active"> 
                    <i class="fas fa-edit"></i> <span>Page Content</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/submitArticle" target="_blank"> 
                    <i class="fas fa-upload"></i> <span>Submit Article</span>
                </a></li> --%>
                
                <li><a href="${pageContext.request.contextPath}/admin/manage-template"> 
					<i class="fas fa-edit"></i> <span>PAGE EDIT</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/gallery"> 
					<i class="fas fa-edit"></i> <span>Gallery</span>
				</a></li>

                <li><a href="${pageContext.request.contextPath}/admin/previous-volumes-issues"> 
                    <i class="fas fa-book"></i> <span>Previous Volumes And Issues</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/admin/contact-enquiries"> 
                    <i class="fas fa-envelope-open"></i> <span>Contact Enquires</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/" target="_blank"> 
                    <i class="fas fa-globe"></i> <span>Visit Website</span>
                </a></li>
                
               
				<li><a href="${pageContext.request.contextPath}/logout"> <i
						class="fas fa-sign-out-alt"></i> <span>Logout</span>
				</a></li>
			</ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="page-header">
            <h1><i class="fas fa-edit"></i> Manage Page Content</h1>
            <form action="${pageContext.request.contextPath}/admin/manage-content/reset" method="post" 
                  onsubmit="return confirm('⚠️ WARNING: This will delete ALL content and reset to defaults. Are you sure?');">
                <button type="submit" class="btn-reset" style="background: #dc3545; color: white; border: none; padding: 0.6rem 1.2rem; border-radius: 8px; font-weight: 600; cursor: pointer;">
                    <i class="fas fa-sync-alt"></i> Reset All Content
                </button>
            </form>
        </div>

        <!-- Success/Error Alerts -->
        <c:if test="${param.message != null}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                ${param.message}
            </div>
        </c:if>
        <c:if test="${param.error != null}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                ${param.error}
            </div>
        </c:if>


        <!-- Content Grid -->
        <%-- <c:choose>
            <c:when test="${empty contents}">
                <div class="empty-state">
                    <i class="fas fa-folder-open"></i>
                    <h3>No Content Found</h3>
                    <p>No editable content sections found for this page. Content will be auto-generated on first application start.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="content-grid">
                    <c:forEach items="${contents}" var="content">
                        <div class="content-card" data-id="${content.id}">
                            <div class="content-card-header">
                                <h3>${content.sectionLabel}</h3>
                                <span class="section-key">${content.sectionKey}</span>
                            </div>
                            <div class="content-card-body">
                                <textarea class="content-textarea" 
                                          data-content-id="${content.id}"
                                          data-original="${content.content}">${content.content}</textarea>
                                
                                <!-- Image Upload Section -->
                                <c:if test="${content.sectionKey.contains('image') or content.sectionKey.contains('photo') or content.sectionKey.contains('picture')}">
                                    <div class="image-upload-section" style="margin-top: 15px; padding: 15px; background: #f8f9fa; border-radius: 8px; border: 1px dashed #dee2e6;">
                                        <label style="display: block; margin-bottom: 10px; font-weight: 600; color: #495057;">
                                            <i class="fas fa-image"></i> Upload Image
                                        </label>
                                        
                                        <!-- Current Image Preview -->
                                        <c:if test="${content.imagePath != null and not empty content.imagePath}">
                                            <div style="margin-bottom: 10px;">
                                                <small style="color: #6c757d;">Current Image:</small>
                                                <div style="margin-top: 5px;">
                                                    <img src="${pageContext.request.contextPath}${content.imagePath}" 
                                                         alt="Current Image" 
                                                         style="max-width: 150px; max-height: 150px; border-radius: 5px; border: 1px solid #dee2e6;">
                                                </div>
                                            </div>
                                        </c:if>
                                        
                                        <!-- File Upload Input -->
                                        <input type="file" 
                                               class="image-upload-input" 
                                               data-content-id="${content.id}"
                                               accept="image/*"
                                               style="width: 100%; padding: 8px; border: 1px solid #ced4da; border-radius: 4px; background: white;">
                                        
                                        <!-- Upload Button -->
                                        <button class="btn-upload-image" 
                                                onclick="uploadImage(<c:out value='${content.id}'/>)"
                                                style="margin-top: 10px; background: #28a745; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer; font-size: 14px;">
                                            <i class="fas fa-upload"></i> Upload Image
                                        </button>
                                        
                                        <!-- Upload Status -->
                                        <div class="upload-status" id="upload-status-${content.id}" style="margin-top: 10px; display: none; padding: 8px; border-radius: 4px; font-size: 13px;"></div>
                                    </div>
                                </c:if>
                            </div>
                            <div class="content-card-footer">
                                <span class="last-updated">
                                    <i class="fas fa-clock"></i> 
                                    Last updated: 
                                    <c:choose>
                                        <c:when test="${content.updatedAt != null}">
                                            ${content.updatedAt}
                                        </c:when>
                                        <c:otherwise>
                                            Never
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <div style="display: flex; align-items: center; gap: 1rem;">
                                    <span class="save-status" id="status-<c:out value='${content.id}'/>" style="display: none;"></span>
                                    <button class="btn-save" onclick="saveContent(<c:out value='${content.id}'/>)">
                                        <i class="fas fa-save"></i> Save Changes
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose> --%>
        
<form action="${pageContext.request.contextPath}/admin/savetemplatecontent" method="post">        
<div style="display:flex; gap:10px; align-items:center;">

<select id="templateSelect"
        onchange="loadTemplateContent(this.value)" name="template">

    <option value="">Select Template</option>

    <c:forEach items="${templatelist}" var="template">

        <option value="${template.id}">
            ${template.name}
        </option>

    </c:forEach>

</select>

</div>
<script src="https://js.nicedit.com/nicEdit-latest.js"></script>

    
    <textarea id="content" name="contentArea">
        ${content}
    </textarea>

    <button type="submit" class="btn btn-primary">Save</button>

</form>


<script>
bkLib.onDomLoaded(function () {
    new nicEditor({
        fullPanel: true
    }).panelInstance('content');
});

function loadTemplateContent(id){

    if(id==""){
        nicEditors.findEditor('content')
                  .setContent("");
        return;
    }

    fetch('${pageContext.request.contextPath}/admin/getTemplateContent?id=' + id)
    .then(response => response.text())
    .then(data => {

        console.log(data);

        nicEditors.findEditor('content')
                  .setContent(data);

    })
    .catch(error => console.log(error));

}

</script>
    </main>

    <script>
        function saveContent(contentId) {
            const textarea = document.querySelector('textarea[data-content-id="' + contentId + '"]');
            const statusEl = document.getElementById('status-' + contentId);
            const btn = textarea.closest('.content-card').querySelector('.btn-save');
            const content = textarea.value;
        }

        function uploadImage(contentId) {
            const fileInput = document.querySelector('input[data-content-id="' + contentId + '"]');
            const statusEl = document.getElementById('upload-status-' + contentId);
            
            if (!fileInput.files || fileInput.files.length === 0) {
                showUploadStatus(statusEl, 'Please select an image file', 'error');
                return;
            }

            const file = fileInput.files[0];
            const formData = new FormData();
            formData.append('id', contentId);
            formData.append('image', file);

            // Show uploading status
            showUploadStatus(statusEl, 'Uploading image...', 'info');

            fetch('${pageContext.request.contextPath}/admin/manage-content/upload-image', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showUploadStatus(statusEl, data.message, 'success');
                    // Refresh the page to show updated image
                    setTimeout(() => {
                        location.reload();
                    }, 1500);
                } else {
                    showUploadStatus(statusEl, data.message, 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showUploadStatus(statusEl, 'Upload failed: ' + error.message, 'error');
            });
        }

        function showUploadStatus(element, message, type) {
            element.style.display = 'block';
            element.textContent = message;
            
            // Remove previous classes
            element.classList.remove('alert-success', 'alert-danger', 'alert-info');
            
            // Add appropriate class based on type
            if (type === 'success') {
                element.classList.add('alert-success');
                element.style.backgroundColor = '#d4edda';
                element.style.color = '#155724';
                element.style.borderColor = '#c3e6cb';
            } else if (type === 'error') {
                element.classList.add('alert-danger');
                element.style.backgroundColor = '#f8d7da';
                element.style.color = '#721c24';
                element.style.borderColor = '#f5c6cb';
            } else {
                element.classList.add('alert-info');
                element.style.backgroundColor = '#d1ecf1';
                element.style.color = '#0c5460';
                element.style.borderColor = '#bee5eb';
            }
        }

        function saveContent(contentId) {
            const textarea = document.querySelector('textarea[data-content-id="' + contentId + '"]');
            const statusEl = document.getElementById('status-' + contentId);
            const btn = textarea.closest('.content-card').querySelector('.btn-save');
            const content = textarea.value;

            // Show saving status
            statusEl.style.display = 'inline-flex';
            statusEl.className = 'save-status saving';
            statusEl.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
            btn.disabled = true;

            // Send AJAX request
            fetch('${pageContext.request.contextPath}/admin/manage-content/update-ajax', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'id=' + contentId + '&content=' + encodeURIComponent(content)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    statusEl.className = 'save-status saved';
                    statusEl.innerHTML = '<i class="fas fa-check"></i> Saved!';
                    textarea.dataset.original = content;
                    
                    // Update last updated time
                    const footer = textarea.closest('.content-card').querySelector('.last-updated');
                    footer.innerHTML = '<i class="fas fa-clock"></i> Last updated: Just now';
                } else {
                    statusEl.className = 'save-status error';
                    statusEl.innerHTML = '<i class="fas fa-times"></i> ' + data.message;
                }
            })
            .catch(error => {
                statusEl.className = 'save-status error';
                statusEl.innerHTML = '<i class="fas fa-times"></i> Error saving';
                console.error('Error:', error);
            })
            .finally(() => {
                btn.disabled = false;
                // Hide status after 3 seconds
                setTimeout(() => {
                    statusEl.style.display = 'none';
                }, 3000);
            });
        }

        // Warn before leaving with unsaved changes
        window.addEventListener('beforeunload', function(e) {
            const textareas = document.querySelectorAll('.content-textarea');
            let hasChanges = false;
            textareas.forEach(textarea => {
                if (textarea.value !== textarea.dataset.original) {
                    hasChanges = true;
                }
            });
            if (hasChanges) {
                e.preventDefault();
                e.returnValue = '';
            }
        });
    </script>
</body>
</html>

