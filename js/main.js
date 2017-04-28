/* Global constants required for Code */
const months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
const days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
const currDate = new Date();

currSelectedDateID = "date-1";
currSelectedHallID = "cse";
selectedHours = [];

/************** Helper Functions *********************/

// Why's this left unused ?
function parseDate(date) {
  if(date < 10) {
    date = '0'+date;
  }
  return date;
}

function getValues() {
  var dateValue = $(document.getElementById(currSelectedDateID)).val();
  var hallValue = $(document.getElementById(currSelectedHallID)).val();
  return [dateValue, hallValue]
}

function showTableAndButton() {
    document.getElementById("button-container").style.display = "block";
    document.getElementById("status-table-container").style.display = "block";
}

function check() {
  // Looks suspicious ....
  $(':checkbox').change(
                        () => {
                        if ($(this).prop("checked"))
                          selectedHours.push($(this).val());
                        else
                          for(var i = 0; i < selectedHours.length; i++)
                            if($(this).val() == selectedHours[i]) {
                              selectedHours.splice(i,1);
                              break;
                            }
                        }
                       );
}

function invokeDataHandler(handlerLocation, paramsObj, callBack) {
    $.post(handlerLocation, paramsObj, callBack);
}

function displaySchedule() {
  const [dateValue, hallValue] = getValues();
  invokeDataHandler(
                     "jsp/display.jsp",
                     {
                       date  : dateValue.slice(0,2),
                       month : months[currDate.getMonth()],
                       year  : currDate.getFullYear()-2000,
                       hall  : hallValue
                     },
                     (data,status) => {
                       var index = data.indexOf("stop");
                       var table1Contents = data.slice(0,index);
                       var table2Contents = data.slice(index+4,-1);
                       document.getElementById("status-table-1").rows[1].innerHTML = table1Contents;
                       document.getElementById("status-table-2").rows[1].innerHTML = table2Contents;
                       showTableAndButton();
                       check();
                     }
                   );
}

function addListener(elementName,eventName,callback) {
  document.getElementById(elementName).addEventListener(eventName, callback, false);
}

/************** Event Listeners **********************/

function dateChangeListener(e) {
  currSelectedDateID = e.target.getAttribute("id");
}

function hallChangeListener(e) {
  currSelectedHallID = e.target.getAttribute("id");
  displaySchedule();
}

function bookHallListener(e) {
  const [dateValue, hallValue] = getValues();
  if(selectedHours.length === 0) {
    confirm("Please select an hour");
  }
  else {
    var staffId = prompt("Enter the your id:");
    selectedHours.forEach(
                          (hour) => {
                                      invokeDataHandler(
                                                        "jsp/book.jsp",
                                                        {
                                                          period   : hour,
                                                          date     : dateValue.slice(0,2),
                                                          month    : months[currDate.getMonth()],
                                                          year     : currDate.getFullYear()-2000,
                                                          hall     : hallValue,
                                                          staff_id : staffId
                                                        },
                                                        (data,status) => {
                                                          alert(data);
                                                        }
                                                      );
                                    }
                          );
    alert("The End !!!");
  }
  selectedHours = [];     //Probably for testing
}

/************** Functions invoked during page load ********************/
function registerEvents() {
  addListener("date-select","change", dateChangeListener);        // For date chosen through select (small screens)
  for (var i = 1; i <= 5; i++)
    addListener("date-"+i,"change", dateChangeListener);          // For date chose through radio (bigger screens)

  addListener("halls-select","change", hallChangeListener);     // For halls chosen through select (small screens)
  for (var i = 1; i <= 7; i++)
    addListener("hall-"+i,"change", hallChangeListener);          // For halls chose through radio (bigger screens)

  addListener("book","click",bookHallListener);
}

/*
    TODO: Dates to be loaded for select
*/
function loadDates() {
  for (var i = 1; i <= 5; i++) {
    var dayIndex = (currDate.getDay() + (i-1)) % 7;
    var dateAndDay = (currDate.getDate() + (i-1)) + " " + days[dayIndex];
    var dateAndDayText = document.createTextNode(dateAndDay)

    document.getElementById("date-"+i).setAttribute("value", dateAndDay);
    document.getElementById("date-label-"+i).appendChild(dateAndDayText);
  }
}
