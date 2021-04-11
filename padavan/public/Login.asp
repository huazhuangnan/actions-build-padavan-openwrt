<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>登录</title>
  <style type="text/css">
    * {
      margin: 0px;
      padding: 0px;
      box-sizing: border-box;
    }

    body,
    html {
      height: 100%;
      background-color: #333;
      font-family: 'Microsoft Yahei', sans-serif;
    }

    h1 {
      margin: 0px;
      letter-spacing: 10px;
    }

    .login-contain {
      width: 100%;
      height: 100%;
      padding: 60px 30px 30px;
      color: #fff;
    }

    .login-head {
      height: 10%;
      font-size: 16px;
      text-align: center;
    }

    .login-main {
      height: 80%;
      padding: 10px 0;
    }

    .login-item {
      position: relative;
      margin: 30px 0px;
    }

    .login-item label,
    .login-item input {
      width: 100%;
      height: 42px;
      margin: 16px 0px;
    }

    .login-item label {
      font-size: 18px;
    }

    .login-item input {
      padding-left: 10px;
      font-size: 16px;
      outline: none;
    }

    .login-item b {
      float: right;
      color: #e84118;
    }

    .login-item input:focus {
      padding-bottom: 2px;
      border: 2px solid #ffffff;
    }

    .login-item:last-child {
      text-align: center;
    }

    .login-item i {
      cursor: pointer;
      font-size: 20px;
      font-weight: bolder;
      color: #27ae60;
      position: absolute;
      top: 46px;
      right: 20px;
      user-select: none;
    }

    .login-item button {
      width: 126px;
      margin: 5px 20px;
      padding: 8px 20px;
      color: #fff;
      font-size: 20px;
      text-align: center;
      cursor: pointer;
      border: none;
      outline: none;
    }

    #btn-sub {
      background-color: #00a8ff;
    }

    #btn-sub:hover {
      background-color: #0097e6;
      border-radius: 5px;
    }

    #btn-reset {
      background-color: #e74c3c;
    }

    #btn-reset:hover {
      background-color: #e84118;
      border-radius: 5px;
    }

    .login-foot {
      height: 10%;
      padding-top: 20px;
      text-align: center;
    }

    @media screen and (min-width:721px) {

      body,
      html {
        height: 100%;
        background-color: #333;
        font-family: 'Microsoft Yahei', sans-serif;
      }

      .login-item {
        margin: 32px 0px;
      }

      .login-contain {
        width: 420px;
        height: 520px;
        position: absolute;
        top: 50%;
        left: 50%;
        padding: 10px;
        margin-top: -300px;
        margin-left: -260px;
      }
    }
  </style>
</head>

<body>
  <div class="login-contain">
    <div class="login-head">
      <h1>登 录</h1>
    </div>
    <div id="login-info"></div>
    <div id="login" class="login-main">
      <div class="login-item">
        <label for="user-in">用户名</label>
        <b> </b>
        <input id="user-in" type="text" placeholder="请输入[A-Za-z0-9_]5-20位用户名" />
      </div>
      <div class="login-item">
        <label for="pass-in">密码</label>
        <b> </b>
        <input id="pass-in" type="password" placeholder="请输入[0-9a-zA-Z_!?]5-20位的密码" />
        <i id="view-pass">显</i>
      </div>

      <div class="login-item">
        <button id="btn-sub">提 交</button>
        <button id="btn-reset">重 置</button>
      </div>
    </div>
    <div class="login-foot">
      <p>
        <script>document.write(new Date().getFullYear())</script> &copy; <a href="https://github.com/HuaZhuangNan"
          style="color:#fff">花妆男</a> 版权所有
      </p>
    </div>
  </div>
  <!-- 使用js -->
  <script>
    ~(function (window) {
      // 变量
      var loginInfo = viewPass = userInput = passInput = subBtn = resetBtn = null;
      // 页面加载完
      window.addEventListener('load', init);
      // 初始化
      function init() {
        // 获取
        loginInfo = window.document.getElementById("login-info");
        viewPass = window.document.getElementById("view-pass");
        userInput = window.document.getElementById("user-in");
        passInput = window.document.getElementById("pass-in");
        subBtn = window.document.getElementById("btn-sub");
        resetBtn = window.document.getElementById("btn-reset");
        // 添加事件
        viewPass.addEventListener('click', viewPassToggle, false);
        resetBtn.addEventListener('click', resetInput, false);
        subBtn.addEventListener('click', subToServer, false);
        // 重置下
        resetInput();
      };
      // 密码切换按钮
      function viewPassToggle() {
        if (viewPass.innerText == '显') {
          viewPass.innerText = '隐';
          passInput.type = "text";
        } else {
          viewPass.innerText = '显';
          passInput.type = "password";
        }
      }
      // 重置
      function resetInput() {
        userValueInit();
        passValueInit();
        setLoginInfo();
      }
      // 用户框值初始化
      function userValueInit() {
        userInput.value = '';
        userInput.previousElementSibling.innerText = '';
        userInput.removeEventListener('focus', userValueInit, false);
        setLoginInfo();
      }
      // 密码框值初始化
      function passValueInit() {
        passInput.value = '';
        passInput.previousElementSibling.innerText = '';
        passInput.removeEventListener('focus', passValueInit, false);
        setLoginInfo();
      }
      // 提示信息设置
      function setLoginInfo(text = '', color = '#27ae60') {
        loginInfo.innerText = text
        loginInfo.style.color = color
      }
      // 用户名 err
      function userErr() {
        userInput.addEventListener('focus', userValueInit, false);
        userInput.previousElementSibling.innerText = "用户名填写失误";
      }
      // 密码err
      function passErr() {
        passInput.addEventListener('focus', passValueInit, false);
        passInput.previousElementSibling.innerText = "密码填写有误";
      }
      // 提交 err
      function subErr(text) {
        setLoginInfo("失败：" + text + "，请检查网络或稍后重试!", "#e84118")
        setTimeout(function () { setLoginInfo() }, 3 * 1000)
      }
      // 编码 IE 10+
      function basicB64Encode(user, password) {
        return 'Basic ' + btoa(encodeURIComponent(user.toString() + ':' + password.toString()).replace(/%([0-9A-F]{2})/g,
          function (match, p1) {
            return String.fromCharCode('0x' + p1);
          }));
      }
      // 提交
      function subToServer() {

        if (document.hidden) return;
        // 提交数据赋值
        var data = {
          'u': userInput.value.trim(),
          'p': passInput.value.trim(),
        }
        var count = 0;
        // 验证
        if (/^\w{5,20}$/.test(data['u']) == false) { userErr() } else { ++count };
        if (/^[\w!?]{5,20}$/.test(data['p']) == false) { passErr() } else { ++count };
        // 提交
        if (count === 2) {
          //请求参数、创建XMLHttpRequest
          var req;
          try {
            if (window.XMLHttpRequest)
              req = new XMLHttpRequest();
            else
              req = new ActiveXObject("Microsoft.XMLHTTP");
          } catch (e) {
            req = null;
          }
          if (req != null) {
            req.open("HEAD", "/", true)
            req.setRequestHeader('Authorization', basicB64Encode(data.u, data.p))
            req.onreadystatechange = function () {
              if (req.readyState === 4) {
                window.location.href = "/"
              }
            }
            req.send(null)
          }
        }
      }
    })(window)
  </script>
</body>

</html>
