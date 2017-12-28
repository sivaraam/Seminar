<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import = "java.util.*,org.json.simple.JSONValue" %>
<%@ page import = "helper.DisplayHelper" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Seminar hall booking (second form)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="node_modules/normalize.css/normalize.css">
    <!-- Material Design Components -->
    <link rel="stylesheet" href="node_modules/material-components-web/dist/material-components-web.css">

    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/second-form.css">

  </head>
  <body>
    <jsp:useBean id="booking" class="helper.DisplayHelper" />
    <% Map<Integer,Integer> bookings = (Map<Integer,Integer>)request.getAttribute("bookingsData");
         DisplayHelper book = new DisplayHelper();
      	 book.setHallBookings(bookings);
      	 book.setCurrentStaffId(Integer.parseInt(request.getParameter("staffId")));
      	 Map<String,String> subjectsByClass = book.getSubjectsAndClasses();
      	 request.setAttribute("subjectsByClass",subjectsByClass);
      	 String subjectClassJson = JSONValue.toJSONString(subjectsByClass);   //Convert to JSON String
    %>
    <!--[if lt IE 8]>
      <p>You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <header class="header-container">
        <img src="img/logo.jpg" alt="College logo">
        <h1>Seminar hall booking</h1>
    </header>
    <div class="main-container">
      <div class="form-container">
        <div class="known-data">
          <div class="mdc-layout-grid form-item">
            <div class="mdc-layout-grid__inner">
              <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-6">
                <span class="title">Date:</span>
                <span class="value"><%=request.getParameter("booking-date") %></span>
              </div>
              <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-4">
                <span class="title">Hall:</span>
                <span class="value"><%=request.getParameter("hall") %></span>
              </div>
            </div>
          </div> <!-- .msc-layout-grid -->
        </div>

        <form action="book" method="post">
          <div class="form-item">
            <div class="form-item-label">Hall Status</div>
            <div class="form-item-input">
              <table>
                <thead>
                  <tr>
                    <th>
                      <div class="mdc-checkbox checkbox">
                        <input type="checkbox" class="mdc-checkbox__native-control" name="hour" value="all"/>
                        <div class="mdc-checkbox__background">
                          <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                            <path class="mdc-checkbox__checkmark__path"
                                  fill="none"
                                  stroke="white"
                                  d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                          </svg>
                          <div class="mdc-checkbox__mixedmark"></div>
                        </div>
                      </div>
                    </th>
                    <th>
                      <div class="data">
                        Hour
                      </div>
                    </th>
                    <th>
                      <div class="data">
                        Status
                      </div>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach begin="1" end="8" var="period">
		                <tr class="template">
                      <td>
                        <div class="mdc-checkbox checkbox">
                          <input type="checkbox" class="mdc-checkbox__native-control" name="hour" value='${period}'/>
                          <div class="mdc-checkbox__background">
                            <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                              <path class="mdc-checkbox__checkmark__path"
                                    fill="none"
                                    stroke="white"
                                    d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                            </svg>
                            <div class="mdc-checkbox__mixedmark"></div>
                          </div>
                        </div>
                      </td>
                      <td>
                        <div class="data">
                          ${period}
                        </div>
                      </td>
                      <td>
                        <div class="data">
                          <%=book.getStatus((int)pageContext.getAttribute("period"))%>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div> <!-- .form-item-input -->
          </div> <!-- .form-item -->

          <div class="mdc-layout-grid form-item form-items">
            <div class="mdc-layout-grid__inner">

             <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-6 form-item">
                <div class="form-item-label">Class</div>
                <div class="form-item-input">
                  <select class="mdc-select" name="class" required>
                    <option value="" selected>Choose a class</option>
           			    <c:forEach items="${subjectsByClass}" var="subjectsByClass">
                      <option value='${subjectsByClass.key}'>${subjectsByClass.key}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>

              <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-6 form-item subject">
                <div class="form-item-label">Subject</div>
                <div class="form-item-input">
                  <select class="mdc-select" name="subject" required>
                  </select>
                </div>
              </div>

            </div>
          </div> <!-- .form-items -->

          <div class="form-item">
            <div class="form-item-input form-buttons">
            <a href = "index.jsp" >
              <button class="mdc-button mdc-button--raised mdc-button--primary back-button" formnovalidate type="button">
                Back
              </button>
            </a>

              <button name = "book" id = "book" class="mdc-button mdc-button--raised mdc-button--primary submit-button" type="submit">
                Book
              </button>
            </div> <!-- .form-item-input -->
          </div> <!-- .form-item -->
          <input type="hidden" name="booking-date" value='<%=request.getParameter("booking-date")%>'/>
          <input type="hidden" name="hall" value='<%=request.getParameter("hall")%>'/>
          <input type="hidden" name="staffId" id="staffId" value='<%=request.getParameter("staffId")%>'/>
        </form>
      </div> <!-- form-container -->
    </div> <!-- main-container -->

    <script type="text/javascript" src="node_modules/jquery/dist/jquery.js"></script>
    <script type="text/javascript">
    $('select[name=class]').change(function() {
      var selected_class = $(this).find(':selected').val();
      //Get the JSON String
      var subjectClassJson = '<%=subjectClassJson%>';
      //Get back the Map as JS Array
 	    var subjectClass = JSON.parse(subjectClassJson);
      //Add the Subjects for the selected class
      $('select[name=subject]').append("<option value="+subjectClass[selected_class]+" selected>"+subjectClass[selected_class]+"</option>")
 	    display();
    });
    //Display the hidden method
    function display() {
    	//Changed to default display property
    	$('.subject').css("display","initial");
    }
    $()
      $(document).ready(function() {
      	  $('.subject').hide();
      })
      // TODO : Initialize MDC componenets & jquery ui
    </script>
  </body>
</html>
