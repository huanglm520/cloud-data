var accountCheck = /^[0-9A-Za-z][\.-_0-9A-Za-z]*@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+$/;
var passwordCheck = /^[\S]{8,16}$/;
var firstNameCheck = /^[a-zA-Z\u4e00-\u9fa5]{1,32}$/;
var lastNameCheck = firstNameCheck;
var companyCheck = /^[\S ]{1,64}$/;
var vercodeCheck = /^[0-9]{6}$/;
var containerNameCheck = /^[A-Za-z_][A-Za-z_0-9]{0,15}$/;
var containerApiCheck = /^[A-Za-z_][A-Za-z_0-9]{0,31}$/;