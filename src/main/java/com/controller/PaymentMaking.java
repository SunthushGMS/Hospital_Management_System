package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Payment;
import com.service.PaymentService;

@WebServlet("/PaymentMaking")
public class PaymentMaking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
         
            String fullname = request.getParameter("fullname");
            String patientID = request.getParameter("patientID");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");  
            String service = request.getParameter("service");
            String amountStr = request.getParameter("amount");
            
          
            double amount = Double.parseDouble(amountStr);

          
            Payment payment = new Payment(0, fullname, patientID, phone, email, service, amount);

          
            boolean isInserted = PaymentService.makePayment(payment);

            if (isInserted) {
               
                response.sendRedirect("patient.jsp?success=" + URLEncoder.encode("Payment processed successfully!", "UTF-8"));
            } else {
                
                String message = "Error processing payment. Please try again.";
                response.sendRedirect("patient.jsp?error=" + URLEncoder.encode(message, "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
     
            String message = "Error processing payment. Please try again.";
            response.sendRedirect("patient.jsp?error=" + URLEncoder.encode(message, "UTF-8"));
        }
    }
}
