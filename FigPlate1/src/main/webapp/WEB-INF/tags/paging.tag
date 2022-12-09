<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ tag body-content="empty" %>
<%@ attribute name="statisticId" type="java.lang.String" required="true"%>
<%@ attribute name="totalPageCount" type="java.lang.Integer" required="true"%>
<%@ attribute name="nowPage" type="java.lang.Integer" required="true"%>
<%
int totalPageBlock = (int)(Math.ceil(totalPageCount/10.0));
int nowPageBlock = (int) Math.ceil(nowPage/10.0);
int startPage = (nowPageBlock-1)*10 + 1;
int endPage = 0;
String contextPath = application.getContextPath();

if(contextPath == null || contextPath.trim().equals("")) {
   contextPath = "";
}else {
   //contextPath = "/"+contextPath;
}
if(totalPageCount > nowPageBlock*10) {
   endPage = nowPageBlock*10;
}else {
   endPage = totalPageCount;
} 

/* out.println("<nav aria-label=\"Page navigation\">");
out.println("<ul class=\"pagination\">"); */
if(nowPageBlock>1) {
/*    out.print("<li>"); */
   out.print("<a href=\"" + contextPath + "/diner/list/" + statisticId + "/" + (startPage-1) + "\" aria-label=\"Previous\">");
   out.print("◀</a>");
/*    out.println("</li>"); */
}
for(int i=startPage; i<=endPage; i++) {
   out.print(" ");
   if(i==nowPage) {
/*       out.print("<li class=\"active\">"); */
      out.print("<div class=\"paging-button paging-button-selected\">");
   }else {
/*       out.print("<li>"); */
      out.print("<div class=\"paging-button\">");
   }
   out.print("<a href=\"" + contextPath + "/diner/list/"+ statisticId + "/" + (i) + "\">");
   out.print(i);
   out.print("</a>");      
/*    out.println("</li>"); */
    out.println("</div>");
} 
if(nowPageBlock<totalPageBlock) {
/*    out.print("<li>"); */
   out.print("<a href=\"" + contextPath + "/diner/list/" + statisticId + "/" + (endPage+1) + "\" aria-label=\"Next\">");
   out.print("▶</a>");
/*    out.println("</li>"); */
}
/* out.println("</ul>");
out.println("</nav>"); */
%>