﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCanvas.aspx.cs" Inherits="TesteOverlayImagens.WebFormCanvas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
          padding:0;
          margin:0;
          background:#FFF;
        }
        canvas {
          display:block;
          margin:30px auto 0;
          background:#ccc;
        }
        h1 {
          position:absolute;
          top:0;
          left:0;
          color:#fff;
          margin:0;
          font-size:80px;
          font-family:Arial, sans-serif;
          width:400px;
          line-height:80px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <canvas id="canvas" width="500" height="500"></canvas>

    </form>

    <script>
        var canvas = document.getElementById('canvas'),
            ctx = canvas.getContext('2d'),
            rect = {},
            drag = false;

        function draw() {
          ctx.fillRect(rect.startX, rect.startY, rect.w, rect.h);
        }

        function mouseDown(e) {
          rect.startX = e.pageX - this.offsetLeft;
          rect.startY = e.pageY - this.offsetTop;
          drag = true;
        }

        function mouseUp() {
          drag = false;
        }

        function mouseMove(e) {
          if (drag) {
            rect.w = (e.pageX - this.offsetLeft) - rect.startX;
            rect.h = (e.pageY - this.offsetTop) - rect.startY ;
            ctx.clearRect(0,0,canvas.width,canvas.height);
            draw();
          }
        }

        function init() {
          canvas.addEventListener('mousedown', mouseDown, false);
          canvas.addEventListener('mouseup', mouseUp, false);
          canvas.addEventListener('mousemove', mouseMove, false);
        }

        init();

</script>
</body>
</html>
