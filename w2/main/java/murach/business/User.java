package murach.business;

import java.io.Serializable;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private String dob;
    private String hearAbout;
    private String[] announcements;
    private String contactBy;

    public User() {
        firstName = "";
        lastName = "";
        email = "";
        dob = "";
        hearAbout = "";
        announcements = new String[0];
        contactBy = "";
    }

    public User(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dob = "";
        this.hearAbout = "";
        this.announcements = new String[0];
        this.contactBy = "";
    }

    public User(String firstName, String lastName, String email, String dob, 
                String hearAbout, String[] announcements, String contactBy) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dob = dob;
        this.hearAbout = hearAbout;
        this.announcements = announcements != null ? announcements : new String[0];
        this.contactBy = contactBy;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getHearAbout() {
        return hearAbout;
    }

    public void setHearAbout(String hearAbout) {
        this.hearAbout = hearAbout;
    }

    public String[] getAnnouncements() {
        return announcements;
    }

    public void setAnnouncements(String[] announcements) {
        this.announcements = announcements;
    }

    public String getContactBy() {
        return contactBy;
    }

    public void setContactBy(String contactBy) {
        this.contactBy = contactBy;
    }

    public String getHearAboutFormatted() {
        if ("search".equalsIgnoreCase(hearAbout)) return "Search engine";
        if ("word".equalsIgnoreCase(hearAbout)) return "Word of mouth";
        if ("social".equalsIgnoreCase(hearAbout)) return "Social Media";
        if ("other".equalsIgnoreCase(hearAbout)) return "Other";
        return hearAbout != null ? hearAbout : "";
    }

    public String getContactByFormatted() {
        if ("email_or_postal".equalsIgnoreCase(contactBy)) return "Email or postal mail";
        if ("email".equalsIgnoreCase(contactBy)) return "Email";
        if ("postal".equalsIgnoreCase(contactBy)) return "Postal mail";
        return contactBy != null ? contactBy : "";
    }

    public String getAnnouncementsFormatted() {
        if (announcements == null || announcements.length == 0) {
            return "None";
        }
        StringBuilder sb = new StringBuilder();
        for (String a : announcements) {
            if ("like".equalsIgnoreCase(a)) {
                if (sb.length() > 0) sb.append("; ");
                sb.append("YES, I'd like that");
            } else if ("email_announcements".equalsIgnoreCase(a)) {
                if (sb.length() > 0) sb.append("; ");
                sb.append("YES, please send me email announcements");
            }
        }
        return sb.length() > 0 ? sb.toString() : "None";
    }

    public boolean isWantsLike() {
        if (announcements == null) return false;
        for (String a : announcements) {
            if ("like".equalsIgnoreCase(a)) return true;
        }
        return false;
    }

    public boolean isWantsEmailAnnouncements() {
        if (announcements == null) return false;
        for (String a : announcements) {
            if ("email_announcements".equalsIgnoreCase(a)) return true;
        }
        return false;
    }
}
