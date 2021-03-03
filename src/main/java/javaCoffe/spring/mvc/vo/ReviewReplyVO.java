package javaCoffe.spring.mvc.vo;

public class ReviewReplyVO {
    private String replyNo; // 몇번째로 써진 댓글 또는 대댓글인가
    private String commentNo; // 어떤 댓글에 속해있는가 replyNo와 commentNo가 같으면 댓글, 다르면 대댓글
    private String reviewNo; //어떤 rno값에 속해있는가
    private String reply;
    private String userid;
    private String regdate;

    public String getReplyNo() {
        return replyNo;
    }

    public void setReplyNo(String replyNo) {
        this.replyNo = replyNo;
    }

    public String getCommentNo() {
        return commentNo;
    }

    public void setCommentNo(String commentNo) {
        this.commentNo = commentNo;
    }

    public String getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(String reviewNo) {
        this.reviewNo = reviewNo;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
}
