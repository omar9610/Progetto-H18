<%@page import="java.util.*"%>
<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 10px;
            }
           
            body{
               
                background-color:bisque;
                
                
            }
            
        </style>
        <title>Posto</title>
    </head>
    <body>
        <%
        	String[] pos=request.getSession().getAttribute("msg").toString().split("/");
        	Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr"); 
        	int num=Integer.parseInt(pos[0]);
		    out.print("<center><h1>");
            out.print(pos[1].split("_")[0]);
            out.print("</h1></center>");
        %>
        <table style="border:1; align:center; margin-bottom:2px;">
            <%  
                
                int i,j,k;
                boolean b;
                Viaggio v=servizio.getV1();
                if(Tipologia.values()[num-1]==Tipologia.PRIMA_STANDARD || Tipologia.values()[num-1]==Tipologia.SECONDA_STANDARD){
                   
                    for(i=0;i<servizio.visualizzaposti(num,v).size();i++){
                            k=0;
                            out.print("<table border=\"1\" align=\"center\">");
                            out.print("<tr><h1 align=\"center\" >");
                            out.print("vagone"+servizio.visualizzaposti(num,v).get(i).getNumvagone());
                            out.print("</h1></tr>");  
                            
                            for(j=0;j<servizio.visualizzaposti(num,v).get(i).getPosti().size();j++){
                                String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                b=servizio.getV1().getRegistro().checkposto(s, pr.getStazionepartenza(),pr.getStazionearrivo(),servizio.getV1().getPercorso(),servizio.getV1().getModalita());
                                if(k==0){
                                    out.print("<tr><td id=\""+servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString()+"\""+">");
                                    if(b==true){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+num+"/"+s+"/"+pos[1]+"/"+pos[2]+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                        out.print(s);
                                    }
                                    out.print("</td>");
                                    
                                }
                                if(k==1){
                                    out.print("<td>");
                                    if(b==true){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+num+"/"+s+"/"+pos[1]+"/"+pos[2]+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                        out.print(s);
                                    }
                                    out.print("</td>");
                                    out.print("<td>&nbsp&nbsp</td>");
                                }
                                if(k==2){
                                    out.print("<td>");
                                    if(b==true){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+num+"/"+s+"/"+pos[1]+"/"+pos[2]+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                        out.print(s);
                                    }
                                    out.print("</td>");
                                }    
                               
                                if(k==3){
                                    out.print("<td>");
                                    if(b==true){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+num+"/"+s+"/"+pos[1]+"/"+pos[2]+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                        out.print(s);
                                    }
                                    out.print("</td></tr>");
                                    k=-1;
                                }
                                k++;
                       
                            }
                        out.print("</table>");
                    }
               }
                
                else{
                    for(i=0;i<servizio.visualizzaposti(num,v).size();i++){
                            k=0;
                            out.print("<table border=\"1\" align=\"center\">");
                            out.print("<tr><h1 align=\"center\" >");
                            out.print("vagone"+servizio.visualizzaposti(num,v).get(i).getNumvagone());
                            out.print("</h1></tr>");  
                            
                            for(j=0;j<servizio.visualizzaposti(num,v).get(i).getPosti().size();j++){
                                 String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                 b=servizio.getV1().getRegistro().checkposto(s, pr.getStazionepartenza(),pr.getStazionearrivo(),servizio.getV1().getPercorso(),servizio.getV1().getModalita());
                                if(k==0){
                                    out.print("<tr><td id=\""+servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString()+"\""+">");
                                    if(b==true){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+num+"/"+s+"/"+pos[1]+"/"+pos[2]+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    if(b==false){
                                        out.print(s);
                                    }
                                    out.print("</td>");
                                    out.print("<td>&nbsp&nbsp</td>");
                               }
                                if(k==1){
                                    out.print("<td>");
                                    if(b==true){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+num+"/"+s+"/"+pos[1]+"/"+pos[2]+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                        out.print(s);
                                    }
                                    out.print("</td>");
                                    k=-1;
                              }
                                k++;
                
                            }
                   }
                }
                
                 
            
            
            
           %>
            
            
        </table>
    </body>
</html>

