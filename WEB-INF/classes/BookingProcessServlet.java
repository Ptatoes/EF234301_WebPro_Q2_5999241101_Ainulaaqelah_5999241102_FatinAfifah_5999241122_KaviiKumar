// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookingProcessServlet extends HttpServlet {
   public BookingProcessServlet() {
   }

   protected void doPost(HttpServletRequest var1, HttpServletResponse var2) throws ServletException, IOException {
      var2.setContentType("text/html;charset=UTF-8");
      String var3 = "jdbc:mysql://localhost:3306/holiday_trip";
      String var4 = "root";
      String var5 = "";

      try {
         int var6 = Integer.parseInt(var1.getParameter("tripId"));
         String var7 = var1.getParameter("customer_name");
         String var8 = var1.getParameter("email");
         String var9 = var1.getParameter("phone");
         int var10 = Integer.parseInt(var1.getParameter("number_of_people"));
         Date var11 = new Date();
         SimpleDateFormat var12 = new SimpleDateFormat("yyyy-MM-dd");
         String var13 = var12.format(var11);
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection var14 = DriverManager.getConnection(var3, var4, var5);
         String var15 = "INSERT INTO bookings (customer_name, email, phone, trip_id, number_of_people, booking_date) VALUES (?, ?, ?, ?, ?, ?)";
         PreparedStatement var16 = var14.prepareStatement(var15);
         var16.setString(1, var7);
         var16.setString(2, var8);
         var16.setString(3, var9);
         var16.setInt(4, var6);
         var16.setInt(5, var10);
         var16.setString(6, var13);
         int var17 = var16.executeUpdate();
         var14.close();
         if (var17 > 0) {
            var2.sendRedirect("index.jsp?message=success&details=Your booking has been successfully confirmed!");
         } else {
            var2.sendRedirect("index.jsp?message=error&details=Booking failed. Please try again.");
         }
      } catch (Exception var18) {
         var18.printStackTrace();
         var2.sendRedirect("index.jsp?message=error&details=An error occurred: " + var18.getMessage());
      }

   }
}
