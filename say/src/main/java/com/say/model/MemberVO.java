package com.say.model;

public class MemberVO {
	
		private String memberId;
		
		private String memberPw;
		
		private int adminCk;
		
		private int regDate;

		public String getMemberId() {
			return memberId;
		}

		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}

		public String getMemberPw() {
			return memberPw;
		}

		public void setMemberPw(String memberPw) {
			this.memberPw = memberPw;
		}

		public int getAdminCk() {
			return adminCk;
		}

		public void setAdminCk(int adminCk) {
			this.adminCk = adminCk;
		}

		public int getRegDate() {
			return regDate;
		}

		public void setRegDate(int regDate) {
			this.regDate = regDate;
		}

		@Override
		public String toString() {
			return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", adminCk=" + adminCk + ", regDate="
					+ regDate + "]";
		}
		

}
