package cn.net.sunrise.su.enums;

public enum AttributeKey {

	SESSION_ACCOUNT("account"),
	IS_LOGIN("islogin"),
	REGISTER_ACCOUNT("registeraccount"),
	REGISTER_STEP1("registerstep1"),
	REGISTER_STEP2("registerstep2"),
	REGISTER_STEP3("registerstep3"),
	REGISTER_STEP4("registerstep4"),
	FORGET_PASSWORD_STEP1("forgetpasswordstep1"),
	FORGET_PASSWORD_STEP2("forgetpasswordstep2"),
	FORGET_PASSWORD_STEP3("forgetpasswordstep3"),
	REGISTER_VERCODE("registervercode"),
	FORGET_VERCODE("forgetvercode"),
	FORGET_ACCOUNT("forgetaccount"),
	FOTGET_STEP1("forgetstep1"),
	FOTGET_STEP2("forgetstep2"),
	FOTGET_STEP3("forgetstep3"),
	CHANGE_MAIL_NEW_MAIL("changemailnewmail"),
	CHANGE_MAIL_STEP1("changemailstep1"),
	CHANGE_MAIL_STEP2("changemailstep2"),
	CHANGE_MAIL_STEP3("changemailstep3"),
	CHANGE_MAIL_VERCODE("changemailvercode"),
	PAGE_TIME("pagetime"),
	ATTRIBUTE_OBJECT("attributeobject");
	
	public final String key;
	private AttributeKey(String key) {
		this.key = key;
	}
}
