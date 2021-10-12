<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/10/11
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- import Vue before Element -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- import JavaScript -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <!-- jquery -->
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${applicationScope.path}/resources/dist/css/login3.css"/>
    <!-- ajax -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <%-- 导入QS。js 文件--%>
    <script src="https://cdn.bootcdn.net/ajax/libs/qs/6.10.1/qs.js"></script>
    <style>
        .clazz {
            width: 30%;
        }
        .div{
            margin-bottom: 30px;
            margin-left: 200px;
        }
    </style>
</head>
<body>
<div id="app">
    <div class="div">
        原密码：
        <el-input class="clazz" show-password="true" v-model="formerPassword" placeholder="请输入内容"></el-input>
    </div>
    <br/>
    <div class="div">
        新密码：
        <el-input class="clazz" show-password="true" v-model="newPassword" @blur="verifyPassword"
                  placeholder="请输入内容"></el-input>
        <span id="hint" style="color: salmon"></span>
    </div>
    <br/>
    <div class="div">
        确认密码：
        <el-input class="clazz" show-password="true" v-model="confirmPassword" @blur="updateVerify"
                  placeholder="请输入内容"></el-input>
        <span id="hint2" style="color: lawngreen"></span>
    </div>
    <div class="div">
        <el-button type="primary" round @click="sub">修改</el-button>
        <el-button type="primary" round @click="reset">重置</el-button>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#hint").hide();
        $("#hint2").hide();
    })
    new Vue({
        el: '#app',
        data: {
            formerPassword: '${sessionScope.user.password}',
            newPassword: '',
            confirmPassword: ''
        },
        methods: {
            verifyPassword() {
                if (this.newPassword.length <= 12) {
                    $("#hint").hide()
                } else {
                    $("#hint").show().html("密码长度只能在12位以内");
                }
            },
            updateVerify() {BaseServlet
                if (this.newPassword == this.confirmPassword && this.newPassword != '') {
                    $("#hint2").show().html("验证通过");
                } else {
                    $("#hint2").show().html("确认密码与新密码不同，请重新输入");
                }
            },
            // 提交
            sub(){

            },
            reset(){
                this.newPassword = '';
                this.confirmPassword = '';
                $("#hint2").hide();
            }
        }
    })
</script>
</html>
