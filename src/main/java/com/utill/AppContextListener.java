//By Moditha
package com.utill;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

//MySQL opens a background thread for cleaning unused connections, and if you don't stop it, it keeps running even after your app is destroyed.
//This listener class shuts it down cleanly during app undeploy (contextDestroyed), preventing memory leaks.

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialization logic, if needed.
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Deregister JDBC drivers
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                System.out.println("Deregistered JDBC driver: " + driver);
            } catch (Exception e) {
                System.err.println("Error deregistering driver " + driver + ": " + e.getMessage());
            }
        }

        com.mysql.cj.jdbc.AbandonedConnectionCleanupThread.checkedShutdown();
		System.out.println("AbandonedConnectionCleanupThread shut down.");
    }
}

