<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gallery</title>
</head>
<style>

 /* File Upload */
        .file-input-wrapper {
            position: relative;
        }

        .file-input-wrapper input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .file-input-custom {
            border: 2px dashed #ddd;
            border-radius: 6px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s;
            background-color: #fafafa;
        }

        .file-input-wrapper:hover .file-input-custom {
            border-color: var(--leaf);
            background-color: #f5f9f7;
        }

        .file-input-text {
            font-size: 15px;
            color: #666;
            display: block;
            margin-bottom: 5px;
        }

        .file-input-icon {
            font-size: 24px;
            color: var(--leaf);
        }

        .file-info {
            font-size: 13px;
            color: #777;
            margin-top: 8px;
        }

       
        .btn {
            border-radius: 6px;
            padding: 12px 24px;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-primary {
            background: green;
            border: none;
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(11, 86, 51, 0.3);
        }

        .btn-outline-light {
            border-color: rgba(255, 255, 255, 0.7);
            color: rgba(255, 255, 255, 0.9);
        }

        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: white;
            color: white;
        }


</style>

<style>

.gallery-container{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(180px,1fr));
    gap:15px;
}

.gallery-item{
    border-radius:10px;
    overflow:hidden;
}

.gallery-image{
    width:100%;
    height:180px;
    object-fit:cover;
    cursor:pointer;
}

.path-box{
    display:none;
    margin-top:5px;
}

.path-input{
    width:100%;
    padding:5px;
    font-size:12px;
}

.path-box button{
    margin-top:5px;
    width:100%;
    background:green;
    color:white;
    border:none;
    padding:6px;
    cursor:pointer;
}

</style>
<body>
   <form id="submitArticleForm" action="${pageContext.request.contextPath}/admin/submit" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
   <div class="form-group">
                <label for="document" class="form-label">Upload Document *</label>
                <div class="file-input-wrapper">
                    <input type="file" id="document" name="document"
                           accept=".jpg,.png,.jpeg" required>
                    <div class="file-input-custom">
                        <span class="file-input-text">Choose document file...</span>
                        <i class="fas fa-file-upload file-input-icon"></i>
                    </div>
                </div>
                <div class="file-info">
                    <i class="fas fa-info-circle me-1"></i>
                    Supported formats: jpg, jpeg, png (Maximum file size: 10MB)
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-paper-plane me-2"></i>UPLOAD
            </button>
         </form>
         
 <div class="gallery-container">

    <c:forEach items="${images}" var="img">

        <div class="gallery-item">

           <%--  <img src="/AYURVEDA/natureuploads/${img}"
                 onclick="togglePath(this)"
                 class="gallery-image"> --%>
                 
                 <img src="https://natureayurved.com/natureuploads/${img}"
                 onclick="togglePath(this)"
                 class="gallery-image">

            <div class="path-box">

                <input type="text"
                       <%-- value="/AYURVEDA/natureuploads/${img}" --%>
                       value="https://natureayurved.com/natureuploads/${img}"
                       readonly
                       class="path-input">

                <button type="button"
                        onclick="copyPath(this)">
                    Copy
                </button>

            </div>

        </div>

    </c:forEach>

</div>


<script>

function togglePath(image){

    let pathBox =
        image.parentElement.querySelector(".path-box");

    if(pathBox.style.display === "block"){

        pathBox.style.display = "none";

    }else{

        pathBox.style.display = "block";
    }
}

/* function copyPath(button){

    let input =
        button.parentElement.querySelector(".path-input");

    navigator.clipboard.writeText(input.value);

    alert("Copied: " + input.value);
} */

function copyPath(button){

    let input =
        button.parentElement.querySelector(".path-input");

    input.select();

    input.setSelectionRange(0, 99999);

    document.execCommand("copy");

    alert("Copied: " + input.value);
}


</script>
</body>
</html>