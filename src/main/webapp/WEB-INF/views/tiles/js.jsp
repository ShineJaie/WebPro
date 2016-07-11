<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value='/resource/dependency/js/jquery.min.js'/>"></script>

<script src="<c:url value="/resource/dependency/jquery-pjax/jquery.pjax.js"/>"></script>

<script>
    $(document).on('submit', 'form[data-pjax]', function (event) {
        $.pjax.submit(event, '#pjax-container')
    });

    $(document).pjax('a[data-pjax]', '#pjax-container');
</script>