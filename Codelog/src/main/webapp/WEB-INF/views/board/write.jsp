<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- 글 작성 페이지에만 적용되는 CDN들. 지우지 마세요 -->
   <link rel="stylesheet" type="text/css" href="path/to/font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet">
   <link
      href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet">
   <script src="https://kit.fontawesome.com/fec7fe9db7.js" crossorigin="anonymous"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
   <!-- 글 작성 페이지에만 적용되는 CDN들. 지우지 마세요 -->

   <style>
      /* 글 작성 페이지 css */
      @import url("<c:url value='/css/write.css'/>");
   </style>

   <title>Document</title>
</head>

<body>
<form action="<c:url value='/boardController/write' />" class="write-bbs" enctype= multipart/form-data>
<!-- 글등록 페이지에 따로 작성자를 기입하지는 않으므로 현재 로그인 세션에서 작성자 명을 뽑아옵니다. -->
  <input type="hidden" name="writer" value="작성자명">
  <input type="hidden" name="userId" value="유저id">
<!--   <input type="hidden" name="writer" value="{loginSession.nickname}">
  <input type="hidden" name="userId" value="{loginSession.userId}">  -->
   <div id="articles">
      <!-- 글 작성 화면(화면 왼 쪽 절반 div)  -->
      <div class="write-left-side">
         <!-- 제목, 태그, 본문 내용 form으로 전송 -->
         
            <!--제목-->
            <textarea placeholder="제목을 입력하세요" id="title" name="title" onkeyup="priviewTitle()"></textarea>
            <br>
            <!--태그-->
            <input class="tag" name="tags" placeholder="태그를 입력하세요">
            <!-- 마크다운 버튼들이 있는 div (온클릭 이벤트?) -->
            <div class="markdown-btns">
               <button type="button">H1</i></button>
               <button type="button">H2</button>
               <button type="button">H3</button>
               <button type="button">H4</button>
               |
               <button type="button"><i class="fa-solid fa-b"></i></button>
               <button type="button"><i class="fa-solid fa-italic"></i></button>
               <button type="button" id="textSlash"><i class="fa-solid fa-text-slash"></i></button>

               |
               <button type="button"><i class="fa-solid fa-quote-right"></i></button>
               <button type="button"><i class="fa-solid fa-paperclip"></i></button>
               <button type="button" onclick="document.all.chooseFile.click();"><i class="fa-regular fa-image"></i></button>
               <input type="file" id="chooseFile" name="chooseFile">
               <button type="button"><i class="fa-solid fa-angle-left"></i><i class="fa-solid fa-angle-right"></i></button>
               <br>
            </div>
            <!--본문 내용-->
            <textarea placeholder="내용을 입력하세요" id="content" name="content" class="content" onkeyup="priviewContent()"></textarea>
            <!--돌아가기, 글등록하기 버튼이 있는 div-->


            <div class="submit">


               <button class="ok" id="show" type="button"><i class="fa-solid fa-check"></i></button>
               <button class="exit"><i class="fa-solid fa-right-from-bracket"></i></button>

            </div>

    

      </div>
      <!-- 미리보기 영역(화면 절반 중 오른쪽)-->
      <div class="write-right-side">
         <div class="priview">
            <!--제목 미리보기(onkeyup 이벤트 활용)-->
            <div id="priview-title">
               <h1>
                  <script>
                     function priviewTitle() {
                        const priview =
                           document.getElementById('title').value;
                        document.getElementById('priview-title').innerText = priview;

                     }
                  </script>
               </h1>
            </div>
            <!--본문 미리보기(onkeyup 이벤트 활용)-->
            <div id="priview-content">
               <h1>
                  <script>
                     function priviewContent() {
                        const priview =
                           document.getElementById('content').value;
                        document.getElementById('priview-content').innerText = priview;
                     }
                  </script>
               </h1>
            </div>

         </div>
      </div>
   </div>
   <!-- 미리보기 버튼 작동 후 페이지-->
   <!--contanier 1개에 row 1개 col 2개로 영역 구분
        썸네일 직접 업로드 가능(기본값은 글 작성에 이미지를 넣었으면 그 중 최상단 이미지 없으면 null)
    -->
   <div id="check">
      <div class="container-down">
        
            <div class="row py-md-3" style="margin: 5% 15% 0% 15%">

               <div class="col-md-6 px-md-4" style="margin: 0 auto;">
                  <div class="card" style="width: 100%; height: 27rem; border: 0; background-color: transparent;">

                     <!--썸네일 부분-->

                     <p class="my-md-1" style="font-weight: bold; font-size: 1.7rem;">포스터 미리보기</p>
                     <div class="thumbnailBox" id="thumbnailBox" 
                        style="height: 22rem; background-color: rgba(128, 128, 128, 0.185); text-align: center;" onclick="document.all.thumbnailUpload.click();">
                        <i class="fa-regular fa-image my-md-4" style="font-size: 6rem;"></i>

                     <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAVUAAACOCAYAAACBgpt2AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAA2YSURBVHhe7d0JlqJKEIVh1+WCWI+rcTMuxo7IASIHUsCQsqr/7x3OK0XIAep2ylSXZ9fjebtOz7v8N0339N4WutzlebnE6Xp7pPd/v/u0tKvuktE8AP+XEKo2FC4XDdODoXqfnpfrTZb+rMftauq7TJ8P8fiPRr9LRvMA/C+qkaoEw6SheCxUQ9idmipSv/CPwFkIVQBjRag+ZKQ5TTLaDCO/7aHaHzmasHvcnlczz65SR8nTzc6Py+k6r/L+pO/J6PeWRtNldfaGavz8zdR3Gd1W6wp1rtdNqAIYS6H6eN5vEqhzwDiOVEM4XZ/LqsvX4dCDOWQQQlZWEYM61SGFXwza/El1JFSlvFxHPVwxL0+oAnifhKqEyfUqYWDDyi9Ue+/l4Kx/tpblNOxiCPuE6lpwjuZlhCqAseqYqsqBqgjVct2EKoCxNlTlK7Ee3yzDa5tegMZwGn/9/55QzfWKAVkcFw4IVQBjJlT1uKqElo5SHzEgrpIQNsJe6YaqCscu44mhiw1Y8T2hmspM9YwnyfK8HLLlFOs9mgfgf5NCVcLmKoElSbBEVjx51X4FBgCs6RxTBQAcRagCgCNCFQAcEaoA4IhQBQBHfytUwyVSv+hypuqSrhG99Oy8y7X2XqrmbEe/uPja7eDEsT/Lyw73XHB5VHnJYrfMUfvO3pcEofqTdm/ws24wIFTH9m4H7c8lGHQ6dR+d27dSb/vIzvQ71KtnCNT5OR1O+2JxDXtnG9i6rRltv7P3JcHX/5/08V/mowjVsSOhatYfguRn2rfcVLPQ0XccAcbwn2eH5fLNOp19Que/szPW/d4J0F59G6PtN5r3IXOo2q81xQYPlVrm5fZpY18/mm9Ftc5lSB83XP/RfLGOvccE5nl5mbIO43WGDZne784f2NtnQTVv83LByi/zaLlD7Uu/QGbZYplBeWWftPPWtt+wX1a83AdH/TIqb7Rc4BCqNjzO7M/wvu1brdtyx+Ja4Ma+lg+ZfWK6y7KpHaN6qnJ+Kl/XVXywqotZX7Gc2rH97LxX9fQQQjUU1Ft7qJy5rdS8jo3WympHVB3/gpbXb0xc11yXqvxQT7Mztuvp7ezVOsNOkTt52YjxZbWzDxzps1yXebEwz9bF7Bh13YJO+16WZ+Ztbl+sZ3c7DMurhHnVDt3dfqN+WTfcB4f1HJWn8w5sh6FY3vLLPOi/+rVV1FPWeqg/q7qbfUKXr39/Qx/Lh++T1in3ha4jve7tT7169jqr+F1MZVVtz+WXRu0bzauM5r1BQjV3VHrH6DUob7hl3rK8vrclVGPn9Tpa12UbWe4Ay06zprezV+tsNoBp+67Q2d9nzfptXcLP+ZcuT3UZbfuG5b3Vvv52GJcXXlRtWNazuv1G/TKw1GVpp76Xw/XM7TBW9WcoY6nv2f1py9R15N9Z+3MWPyvfAsIzQWQ9Yb25PfL/XM5qPZdt0xPWn5aJ3zrKz/b6Z9i+F21fr6efHwnVWW7gXEbeWNmnQzWuc+ng9Y1fOtZnob1bd4auvaEafz7Wvv52GJdX9Uunr6tFo1e/CCtG++DZ22Gs159LfU/vz/l1uf61uoSw0/XpenW+Lh/WL8vn/6/Ws5o3UtdT9Oo0bN+w7eP+9CKhGneQpuIqFFpXIr5eGrtUVN8rQlUbKL/MvVXPmkabRobll9erO9Gst7NX67Tl6c92A/R023Csz8p5aR1F2w+071V5h9o32A6vyjPzdHtt2n7FcnW/JJ16DvfBzfV02g7Zlv4M5f9kf6b6659OagKoVxepv35O26YF6v/t62E9U/ndilrxc/2RcrXsqH2b57X96SWdqMqF58kUlHaSOC0V2hKq4TPNDlaXZefHHXqZt5SnVneizjp1ip8d7NAidqydyk7ut0Ht7zOV16dTONDf1C0vJ9O8w4/aJwblHWvfeDtsLa98fGKc199+L/pF9OoZ3gtv6OdjPfS9eR88ezuIXj1j/ewy39mfQbcu2m5dPrVDfp5CPyx1HdWz7bc8r3y/15ZQz86MUftG88b19JFC9Vu0G/+jwg5UlqedXv9r+Wv99fbhNKMAR4lQLcqL/xL/mZ3nr7cP59F9yR4qkNfsR33/d6h2vs79rVHcX28fzmS/VtffgLD4slAFgN+NUAUAR4QqADhyCtV4AsQeu8sHte9T79jL43mbzEFvdZ8+dLxPjytWdeAgO4APSaHantCI096D0RKu9gyh+FiohguSTV3DbXRpXtAJ+nxdHaEK4EMGI9VO8L1SXViv+qGqgRcDzp5R3B6qGqiyvEnRx13KrkekASNVAOdxDVV9ko3e+mbDMd/BYN/TIA2PLLOjyz0jVQnvqfPZx20q7kYJNOglgEOIShk5wAlVAJ9wsUGzNr0OoEcI1PjAWh0ZaojFdGtGqhqeeYUajnkUuSdUw0hVA9R8PhwOKMuaR6/pUWW5TloWoQrgE/xOVBXHUuV1GuWWoVp/ztgVqkI/X4R/Go3OUsjOq4zBGoogVAF8yPhE1VoA7rB2oup+k5GtKUtHr7vK0q/1JhnjQ3TTi0IcRS/t0gdu7CwLADZyPKYqI0MTksvUhqoeU62DTY+HbhqpyiizLaOc7Cg0Hr8tSoqBvmdUDAAb/chI9a1Q3YlQBXCmcaia5yUe9bGv/5vx9R/AeZxOVAEAFKEKAI4IVQBwRKgCgCNCFQAcjUP15V1O+VpWvYOqPcfva2tZeiWDXnHw4TpxVxaADgnV9nKqOUiLUK0/p8G1FnTtOsO047pX+6dkx2WJpp5vhOooLGVe0R4zEbAAlBmpPp6Ph0w3Eyp1WJk7rOL1p4NQNZ99T15Xryz5uQk3+dzOUC0DvJo663iEh7dc54e1+LQTwF9wkRRNF+FrSOhF8uaC/y2hmkekHwrVJeTXyhIeI9XwxKy0fp1kHfMqkxC++rSr+eYBiXi9E0yX21MWgD+rPKaaHlJiR26HR6q9r/97/pJAHg025XfCUr+W63vz1/O9oaplyTI2ROtHCc7rXp82Fwfgz1pCtfM8Ug2ScgRoQ0Q/Owi6t2hZ5vmnQ/Gzy1P/9bX+7ByqNekbQhRALYTqQ8Ozd59/Eao9nwrVSB+GYkeC8zSXJSXrw7G1jlrXcCLsSKiKDV//Q/jaeszTIHwB/FckVDujtKwXqq+CVua3oVNO7+WvDUutuwZpFI+/7gzVt+ubywOA+phq7UioftyrsDw4Ut1E1tkJXUaqALJDodqGypnB8o2h+v4jEgH8DeNQBQDsQqgCgCNCFQAcEaoA4IhQBQBHEqqdM9rp2s+1P9pnb1cNdl1mpcvni/r1rqn07q13sT0A/C5mpCrhWj2a7xOhGv88dfqsuRW0DdW1y5fOunQLAPZbQjU8raoMrH6oatjF6zLtbaRbQ7VeZw7TrSPVfp0A4DvMoar30E8SWDYc89Oq7HsapNNNAlhHmPltRqoAEEiopoeShIObejfS8nSoZlSo4bkcBJ0DcU+ohjK6x1TTe/NdUBKq888A8DvEE1XFsVQNs96Jqvpzxq5QjeqR6faRKs8tBfC9zImqVv/4pYxs9Su8CTkdvW6K1HDctgxIHa3q1Qb6BP02l3XknOvQOUEGAF8mheraqLAN1XhMtAxRHWXuHanWipGqjHzbupQTo1UA32j3SNUjVDmDD+CvOvfrf7L210vfHe0CwE8bhioAYB9CFQAcEaoA4IhQBQBHhCoAOGpDtfNgldloHgCAUAUAT4QqADiKoRrC0l6Ib4JzNA8AUJBQjff9z/fSF6PR0TwAQO0SHl5iH+lng3M0DwDQIFQBwNElBmX8m1OSms/b1Rw3Hc0DADTCiar5T5mE46d6HHUJztE8AECpvaQKAHAYoQoAjghVAHBEqAKAI0IVABwRqgDgqA3V0QX+XPwPAEOEKgA4IlQBwFEM1RCW8a6pOJngHM0DABQkVHn0HwB44SlVAOCIUAUARzz6DwAchRNVPPoPAHy0l1QBAA4jVAHAEaEKAI4IVQBwRKgCgCNCFQActaE6usCfi/8BYIhQBQBHhCoAOIqhGsIy3jUVJxOco3kAgIKEKo/+AwAvPKUKABwRqgDgiEf/AYCjcKKKR/8BgI/2kioAwGGEKgA4IlQBwBGhCgCOCFUAcESoAoAjp1CNt7PmS6/ClG4auE+9S7Aez9tkbipQ9+l5jRfEbqDL50u9rvNttI/blK6pBYCfkUI1X9hfT3uvSZVwtXdgiU+Eql47O3/2oWXGMtpQ7YT9oXYBwDaDkWon+F7p3MbaD1UNu3inlr25YGuo1uvMYbp1pNqvEwC8zzVU7/KVfJLAsuF4n9rA1CCdbhLAOsLMbzNSBfAHxAeqdINnmeZH/616hEC9hg/qoQQ9zhnTrRkVanguB0HnQNwTqqGM7jHV9N5cYQnV15UHADd+J6qKY6kaZvF1Gar154xdoRrVI9PtI9Ut/1AAwH7jE1VrAbhD//iljGz1K7wpS0evm8oKx21NHcMkI1Sp6717TFXbluuw/5AGAOzheEx1bVTYhmo8JlqGqI4y945Ua8VI1eWwBgDs8yMjVY9Q5Qw+gG80DtX5AdXHuX/9T/JVBfX07mgXAN7hdKIKAKAIVQBwRKgCgCNCFQAcEaoA4IhQBQBHhCoAOCJUAcARoQoAjghVAHBEqAKAI0IVANw8n/8AkzAJlOk3B/AAAAAASUVORK5CYII=" class="btn" type="button" id="img-preview"
                                    onclick="document.all.thumbnailUpload.click();"
                                    style="display: block; background-color: white; width: 100%; height: 100%;"><span
                                        style="color: rgb(77, 238, 98);">썸네일 업로드</span> 
                        <input type="file" id="thumbnailUpload" name="thumbsnail" accept="image/*"
                           onchange="readURL(this)">
                        <script>
                           $('#thumbnailUpload').change(function () {
                              readURL(this);
                           });

                           function readURL(input) {
                              if (input.files && input.files[0]) {
                                 var reader = new FileReader();
                                 reader.onload = function (e) {
                                    $('#img-preview').attr('src', e.target.result);
                                    $('#thumbnail').val(e.target.result);
                                 }
                                 reader.readAsDataURL(input.files[0]);
                              }
                           }

                           //프로필 이미지 삭제
                           $('#img-del-btn').click(function (e) {
                              $('#img-preview').attr('src', './images/user_icon.png');
                           });
                        </script>
                     </div>

                     <!--제목은 글작성 페이지에서 가져오기-->
                     <div class="card-body my-md-2 p-0 ">
                        <strong>한글 입숨</strong>
                        <!--키다운 이벤트로 글자 수 실시간 기록 50(임시) 이상시 못씀-->
                        <div class="form-floating" style="margin-top: 0.5rem;">
                           <textarea placeholder="Leave a comment here" id="floatingTextarea" name="preview"
                              style="width: 100%; height: 6rem; resize: none;"></textarea>
                           <span style="float: right">/100</span><span id="textL" style="float: right">0</span>
                           <input type="text" id="thumbnail" name="thumbnail">
                        </div>

                     </div>

                  </div>
               </div>
               <!--내 글 공개 여부 설정 default값은 전체 공개-->
               <div class="row">
                  <div class="form-check form-switch" style="margin: 1.5% 0% 0% 61.5%;">
                     <input class="form-check-input" type="checkbox" id="viewAll" name="viewAll" id="flexSwitchCheckDefault">
         <script>
         $("#viewAll").is(":checked")
         {
        	 $("#viewAll").val('1');
         } else {
        	 $("#viewAll").val('0');
         }
           
     
         </script>
                     <label class="form-check-label" for="flexSwitchCheckDefault">전체 공개</label>
                  </div>
               </div>

            </div>
            <!--취소시 글 작성 페이지로 back 저장 누르면 글 작성 완료-->
            <div class="row my-md-3" style="width: 30%; margin: 0 auto;">

               <div class="btn-group my-md-0" role="group" aria-label="Basic radio toggle button group"
                  style="height: 2.7rem;">

                  <input type="radio" class="btn-check"  id="btnradio3" autocomplete="off">
                  <label class="btn btn-outline-primary hide" for="btnradio3"
                     style="font-size: 1.3rem; width: 2rem;  border: 0">취소</label>
                  &nbsp;&nbsp;&nbsp;
                  <input type="radio" class="btn-check" name="btnradio2" id="btnradio4" autocomplete="off">
                  <input type="submit" class="btn btn-outline-primary show px-md-0" for="btnradio4" value="작성"
                     style="font-size: 1.3rem;  width: 2rem; background-color: #0d6efd; color: white;">

         
      </div>
   </div>
   </div>

   </div>
</form>
   <script>
      /*작성과 작성검토 부분을 버튼으로 연결함(버튼은 임시)
    up은 작성검토 페이지 화면으로 올리기 down은 내리기
    toggleclass사용
*/


      $(document).ready(function () {
         $(".hide").click(function () {
            $("#articles").show();
            $("#check").hide();
            $("#articles").toggleClass('fadeIn');
            $("#check").toggleClass();



         });
         $("#show").click(function () {
            $("#check").show();
            $("#articles").hide();
            $("#check").toggleClass('fadeIn');
            $("#articles").toggleClass();



         });

         var checked = $('.form-check-input').is(':checked');
         console.log('check여부' + checked);

         $(".form-switch").click(function () {



            var checked = $('.form-check-input').is(':checked');

            console.log('check여부' + checked);
            if (!checked) {
               $(".form-check-label").html('&nbsp;비공개');
               // $('.form-switch').attr('checked',true);
            } else {
               $(".form-check-label").text('전체 공개');

            }
         });
         
         

         $('#floatingTextarea').keyup(function () {
            var contentL = $(this).val().length;
            console.log(contentL);
            $('#textL').text(contentL);
            if (contentL > 100) {
               $(this).val($(this).val().substring(0, 100));
               alert("최대 100글자까지 가능합니다.");

            }
            $('#textSlash').click(function () {
               var content = $('.content').val();
               $('.content').val(content + "~텍스트~");
            })
         });
      })
   </script>

   <!-- 글 작성 페이지에만 적용되는 bootstrap js. 여기는 헤더가 없어요. 지우지 마세요. -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
   </script>

</body>

</html>