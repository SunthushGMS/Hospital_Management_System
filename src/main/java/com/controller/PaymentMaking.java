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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String fullname = request.getParameter("fullname");
            String patientID = request.getParameter("patientID");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String service = request.getParameter("service");
            String amountStr = request.getParameter("amount");

            if (fullname == null || patientID == null || phone == null || email == null || service == null || amountStr == null) {
                response.sendRedirect("Patient?error=" + URLEncoder.encode("Missing fields in form.", "UTF-8"));
                return;
            }

            double amount;
            try {
                amount = Double.parseDouble(amountStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("Patient?error=" + URLEncoder.encode("Invalid amount format", "UTF-8"));
                return;
            }

            Payment payment = new Payment(0, fullname, patientID, phone, email, service, amount);

            boolean isInserted = PaymentService.makePayment(payment);

            if (isInserted) {
                response.sendRedirect("PaymentHistory?success=" + URLEncoder.encode("Payment processed successfully!", "UTF-8"));
            } else {
                response.sendRedirect("Patient?error=" + URLEncoder.encode("Error processing payment. Please try again.", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Patient?error=" + URLEncoder.encode("Unexpected error occurred!", "UTF-8"));
        }
    }
}
