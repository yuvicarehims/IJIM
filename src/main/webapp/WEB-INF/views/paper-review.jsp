<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Paper Review - AYUSCRIPT</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>

  <style>
    :root {
      --deep-green: #0b5633;
      --leaf: #2b8a5f;
      --rust: #7a4b3a;
      --gold: #c9a25a;
      --cream: #fbf6ee;
      --paper: #f7efe6;
      --text: #2d2d2d;
      --max-width: 1200px;
      --radius: 12px;
      --shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
      --primary: var(--deep-green);
      --primary-dark: #083c23;
      --primary-light: var(--leaf);
      --secondary: var(--rust);
      --success: var(--leaf);
      --warning: var(--gold);
      --info: #4a7c59;
      --light: var(--paper);
      --dark: var(--text);
      --gray: #6b6b6b;
      --light-gray: #e8e0d5;
      --white: var(--cream);
    }

    * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    body { background-color: var(--cream); color: var(--text); line-height: 1.6; display: flex; min-height: 100vh; }

    /* Sidebar */
    .sidebar { width: 250px; background: var(--deep-green); color: var(--cream); height: 100vh; position: fixed; transition: all 0.3s; z-index: 1000; box-shadow: var(--shadow); }
    .sidebar-header { padding: 1.5rem 1rem; border-bottom: 1px solid rgba(251,246,238,0.1); text-align:center; background: var(--primary-dark); }
    .sidebar-header h2 { font-size:1.5rem; font-weight:600; color:var(--gold); }
    .sidebar-menu { padding:1rem 0; height: calc(100vh - 80px); overflow-y:auto; }
    .sidebar-menu ul { list-style:none; }
    .sidebar-menu li { margin-bottom:0.5rem; }
    .sidebar-menu a { display:flex; align-items:center; padding:0.8rem 1.5rem; color: rgba(251,246,238,0.9); text-decoration:none; transition: all 0.3s; }
    .sidebar-menu a:hover, .sidebar-menu a.active { background: rgba(201,162,90,0.15); color: var(--gold); border-left: 4px solid var(--gold); }
    .sidebar-menu i { margin-right:0.8rem; font-size:1.2rem; width:20px; text-align:center; }

    /* Main Content */
    .main-content { flex:1; margin-left:250px; padding:1.5rem; transition: all 0.3s; background: var(--cream); }

    /* Top Bar */
    .top-bar { display:flex; justify-content:space-between; align-items:center; background:var(--paper); padding:1rem 1.5rem; border-radius:var(--radius); box-shadow:var(--shadow); margin-bottom:1.5rem; border:1px solid var(--light-gray); }
    .search-box { display:flex; align-items:center; background:var(--cream); border-radius:30px; padding:0.5rem 1rem; width:300px; border:1px solid var(--light-gray); }
    .search-box input { border:none; background:transparent; outline:none; width:100%; padding:0.3rem; color:var(--text); }
    .search-box input::placeholder { color:var(--gray); }
    .user-info { display:flex; align-items:center; gap:1rem; }
    .user-details { text-align:right; }
    .user-details .user-name { font-weight:600; color:var(--deep-green); }
    .user-details .user-role { font-size:0.8rem; color:var(--rust); }
    .user-avatar { width:40px; height:40px; border-radius:50%; background:var(--deep-green); color:var(--gold); display:flex; align-items:center; justify-content:center; font-weight:bold; border:2px solid var(--gold); }

    /* Paper Review Content */
    .paper-review-content { max-width:1200px; margin:0 auto; background:var(--paper); padding:2rem; border-radius:var(--radius); box-shadow:var(--shadow); border:1px solid var(--light-gray); }
    h1 { text-align:center; color:var(--deep-green); margin-bottom:2rem; font-size:2rem; font-weight:600; }
    h3 { margin:0; padding-bottom:10px; color:var(--deep-green); font-size:1.3rem; border-bottom:2px solid var(--gold); display:inline-block; }
    .content-area { margin-top:2rem; padding:1.5rem; border:1px solid var(--light-gray); border-radius:var(--radius); background:var(--cream); }
    .form-container { margin-top:1.5rem; }
    .form-group { margin-bottom:1.5rem; }
    .form-group label { display:block; margin-bottom:0.5rem; font-weight:500; color:var(--deep-green); }
    .form-control { width:100%; padding:12px; border-radius:var(--radius); border:2px solid var(--light-gray); font-size:1rem; transition:border-color 0.3s; background:var(--paper); color:var(--text); }
    .form-control:focus { outline:none; border-color:var(--leaf); }
    textarea.form-control { resize:vertical; }
    input[type="date"] { padding:12px; }
    .readonly-input { background:var(--light-gray); border:2px solid var(--light-gray); color:var(--gray); }

    .form-row-3 { display:grid; grid-template-columns:1fr 1fr 1fr; gap:1.5rem; }
    .form-row { display:grid; grid-template-columns:60px 1fr 2fr 70px; align-items:center; gap:1rem; margin-bottom:1rem; }
    .author-no { width:60px; padding:12px; background:var(--light-gray); border-radius:var(--radius); text-align:center; font-weight:bold; border:2px solid var(--light-gray); color:var(--deep-green); }

    .mini-btn { padding:8px 14px; background:var(--deep-green); color:var(--cream); border-radius:var(--radius); border:none; cursor:pointer; font-size:0.8rem; font-weight:600; transition: all 0.3s; }
    .mini-btn:hover { background:var(--primary-dark); transform:translateY(-1px); }
    .remove-btn { background:var(--rust) !important; }
    .remove-btn:hover { background:#6a4132 !important; transform:translateY(-1px); }

    .action-row { margin:2.5rem 0 1rem; display:flex; gap:1rem; justify-content:center; }
    .publish-btn { background:var(--leaf); color:var(--cream); padding:12px 30px; border-radius:var(--radius); border:none; cursor:pointer; font-size:1rem; font-weight:600; transition:all 0.3s; }
    .publish-btn:hover { background:#237a52; transform:translateY(-2px); }
    .cancel-btn { background:var(--rust); color:var(--cream); padding:12px 30px; border-radius:var(--radius); border:none; cursor:pointer; font-size:1rem; font-weight:600; transition:all 0.3s; text-decoration:none; display:inline-flex; align-items:center; justify-content:center; }
    .cancel-btn:hover { background:#6a4132; transform:translateY(-2px); }

    input[type="file"] { padding:10px; border-radius:var(--radius); border:2px solid var(--light-gray); background:var(--paper); width:100%; }
    small { font-size:0.8rem; color:var(--rust); }

    .paper-review-tabs { background:var(--paper); padding:15px 20px; border-radius:var(--radius); border:1px solid var(--light-gray); margin-bottom:20px; display:flex; gap:20px; font-size:16px; font-weight:600; overflow-x:auto; box-shadow:var(--shadow); }
    .paper-review-tabs a { text-decoration:none; color:var(--deep-green); padding:8px 12px; border-radius:6px; transition: all 0.3s; white-space:nowrap; position:relative; cursor:pointer; }
    .paper-review-tabs a:hover { background: rgba(11,86,51,0.1); }
    .paper-review-tabs a.active { background: var(--deep-green); color: var(--cream); }

    .tab-content { display:none; }
    .tab-content.active { display:block; }

    @media (max-width: 992px) {
      .sidebar { width:70px; overflow:hidden; }
      .sidebar-header h2, .sidebar-menu span { display:none; }
      .sidebar-menu a { justify-content:center; padding:1rem; }
      .sidebar-menu i { margin-right:0; font-size:1.5rem; }
      .main-content { margin-left:70px; }
      .form-row-3 { grid-template-columns:1fr; }
      .form-row { grid-template-columns:50px 1fr 1fr 50px; gap:0.8rem; }
    }
    @media (max-width:768px) {
      .sidebar { width:0; }
      .main-content { margin-left:0; }
      .sidebar.active { width:250px; }
      .form-row { grid-template-columns:1fr; gap:0.5rem; }
      .author-no { width:100%; }
    }

    .menu-toggle { display:none; position:fixed; top:1rem; left:1rem; z-index:3000; background:var(--deep-green); color:var(--gold); border:none; border-radius:5px; padding:0.5rem; font-size:1.2rem; cursor:pointer; }
    @media (max-width:768px) { .menu-toggle { display:block; } }
  </style>
</head>

<body>
  <button class="menu-toggle" id="menuToggle"><i class="fas fa-bars"></i></button>

  <div class="sidebar" id="sidebar">
    <div class="sidebar-header"><h2>AYUSCRIPT</h2></div>
    <nav class="sidebar-menu">
      <ul>
        <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/paper-review" class="active"><i class="fas fa-file-alt"></i> <span>Paper Review</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/conferences"><i class="fas fa-calendar"></i> <span>Conferences</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/editorial-board"><i class="fas fa-users"></i> <span>Editorial Board</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/about-contact"><i class="fas fa-info-circle"></i> <span>About & Contact Us</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/author-login-details"><i class="fas fa-user-lock"></i> <span>Author Login Details</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/manage-content"><i class="fas fa-edit"></i> <span>Page Content</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/submit-article"><i class="fas fa-upload"></i> <span>Submit Article</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/previous-volumes-issues"><i class="fas fa-book"></i> <span>Previous Volumes And Issues</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/contact-enquiries"><i class="fas fa-envelope-open"></i> <span>Contact Enquires</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/visit-website"><i class="fas fa-globe"></i> <span>Visit Website</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/submissions"><i class="fas fa-file"></i> <span>Submissions</span></a></li>
        <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a></li>
      </ul>
    </nav>
  </div>

  <div class="main-content">
    <div class="top-bar">
      <div class="search-box">
        <i class="fas fa-search" style="color:var(--rust)"></i>
        <input type="text" placeholder="Search...">
      </div>
      <div class="user-info">
        <div class="user-details">
          <div class="user-name">Administrator</div>
          <div class="user-role">Super Admin</div>
        </div>
        <div class="user-avatar"><i class="fas fa-user"></i></div>
      </div>
    </div>

    <div class="paper-review-tabs">
      <a class="tab-link active" data-tab="titleAuthorTab">Title and Author</a>
      <a class="tab-link" data-tab="abstractTab">Abstract</a>
      <a class="tab-link" data-tab="fullArticleTab">Full Article</a>
      <a class="tab-link" data-tab="referenceTab">Reference</a>
    </div>

    <div class="paper-review-content">
      <h1>Paper Review</h1>

      <form id="paperReviewForm" method="post"
            action="${pageContext.request.contextPath}/admin/paper-review/save"
            enctype="multipart/form-data">

        <!-- Hidden IDs -->
        <input type="hidden" id="submissionIdHidden" name="submissionId"
               value="${submission.id != null ? submission.id : submissionId}">
        <input type="hidden" id="authorIdHidden" name="authorId"
               value="${submission.author.id != null ? submission.author.id : authorId}">

        <!-- ===================== TAB 1: TITLE & AUTHOR ===================== -->
        <div class="tab-content active" id="titleAuthorTab">
          <div class="content-area">
            <div class="content-header"><h3>Title and Author</h3></div>
            <div class="form-container">

              <div class="form-row-3">
                <!-- Article ID -->
                <div class="form-group">
                  <label>Article Id</label>
                  <input type="text"
                         id="articleId"
                         name="articleId"
                         class="form-control readonly-input"
                         readonly
                         value="${submission.articleId}">
                  <small>Auto-generated: Ayush_{submissionId}_{MM}_{YYYY}</small>
                </div>

                <!-- Article Type -->
                <div class="form-group">
                  <label>Article Type *</label>
                  <div style="display: flex; gap: 8px; align-items: center;">
                    <select id="articleType" name="articleType" class="form-control" required
                            onchange="handleDynamicOption(this,'articleTypes')" style="flex: 1;">
                      <option value="">Select Article Type</option>
                      <c:forEach var="at" items="${articleTypes}">
                        <option value="${at.name}"
          ${selectedArticleType == at.name || submission.articleType == at.name ? 'selected' : ''}>
      ${at.name}
  </option>

                      </c:forEach>
                      <option value="__add_new__">+ Add New</option>
                    </select>
                    <button type="button" class="edit-btn" onclick="editDropdown('articleType', 'articleTypes')" 
                            title="Edit selected value" style="padding: 8px 12px; background: var(--deep-green); color: white; border: none; border-radius: 5px; cursor: pointer;">
                      <i class="fas fa-edit"></i>
                    </button>
                    <button type="button" class="delete-btn" onclick="deleteDropdown('articleType', 'articleTypes')" 
                            title="Delete selected value" style="padding: 8px 12px; background: var(--rust); color: white; border: none; border-radius: 5px; cursor: pointer;">
                      <i class="fas fa-trash"></i>
                    </button>
                  </div>
                </div>

                <!-- Volume -->
                <div class="form-group">
                  <label>Volume *</label>
                  <div style="display: flex; gap: 8px; align-items: center;">
                    <select id="volume" name="volume" class="form-control" required
                            onchange="handleDynamicOption(this,'volumes')" style="flex: 1;">
                      <option value="">Select Volume</option>
                      <c:forEach var="v" items="${volumes}">
                        <option value="${v.name}"
          ${selectedVolume == v.name || submission.volume == v.name ? 'selected' : ''}>
      ${v.name}
  </option>

                      </c:forEach>
                      <option value="__add_new__">+ Add New</option>
                    </select>
                    <button type="button" class="edit-btn" onclick="editDropdown('volume', 'volumes')" 
                            title="Edit selected value" style="padding: 8px 12px; background: var(--deep-green); color: white; border: none; border-radius: 5px; cursor: pointer;">
                      <i class="fas fa-edit"></i>
                    </button>
                    <button type="button" class="delete-btn" onclick="deleteDropdown('volume', 'volumes')" 
                            title="Delete selected value" style="padding: 8px 12px; background: var(--rust); color: white; border: none; border-radius: 5px; cursor: pointer;">
                      <i class="fas fa-trash"></i>
                    </button>
                  </div>
                </div>
              </div>

              <div class="form-row-3" style="margin-top:1rem;">
                <!-- Issue -->
                <div class="form-group">
                  <label>Issue *</label>
                  <div style="display: flex; gap: 8px; align-items: center;">
                    <select id="issue" name="issue" class="form-control" required
                            onchange="handleDynamicOption(this,'issues')" style="flex: 1;">
                      <option value="">Select Issue</option>
                      <c:forEach var="i" items="${issues}">
                        <option value="${i.name}"
          ${selectedIssue == i.name || submission.issue == i.name ? 'selected' : ''}>
      ${i.name}
  </option>

                      </c:forEach>
                      <option value="__add_new__">+ Add New</option>
                    </select>
                    <button type="button" class="edit-btn" onclick="editDropdown('issue', 'issues')" 
                            title="Edit selected value" style="padding: 8px 12px; background: var(--deep-green); color: white; border: none; border-radius: 5px; cursor: pointer;">
                      <i class="fas fa-edit"></i>
                    </button>
                    <button type="button" class="delete-btn" onclick="deleteDropdown('issue', 'issues')" 
                            title="Delete selected value" style="padding: 8px 12px; background: var(--rust); color: white; border: none; border-radius: 5px; cursor: pointer;">
                      <i class="fas fa-trash"></i>
                    </button>
                  </div>
                </div>

                <!-- Publication Date -->
                <div class="form-group">
                  <label>Date of Publication(optional)</label>
                  <div style="display: flex; gap: 8px; align-items: center;">
                    <input type="date"
                           id="publicationDate"
                           name="publicationDate"
                           class="form-control"
                           value="<c:choose><c:when test="${not empty submission.publicationDate}">${submission.publicationDate}</c:when><c:otherwise></c:otherwise></c:choose>"
                           style="flex: 1;">
                    <label style="display: flex; align-items: center; gap: 5px; white-space: nowrap; cursor: pointer; font-size: 0.9rem; color: var(--text);">
                      <input type="checkbox" 
                             id="clearPublicationDate" 
                             name="clearPublicationDate" 
                             value="true"
                             onchange="handleDateClear('publicationDate', this.checked)"
                             style="cursor: pointer;">
                      <span>No Date</span>
                    </label>
                  </div>
                </div>

                <!-- Acceptance Date -->
                <div class="form-group">
                  <label>Date of Acceptance(optional)</label>
                  <div style="display: flex; gap: 8px; align-items: center;">
                    <input type="date"
                           id="acceptanceDate"
                           name="acceptanceDate"
                           class="form-control"
                           value="<c:choose><c:when test="${not empty submission.acceptanceDate}">${submission.acceptanceDate}</c:when><c:otherwise></c:otherwise></c:choose>"
                           style="flex: 1;">
                    <label style="display: flex; align-items: center; gap: 5px; white-space: nowrap; cursor: pointer; font-size: 0.9rem; color: var(--text);">
                      <input type="checkbox" 
                             id="clearAcceptanceDate" 
                             name="clearAcceptanceDate" 
                             value="true"
                             onchange="handleDateClear('acceptanceDate', this.checked)"
                             style="cursor: pointer;">
                      <span>No Date</span>
                    </label>
                  </div>
                </div>
              </div>

              <!-- Title -->
              <div class="form-group" style="margin-top:1rem;">
                <label>Title *</label>
                <textarea id="paperTitle"
                          name="title"
                          class="form-control"
                          rows="2"
                          required>${submission.title}</textarea>
              </div>

              <!-- How to Cite -->
              <div class="form-group" style="margin-top:1rem;">
                <label>How to Cite This Article *</label>
                <textarea id="citation"
                          name="citation"
                          class="form-control"
                          rows="2"
                          required>${submission.citation}</textarea>
              </div>

              <!-- Authors -->
              <div class="form-group" style="margin-top:1rem;">
                <label>Authors *</label>
                <div id="authorsContainer">
                  <c:choose>
                    <c:when test="${not empty authorNamesList}">
                      <c:forEach var="name" items="${authorNamesList}" varStatus="loop">
                        <div class="author-row" data-index="${loop.index}">
                          <div class="form-row">
                            <div><div class="author-no">${loop.index + 1}</div></div>

                            <div>
                              <input type="text"
                                     name="authorNames"
                                     class="form-control"
                                     placeholder="Author's Name"
                                     value="${name}"
                                     required>
                            </div>

                            <div>
                              <input type="text"
                                     name="authorDetails"
                                     class="form-control"
                                     placeholder="Author's Details"
                                     value="${authorDetailsList[loop.index]}"
                                     required>
                            </div>

                            <div>
                              <c:choose>
                                <c:when test="${loop.index == 0}">
                                  <button type="button"
                                          class="mini-btn"
                                          onclick="addAuthorRow()">+</button>
                                </c:when>
                                <c:otherwise>
                                  <button type="button"
                                          class="mini-btn remove-btn"
                                          onclick="removeAuthorRow(this)">-</button>
                                </c:otherwise>
                              </c:choose>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <!-- Default single empty author row -->
                      <div class="author-row" data-index="0">
                        <div class="form-row">
                          <div><div class="author-no">1</div></div>
                          <div>
                            <input type="text"
                                   name="authorNames"
                                   class="form-control"
                                   placeholder="Author's Name"
                                   required>
                          </div>
                          <div>
                            <input type="text"
                                   name="authorDetails"
                                   class="form-control"
                                   placeholder="Author's Details"
                                   required>
                          </div>
                          <div>
                            <button type="button"
                                    class="mini-btn"
                                    onclick="addAuthorRow()">+</button>
                          </div>
                        </div>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>

            </div>
          </div>
        </div>

        <!-- ===================== TAB 2: ABSTRACT ===================== -->
        <div class="tab-content" id="abstractTab">
          <div class="content-area">
            <div class="content-header"><h3>Abstract</h3></div>
            <div class="form-container">

              <div class="form-group">
                <label>Abstract *</label>
                <textarea id="abstract"
                          name="abstractText"
                          class="form-control"
                          rows="6"
                          required>${submission.abstractText}</textarea>
              </div>

              <div class="form-group">
                <label>Abstract Keywords</label>
                <input type="text"
                       id="abstractKeywords"
                       name="abstractKeywords"
                       class="form-control"
                       value="${submission.abstractKeywords}"/>
              </div>

            </div>
          </div>
        </div>

        <!-- ===================== TAB 3: FULL ARTICLE ===================== -->
        <div class="tab-content" id="fullArticleTab">
          <div class="content-area">
            <div class="content-header"><h3>Full Article</h3></div>
            <div class="form-container">

              <div class="form-group">
                <label>Full Article *</label>
                <textarea id="fullArticle"
                          name="fullArticle"
                          class="form-control"
                          rows="12"
                          required>${submission.introduction != null ? submission.introduction : ''}${submission.sectionContent != null ? submission.sectionContent : ''}${submission.discussionContent != null ? submission.discussionContent : ''}${submission.conclusionContent != null ? submission.conclusionContent : ''}</textarea>
              </div>

            </div>
          </div>
        </div>  

        <!-- ===================== TAB 3: REFERENCES ===================== -->
        <div class="tab-content" id="referenceTab">
          <div class="content-area">
            <div class="content-header"><h3>References</h3></div>
            <div class="form-container">

              <div class="form-group">
                <label>References</label>
                <textarea id="references"
                          name="references"
                          class="form-control"
                          rows="6">${submission.referencesText}</textarea>
              </div>

              <div class="form-group">
                <label>Submit PDF copy only</label>
                <input type="file"
                       name="referencePdf"
                       accept=".pdf"
                       class="form-control" />
                <c:if test="${not empty submission.referencePdfPath}">
                  <small>Existing file: ${submission.referencePdfPath}</small>
                </c:if>
              </div>

              <div class="form-group">
                <label>Number of Pages (PDF)*</label>
                <input type="text"
                id="numberOfPages"
                       name="numberOfPages"
                       class="form-control"
                       placeholder="1-10"
                       required
                       value="${submission.numberOfPages}">
              </div>

              <!-- ===================== ACTION BUTTONS ===================== -->
              <div class="action-row" style="margin-top: 2rem; padding-top: 2rem; border-top: 2px solid var(--light-gray);">
                <button type="submit" class="publish-btn">
                  <i class="fas fa-paper-plane"></i>
                  Publish
                </button>
                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="cancel-btn">
                  <i class="fas fa-times"></i>
                  Cancel
                </a>
              </div>
 
<script>
  const pageInput = document.getElementById('numberOfPages');
  const pageError = document.getElementById('pageError');
 
  // sanitize allowed chars on each input: only digits and single dash allowed
  pageInput.addEventListener('input', function () {
    let v = this.value;
 
    // remove everything except digits and dashes
    v = v.replace(/[^0-9-]/g, '');
 
    // remove leading dashes
    v = v.replace(/^-+/, '');
 
    // collapse multiple dashes into a single dash
    // also ensure only the first dash remains
    const parts = v.split('-');
    if (parts.length > 1) {
      // join only first two parts (prevents additional dashes)
      v = parts[0] + '-' + parts.slice(1).join('');
      // if there were more dashes, they get merged into the second part
      // now remove any dashes that might have become part of second part
      v = v.replace(/-+/g, (m, offset) => offset === v.indexOf('-') ? '-' : '');
    }
 
    // update the field with sanitized value
    this.value = v;
 
    // Clear inline error while typing
    hideError();
  });
 
  // On blur: if user left only a number (e.g., "10") -> clear it and show error
  pageInput.addEventListener('blur', function () {
    const val = this.value.trim();
 
    if (val === '') {
      showError('This field is required. Enter pages in format: 1-10');
      return;
    }
 
    // If only digits (no dash) -> clear and show error
    if (/^\d+$/.test(val)) {
      this.value = ''; // auto-clear number-only input as requested
      showError('Only "number-number" is allowed. Example: 1-10');
      return;
    }
 
    // If partial like "1-" or "-10" -> show helpful error (but keep value so user can finish)
    if (/^\d+-$/.test(val)) {
      showError('Please complete the range after the dash (e.g., 1-10)');
      return;
    }
 
    if (/^-\d+$/.test(val)) {
      this.value = '';
      showError('Invalid format. Start with a number, e.g., 1-10');
      return;
    }
 
    // If it looks like number-number, hide error (but final validation happens on submit)
    if (/^\d+-\d+$/.test(val)) {
      hideError();
      return;
    }
 
    // Catch-all: show generic error and clear if it's not possible to recover
    showError('Invalid format. Use: 1-10');
  });
 
  // Show and hide helpers
  function showError(msg) {
    pageError.textContent = msg;
    pageError.style.display = 'block';
  }
  function hideError() {
    pageError.textContent = '';
    pageError.style.display = 'none';
  }
 
  // Final strict validation before submit
  function validatePages() {
    const value = pageInput.value.trim();
    const pattern = /^\d+-\d+$/;
 
    if (!pattern.test(value)) {
      // If it's a plain number, clear it as requested
      if (/^\d+$/.test(value)) {
        pageInput.value = '';
        showError('Number-only is not allowed. Use format: 1-10');
      } else if (value === '') {
        showError('This field is required. Enter pages in format: 1-10');
      } else {
        showError('Please enter pages in correct format: 1-10');
      }
      return false; // block submit
    }
 
    // Optional: ensure first number <= second number
    const [a, b] = value.split('-').map(Number);
    if (a > b) {
      showError('Invalid range: first number must be less than or equal to second number.');
      return false;
    }
 
    // all good
    hideError();
    return true;
  }
</script>

            </div>
          </div>
        </div>

      </form>
    </div>
  </div>
<script>

    CKEDITOR.replace('abstract');
    CKEDITOR.replace('fullArticle');
    CKEDITOR.replace('references');

    document.querySelectorAll('.tab-link').forEach(tab => {
      tab.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelectorAll('.tab-link').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        this.classList.add('active');
        const tabId = this.getAttribute('data-tab');
        const pane = document.getElementById(tabId);
        if (pane) pane.classList.add('active');
      
        const top = document.querySelector('.paper-review-content');
        if (top) top.scrollIntoView({ behavior: 'smooth', block: 'start' });
      });
    });

    function addAuthorRow(){
      const container = document.getElementById('authorsContainer');
      const idx = container.querySelectorAll('.author-row').length;
      const row = document.createElement('div');
      row.className = 'author-row';
      row.setAttribute('data-index', idx);
      row.innerHTML = `
        <div class="form-row">
          <div><div class="author-no">${idx+1}</div></div>
          <div><input type="text" name="authorNames" class="form-control" required></div>
          <div><input type="text" name="authorDetails" class="form-control" required></div>
          <div><button type="button" class="mini-btn remove-btn" onclick="removeAuthorRow(this)">-</button></div>
        </div>`;
      container.appendChild(row);
      updateAuthorNumbers();
    }

    function removeAuthorRow(btn){
      const row = btn.closest('.author-row');
      if (row) row.remove();
      updateAuthorNumbers();
    }

    function updateAuthorNumbers(){
      document.querySelectorAll('.author-no').forEach((el,i)=>el.textContent = i+1);
    }

    function generateArticleIdIfPossible(){
      const submissionIdInput = document.getElementById('submissionIdHidden');
      const pub = document.getElementById('publicationDate');
      const out = document.getElementById('articleId');
      function compute(){
        const submissionId = submissionIdInput ? submissionIdInput.value || '' : '';
        const d = pub && pub.value ? new Date(pub.value) : new Date();
        const mm = String(d.getMonth() + 1).padStart(2, '0');
        const yyyy = d.getFullYear();
        out.value = 'Ayush_' + submissionId + '_' + mm + '_' + yyyy;
      }
      compute();
      if (pub) pub.addEventListener('change', compute);
    }
    generateArticleIdIfPossible();

    // Handle date clearing functionality
    function handleDateClear(dateFieldId, isChecked) {
      const dateInput = document.getElementById(dateFieldId);
      if (isChecked) {
        dateInput.value = '';
        dateInput.disabled = true;
      } else {
        dateInput.disabled = false;
      }
    }

    // Initialize: if date fields are empty, check the "No Date" checkbox
    document.addEventListener('DOMContentLoaded', function() {
      const pubDate = document.getElementById('publicationDate');
      const accDate = document.getElementById('acceptanceDate');
      const clearPubCheckbox = document.getElementById('clearPublicationDate');
      const clearAccCheckbox = document.getElementById('clearAcceptanceDate');

      if (pubDate && !pubDate.value && clearPubCheckbox) {
        clearPubCheckbox.checked = true;
        pubDate.disabled = true;
      }

      if (accDate && !accDate.value && clearAccCheckbox) {
        clearAccCheckbox.checked = true;
        accDate.disabled = true;
      }
    });

    function handleDynamicOption(selectEl, type) {
        if (selectEl.value === '__add_new__') {
            const newVal = prompt('Enter new value to add:');
            
            if (newVal && newVal.trim() !== '') {

                // Preserve your original behavior
                const opt = document.createElement('option');
                opt.value = newVal;
                opt.textContent = newVal;

                // Insert before the "+ Add New" option
                selectEl.insertBefore(opt, selectEl.lastElementChild);
                selectEl.value = newVal;

                // === NEW CODE: Save into DB ===
                const ctx = '${pageContext.request.contextPath}';
                fetch(ctx + '/admin/dropdown/add?type=' + type + '&value=' + encodeURIComponent(newVal))
                    .then(() => window.location.reload())
                    .catch(err => console.error('Error saving value:', err));

            } else {
                selectEl.value = '';
            }
        }
    }

    // ✅ NEW: Edit dropdown value functionality
    function editDropdown(selectId, type) {
        const selectEl = document.getElementById(selectId);
        if (!selectEl || !selectEl.value || selectEl.value === '' || selectEl.value === '__add_new__') {
            alert('Please select a value first before editing.');
            return;
        }

        const currentValue = selectEl.value;
        const newValue = prompt('Edit value:', currentValue);
        
        if (newValue && newValue.trim() !== '' && newValue !== currentValue) {
            // Update the option text and value
            const selectedOption = selectEl.options[selectEl.selectedIndex];
            const oldValue = selectedOption.value;
            
            // Save to database
            const ctx = '${pageContext.request.contextPath}';
            const formData = new FormData();
            formData.append('type', type);
            formData.append('oldValue', oldValue);
            formData.append('newValue', newValue.trim());
            
            fetch(ctx + '/admin/dropdown/update', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(result => {
                if (result === 'OK' || result.includes('OK')) {
                    // Update the option
                    selectedOption.value = newValue.trim();
                    selectedOption.textContent = newValue.trim();
                    selectEl.value = newValue.trim();
                    
                    // Update all other options with the same value (if any)
                    for (let i = 0; i < selectEl.options.length; i++) {
                        if (selectEl.options[i].value === oldValue && selectEl.options[i] !== selectedOption) {
                            selectEl.options[i].value = newValue.trim();
                            selectEl.options[i].textContent = newValue.trim();
                        }
                    }
                    
                    showTempMessage('Value updated successfully!', 'success');
                } else {
                    showTempMessage('Failed to update value. Please try again.', 'error');
                }
            })
            .catch(err => {
                console.error('Error updating value:', err);
                showTempMessage('Error updating value. Please try again.', 'error');
            });
        }
    }

    // ✅ NEW: Delete dropdown value functionality
    function deleteDropdown(selectId, type) {
        const selectEl = document.getElementById(selectId);
        if (!selectEl || !selectEl.value || selectEl.value === '' || selectEl.value === '__add_new__') {
            alert('Please select a value first before deleting.');
            return;
        }

        const currentValue = selectEl.value;
        const confirmMessage = `Are you sure you want to delete "${currentValue}"?\n\nThis action cannot be undone.`;
        
        if (!confirm(confirmMessage)) {
            return;
        }

        // Save to database
        const ctx = '${pageContext.request.contextPath}';
        const formData = new FormData();
        formData.append('type', type);
        formData.append('value', currentValue);
        
        fetch(ctx + '/admin/dropdown/delete', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(result => {
            if (result === 'OK' || result.includes('OK')) {
                // Remove the option from dropdown
                const selectedIndex = selectEl.selectedIndex;
                selectEl.remove(selectedIndex);
                
                // Reset to first option (usually "Select...")
                selectEl.selectedIndex = 0;
                
                showTempMessage('Value deleted successfully!', 'success');
            } else {
                showTempMessage('Failed to delete value: ' + result, 'error');
            }
        })
        .catch(err => {
            console.error('Error deleting value:', err);
            showTempMessage('Error deleting value. Please try again.', 'error');
        });
    }

    document.getElementById('menuToggle').addEventListener('click', function(){
      document.getElementById('sidebar').classList.toggle('active');
    });

    document.getElementById('paperReviewForm').addEventListener('submit', function(ev){
      for (var name in CKEDITOR.instances) {
        if (CKEDITOR.instances.hasOwnProperty(name)) {
          CKEDITOR.instances[name].updateElement();
        }
      }
    });

    // Define showTempMessage function first
    function showTempMessage(message, type) {
        const messageDiv = document.createElement('div');
        messageDiv.style.background = (type === 'success') ? 'var(--leaf)' : 'var(--rust)';
        messageDiv.style.position = 'fixed';
        messageDiv.style.top = '20px';
        messageDiv.style.right = '20px';
        messageDiv.style.padding = '15px 25px';
        messageDiv.style.color = 'var(--cream)';
        messageDiv.style.borderRadius = 'var(--radius)';
        messageDiv.style.zIndex = '10000';
        messageDiv.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
        messageDiv.style.fontWeight = '600';
        messageDiv.style.fontSize = '16px';
        messageDiv.style.display = 'flex';
        messageDiv.style.alignItems = 'center';
        messageDiv.style.gap = '10px';
        
        // Add icon
        const icon = document.createElement('i');
        icon.className = type === 'success' ? 'fas fa-check-circle' : 'fas fa-exclamation-circle';
        messageDiv.appendChild(icon);
        
        // Add text
        const text = document.createElement('span');
        text.textContent = message;
        messageDiv.appendChild(text);
        
        document.body.appendChild(messageDiv);
        
        // Animate in
        messageDiv.style.opacity = '0';
        messageDiv.style.transform = 'translateX(100px)';
        setTimeout(() => {
            messageDiv.style.transition = 'all 0.3s ease';
            messageDiv.style.opacity = '1';
            messageDiv.style.transform = 'translateX(0)';
        }, 10);
        
        // Remove after 15 seconds with fade out (for publish messages)
        const timeoutDuration = (message.includes('Published') && message.includes('Successfully')) ? 15000 : 3000;
        setTimeout(() => {
            messageDiv.style.opacity = '0';
            messageDiv.style.transform = 'translateX(100px)';
            setTimeout(() => messageDiv.remove(), 300);
        }, timeoutDuration);
    }

    // Check for success/error message on page load
    function checkForMessages() {
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        
        // Check for Published Successfully message (handle both + and space)
        if (message && (message.includes('Published') && message.includes('Successfully'))) {
            showTempMessage('Published Successfully', 'success');
        }
        
        if (urlParams.get('error')) {
            showTempMessage('Failed to publish. Please try again.', 'error');
        }
    }
    
    // Check immediately if DOM is already loaded
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(checkForMessages, 100);
        });
    } else {
        // DOM is already loaded, check with small delay to ensure everything is ready
        setTimeout(checkForMessages, 100);
    }

</script>

</body>
</html>
