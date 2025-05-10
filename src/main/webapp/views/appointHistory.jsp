<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment History | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="/views/partials/header.jsp"/>

    <h1 class="history-head">Appointment History</h1>
    

 

    <section class="sec1">
        <div class="table-view">
            <c:if test="${not empty appointments}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Doctor ID</th>
                            <th>Patient ID</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${appointments}">
                            <tr>
                                <td>${a.id}</td>
                                <td>${a.doctorId}</td>
                                <td>${a.patientId}</td>
                                <td>${a.appointmentDate}</td>
                                <td>${a.time}</td>
                                <td>${a.status}</td>
                               <td>
							    <c:choose>
							        <c:when test="${a.status eq 'Pending'}">
							            <button class="btn-update" onclick="openModal(${a.id}, '${a.doctorId}', '${a.appointmentDate}', '${a.time}')"><i class='bx bx-revision'></i> Update</button>
							            <a href="DeleteAppointment?id=${a.id}" onclick="return confirm('Are you sure you want to delete this appointment?')">
							                <button class="btn-delete"><i class='bx bx-trash'></i> Delete</button>
							            </a>
							        </c:when>
							        <c:when test="${a.status eq 'rescheduled'}">
							            <button class="btn-update" onclick="openModal(${a.id}, '${a.doctorId}', '${a.appointmentDate}', '${a.time}')"><i class='bx bx-revision'></i> Reschedule</button>
							            <a href="DeleteAppointment?id=${a.id}" onclick="return confirm('Are you sure you want to delete this appointment?')">
							                <button class="btn-delete"><i class='bx bx-trash'></i> Delete</button>
							            </a>
							        </c:when>
							        <c:otherwise>
							            <span>No Action</span>
							        </c:otherwise>
							    </c:choose>
							</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty appointments}">
                <p>No appointments found.</p>
            </c:if>

           
           <button onclick="exportTableToPDF()" class="btn-down"><i class='bx bx-download'></i> Download PDF</button>

<script>
    async function exportTableToPDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        let rows = [];
        const headers = ["ID", "Doctor ID", "Patient ID", "Date", "Time", "Status"];
        rows.push(headers);

        document.querySelectorAll("table tbody tr").forEach((tr) => {
            let row = [];
            tr.querySelectorAll("td").forEach((td) => {
                row.push(td.innerText);
            });
            rows.push(row);
        });

        doc.autoTable({
            head: [headers],
            body: rows.slice(1),
        });

        doc.save("AppointmentHistory.pdf");
    }
</script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>


        </div>
    </section>
    <div class="modal-overlay" id="editModalOverlay">
    <div class="modal">
        <h3>Edit Appointment</h3>
        <form action="AppointmentUpdateController" method="post">
            <input type="hidden" name="id" id="modal-id">

            <label>Doctor ID</label>
            <input type="text" name="doctorId" id="modal-doctorId" required>

            <label>Date</label>
            <input type="date" name="date" id="modal-date" required>

            <label>Time</label>
            <input type="time" name="time" id="modal-time" required>

            <button type="submit">Submit</button>
            <button type="button" onclick="closeModal()">Cancel</button>
        </form>
    </div>
    <c:if test="${not empty param.success}">
    <div class="alert success">${param.success}</div>
</c:if>

<c:if test="${not empty param.error}">
    <div class="alert error">${param.error}</div>
</c:if>
    
</div>
  <script>
    function openModal(id, doctorId, date, time) {
        document.getElementById('modal-id').value = id;
        document.getElementById('modal-doctorId').value = doctorId;
        document.getElementById('modal-date').value = date;
        document.getElementById('modal-time').value = time;
        document.getElementById('updateModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('updateModal').style.display = 'none';
    }

    
    window.onclick = function(event) {
        const modal = document.getElementById('updateModal');
        if (event.target === modal) {
            closeModal();
        }
    }
</script>
    

    <jsp:include page="/views/partials/footer.jsp"/>

</body>
</html>
