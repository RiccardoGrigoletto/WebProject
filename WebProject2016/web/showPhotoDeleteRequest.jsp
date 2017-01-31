<%-- 
    Document   : administrator
    Created on : 11-ott-2016, 11.12.58
    Author     : Marco
--%>
<%@page import="beans.NotificationRepliesBean"%>
<%@page import="beans.NotificationBean"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <jsp:include page="header/headerFiles.jsp"/>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>    
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/notifcation.css" rel="stylesheet">
        <link rel="stylesheet" href="css/generic.css">

    </head>
    <body>
        <!--Search that i used to find the reply that was clicked-->
        <c:forEach var="notbean" items="${noty.delphotos}">
            <c:if test="${notbean.idphoto == param.id}">
                <c:set var="deletephoto" value="${notbean}"></c:set>
            </c:if>
        </c:forEach>
        <jsp:include page = "header/header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <h1>Questa fotografia è opportuna?</h1>
                </div>
            </div>
            <hr class="style15">
            <!-- test which kind of user is and so i can show the right notification-->
            <!--area che verrà aggiornata dallo script-->
            <div class="row" style="text-align:center">
                <div class="col-lg-12 col-sx-12 col-sm-12 col-md-12" >
                     <img src="${deletephoto.photoname}">
                </div>
            </div>
            <br>
            <div class="row" style="text-align:center">
                <h4>Premendo su <strong>SI</strong> la fotografia sarà mostrata al pubblico, premendo su 
                <strong>NO</strong> la fotograifa non sarà più visibile.</h4> 
            </div>
            <!-- panel per la conferma dei cambiamenti -->  
            <div class="row" style="text-align:center">
                <div class="col-lg-12 col-sx-12 col-sm-12 col-md-12" >

                    <form action="${deletephotoURL}" method="POST">
                        <div class="form-group">
                            <!--Setting get parameter (id of reply) using jstl -->
                            <c:url value="DeletePhotoRequest" var="deletephotoURL">
                                <c:param name="id" value="${param.id}"/>
                            </c:url>

                            <button type="submit"  name="button" class="btn btn-danger" value='n'>No</button>
                            <button type="submit"  name="button" class="btn btn-success" value='s'>Si</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>
