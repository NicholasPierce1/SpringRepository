<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.validation.constraints.NotNull" %>
<%@ page import="org.springframework.boot.configurationprocessor.json.JSONObject" %>
<%@ page import="org.springframework.boot.configurationprocessor.json.JSONException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.springframework.boot.configurationprocessor.json.JSONArray" %>
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<%
    final class TestPerson{
        public final String name;
        public final int age;

        TestPerson(@NotNull final String name, @NotNull final int age){
            this.name = name;
            this.age = age;
        }

        public @NotNull final JSONObject getJsonObject() throws JSONException {
            final JSONObject returnValue = new JSONObject();

            returnValue.put("name", this.name);
            returnValue.put("age", this.age);

            return returnValue;
        }
    }

    final List<TestPerson> testPersonList = Arrays.asList(
            new TestPerson("nick", 22),
            new TestPerson("chase", 2),
            new TestPerson("your mom", 150)
    );

    final JSONArray testPersonArray = new JSONArray();

    for(final TestPerson testPerson: testPersonList) {
        try {
            testPersonArray.put(testPerson.getJsonObject());
        } catch (final JSONException jsonException) {
            jsonException.printStackTrace();
        }
    }
%>

<%
    String testString = (String)request.getAttribute("test");
    String color = (String)request.getAttribute("color");
    out.println("<b>" + testString + "</b>");
%>
<h1>This is a Heading with jsp!</h1>
<p style="color: <%out.print(color);%>">This is a <% // make it equal to output of the print
    out.print(testString);%> paragraph.</p>
<a href="form">
    <button style="background-color: blue; color: black; font-size: large">Go to form</button>
</a>
<a href="validationForm">
    <button style="background-color: blue; color: black; font-size: large">Go to validation form</button>
</a>

<br>
<br>
<label>List from mock Web-controller outputs (model map)</label>
<ul id="list">
    <%

        for(final TestPerson testPerson: testPersonList)
            out.println("<li>" + "name: " + testPerson.name + "\nage: " + testPerson.age + "</li>");

    %>
</ul>
<br><br>
<label>List from mock ApiController outputs (JSONObject)</label>
<ul id="jsonArray">

    <%
        for(int i = 0; i < testPersonArray.length(); i++) {
            try {

                final JSONObject testPersonJson = testPersonArray.getJSONObject(i);

                final String name = testPersonJson.getString("name");
                final int age = testPersonJson.getInt("age");

                out.println("<li>" + "name: " + name + "\nage:" + age + "</li>");

            } catch (final JSONException ex) {
                out.println(ex.getMessage());
            }
        }
    %>

</ul>

</body>
</html>
