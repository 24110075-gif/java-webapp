<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <!-- Vẫn giữ liên kết tới main.css cho các style cơ bản -->
    <link rel="stylesheet" href="main.css" type="text/css" />

    <!-- Thêm CSS riêng để định dạng các dòng kết quả dạng lưới (Grid/Flex) -->
    <style>
        .result-row {
            display: flex;
            margin-bottom: 12px;
            font-size: 15px;
            align-items: baseline;
        }

        .result-row label {
            flex: 0 0 160px;
            /* Giữ độ rộng nhãn cố định để thẳng hàng */
            font-weight: bold;
            color: var(--primary-teal, #007c8a);
        }

        .result-row span {
            flex: 1;
            color: #333;
        }

        .announcement-list {
            margin: 0;
            padding-left: 20px;
        }
    </style>
</head>

<body>
    <main class="survey-container">
        <h1>Thanks for joining our email list</h1>
        <p class="intro-text">Here is the information that you entered:</p>

        <!-- Sử dụng cấu trúc thẻ div .result-row để nhóm và căn lề -->
        <div class="result-row">
            <label>First Name:</label>
            <span>${user.firstName}</span>
        </div>

        <div class="result-row">
            <label>Last Name:</label>
            <span>${user.lastName}</span>
        </div>

        <div class="result-row">
            <label>Email:</label>
            <span>${user.email}</span>
        </div>

        <div class="result-row">
            <label>Date of Birth:</label>
            <span>${user.dob}</span>
        </div>

        <div class="result-row">
            <label>Heard about us from:</label>
            <span>${user.hearAboutFormatted}</span>
        </div>

        <div class="result-row">
            <label>Contact me by:</label>
            <span>${user.contactByFormatted}</span>
        </div>

        <div class="result-row">
            <label>Announcements:</label>
            <span>
                <ul class="announcement-list">
                    <% 
                        murach.business.User u = (murach.business.User) request.getAttribute("user");
                        if (u != null) {
                            boolean hasAnnouncement = false;
                            if (u.isWantsLike()) {
                                out.println("<li>YES, I'd like that.</li>");
                                hasAnnouncement = true;
                            }
                            if (u.isWantsEmailAnnouncements()) {
                                out.println("<li>YES, please send me email announcements.</li>");
                                hasAnnouncement = true;
                            }
                            if (!hasAnnouncement) {
                                out.println("<li>None</li>");
                            }
                        } else {
                            out.println("<li>None</li>");
                        }
                    %>
                </ul>
            </span>
        </div>

        <br>
        <!-- Dùng Javascript chuyển hướng trang thay vì dùng form -->
        <button type="button" class="submit-btn" onclick="window.location.href='index.jsp';">Return to Survey</button>
    </main>
</body>

</html>