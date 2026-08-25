<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Murach Survey - Response Submitted</title>
    <link rel="stylesheet" href="main.css" type="text/css" />
</head>

<body>
    <main class="survey-container">
        <header>
            <img src="image/images.png" alt="Murach Logo" class="logo">
            <h1>Thanks for joining</h1>
            <p class="intro-text">Here is the information that you entered:</p>
        </header>

        <div class="result-card">
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
        </div>

        <button type="button" class="submit-btn" onclick="window.location.href='index.jsp';">Return to Survey</button>
    </main>
</body>

</html>
