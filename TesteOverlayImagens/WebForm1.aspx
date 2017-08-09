<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TesteOverlayImagens.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .outsideWrapper{ 
            width:150px; height:150px; 
            /*margin:20px 60px; */
            border:1px solid blue;}
        .insideWrapper{ 
            width:100%; height:100%; 
            position:relative;}
        .coveredImage{ 
            width:100%; height:100%; 
            position:absolute; top:0px; left:0px;
        }
        .coveringCanvas{ 
            width:100%; height:100%; 
            position:absolute; top:0px; left:0px;
            background-color: rgba(255,0,0,.1);
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div style="display:block">
           <div style="margin-left:auto;margin-right:auto;display:block">
               <asp:Image ID="imgFinal" runat="server" ImageUrl="~/Images/default-thumbnail.jpg" Width="150px" Height="150px"/>
            </div>
       </div>--%>

        
    <div style="margin:auto;display:block;margin-top:300px;">
        
        <div id="div1" style="float:left;margin-left:20px;">
            
            
  <%--          <div class="outsideWrapper">
                <div class="insideWrapper">
                    <asp:Image ID="imgOriginal" runat="server" ImageUrl="~/Images/default-thumbnail.jpg" onclick="imageOnClick(this);" CssClass="coveredImage"/>
                    <canvas id="canvas" class="coveringCanvas" onclick="imageOnClick(this);"></canvas>
                </div>
            </div>--%>

                     <asp:Image ID="imgOriginal" runat="server" ImageUrl="~/Images/default-thumbnail.jpg" onclick="imageOnClick(this);" Width="150px" Height="150px"/>
                    
        </div>
        <div style="float:right;margin-right:20px;">
            <asp:Image ID="imgSobrepor" runat="server" ImageUrl="~/Images/default-thumbnail.jpg" Width="150px" Height="150px" />
        </div>
                    
    </div> 

        <div style=" top: 153px; left: -11px;">

            <div style="float:left;margin-left:20px;">
                <asp:FileUpload ID="fuImagem1" runat="server" accept=".png,.jpg,.jpeg,.gif" />
                <asp:Button ID="btnUpload1" runat="server" Text="Upload" OnClick="btnUpload1_Click" />
            </div>
            <div style="float:right;margin-right:20px;">
                <asp:FileUpload ID="fuImagem2" runat="server" accept=".png,.jpg,.jpeg,.gif"/>
                <asp:Button ID="btnUpload2" runat="server" Text="Upload" OnClick="btnUpload2_Click" />
                <div>
                
                    <div>
                        <asp:Label ID="lblMargemSuperior" runat="server" Text="Margem Superior:   " ></asp:Label>
                        <asp:TextBox ID="txtMargemSuperior" runat="server" Width="30px"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblMargemEsquerda" runat="server" Text="Margem Esquerda:"></asp:Label>
                        <asp:TextBox ID="txtMargemEsquerda" runat="server" Width="30px"></asp:TextBox>
                        
                    </div>
                        
                    <div>
                        <asp:Label ID="lblLarguraImgOverlay" runat="server" Text="Largura imagem overlay:   " ></asp:Label>
                        <asp:TextBox ID="txtLarguraImgOverlay" runat="server" Width="30px"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblAlturaImgOverlay" runat="server" Text="Altura imagem overlay:"></asp:Label>
                        <asp:TextBox ID="txtAlturaImgOverlay" runat="server" Width="30px"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" style="height: 26px" />
            </div>
            </div>
            
        </div>
            
    </form>
    <script>

        function imageOnClick(elementRef) {
            var posObject = getEventLocation(event);
            //alert(' Coordenadas do click:\n x: ' + posObject.x + '\n y: ' + posObject.y);

            document.getElementById("txtMargemSuperior").value = posObject.y;

            document.getElementById("txtMargemEsquerda").value = posObject.x;
        }
        function getEventLocation(eventRef) {
            var positionX = 0;
            var positionY = 0;

            if (eventRef.pageX) {
                positionX = eventRef.pageX;
                positionY = eventRef.pageY;
            }
            else if (window.event) {
                positionX = eventRef.clientX + document.body.scrollLeft;
                positionY = eventRef.clientY + document.body.scrollTop;
            }
            else if (eventRef.clientX) {
                positionX = eventRef.clientX;
                positionY = eventRef.clientY;
            }

            return { x: positionX, y: positionY };
        }


        //funções q eu uso no outro exemplo mas q n funcionaram ainda
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

        //init();

        window.onload = function () {
            init();
        }

</script>
</body>
</html>
