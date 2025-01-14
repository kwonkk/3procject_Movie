<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<link rel="stylesheet" type="text/css" href="/resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
.first {
	margin-top: 50px;
	margin-bottom: 10px;
}

.con {
	display: inline-block;
	width: 100px;
}
.id{
	maggin: auto;
	
}

</style>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>
<form id="joinfrm" name="joinfrm" action="${pageContext.request.contextPath}/member/join.do" method="post">
    <div style="width: 900px; margin-left: 550px; margin-top: -40px;">
        <h2 style="margin-top: 50px;">회원가입</h2>
        <hr>
        <h1>회원가입을 위해 휴대폰 본인 인증해주세요.</h1>

        <div class="first">
            <strong>회원정보입력</strong>
        </div>
        <hr>

        <div class="id">
            <label for="id"><span class="con">ID : </span></label>
            <input type="text" name="id">
        </div>
        <hr>

        <div>
            <label for="pw"><span class="con">PASSWORD : </span></label>
            <input type="password" placeholder="********" name="pw">
        </div>
        <hr>
        <div>
            <label for="pwck"><span class="con">PASSWORD 확인 : </span></label>
            <input type="password" placeholder="********" name="pw">
        </div>
		<hr>
        <div>
            <label for="name"><span class="con">이름 : </span></label>
            <input type="text" placeholder="한글 또는 영문">
        </div>
        <hr>

        <div>
            <label for="birth"><span class="con">생년월일 : </span></label>
            <input type="text" placeholder="생년월일 입력">
        </div>
        <hr>

        <div>
            <label for=""><span class="con">성별 : </span></label>
            <input type="radio" name="gender" value="man"> 남
            <input type="radio" name="gender" value="woman"> 여
        </div>
        <hr>

        <div>
            <label for="phone"><span class="con">휴대폰번호 : </span></label>
            <div>
                <select name="통신사">
                    <option value="SKT">SKT</option>
                    <option value="KT" selected>KT</option>
                    <option value="LG">LG</option>
                </select>
                <select name="ph--ln">
                    <option value="010" selected>010</option>
                    <option value="011">011</option>
                    <option value="018">018</option>
                </select>
                <span> - </span>
                <input type="text" pattern="[0-9]{3,4}" required />
                <span> - </span>
                <input type="text" pattern="[0-9]{4}" required />
                <input type="button" value="인증">
            </div>
        </div>
        <hr>

        <div class="col">
            <span class="con">주소 : </span>
            <input type="text" name="zipcode" placeholder="우편번호를 입력하세요">
            <button class="btn btn-secondary w-100" onclick="searchZip()">우편번호검색</button>
        </div>

        <input type="text" name="addr1" placeholder="기본주소 입력" class="form-control" style="width:300px;"/>
        <input type="text" name="addr2" placeholder="상세주소 입력" class="form-control" style="width:200px;"/>

        <hr>

        <div style="display: flex; justify-content: center; margin-top: 40px;">
            <input type="button" style="background-color: red;" value="취소">
            <input type="submit" value="회원가입" style="margin-left: 5px;">
        </div>
    </div>
</form>
	<%@include file="../includes/admin/footer.jsp"%>
    
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script>
    function searchZip() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }

                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }

                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    addr += extraAddr;
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣기
                document.getElementsByName('zipcode')[0].value = data.zonecode;
                document.getElementsByName('addr1')[0].value = addr;

                // 상세주소 입력란 활성화
                document.getElementsByName('addr2')[0].removeAttribute('readonly');
                document.getElementsByName('addr2')[0].focus();
            }
        }).open();
    }
</script>
</body>
</html>