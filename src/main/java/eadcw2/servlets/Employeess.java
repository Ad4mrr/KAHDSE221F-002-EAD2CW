package eadcw2.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import eadcw2.entity.Employee;
import com.db.utils.DbConnection;

@WebServlet(urlPatterns = {"/register-e-employee" ,"/load-employees"})
public class Employeess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Employeess() {
        super();
        // TODO Auto-generated constructor stub
    }

protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("all employees get");
		try {
			Connection con = DbConnection.connectDB();
			String sqlQuery = "select * ,day(ep_joinDate) as day,month(ep_joindate) as month ,year(ep_joindate) as year  from emp";
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(sqlQuery);
			ArrayList<Employee> employees = new ArrayList<>();
            while (result.next()) {
            	 Employee emp = new Employee();
            		emp.setId( result.getInt("id"));
            		emp.setNic( result.getString("ep_nic"));
            		emp.setName( result.getString("ep_name"));
            		emp.setDepartment( result.getString("ep_department"));
            		emp.setDesignation( result.getString("ep_designation"));
            		emp.setJoinedDate(result.getString("year")+"."+result.getString("month")+"."+result.getString("day"));
            		employees.add(emp);

            }
			req.setAttribute("userList",employees);

			RequestDispatcher disp = req.getRequestDispatcher("allEmployees.jsp");
			disp.forward(req, res);
		
		} catch (Exception e) {
			System.out.println("Something went wrong " + e);
			res.sendRedirect("index.jsp");
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			System.out.println("post request");
			String name = req.getParameter("name");
			String nic = req.getParameter("nic");
			String designation = req.getParameter("designation");
			String department = req.getParameter("department");
			if(nic.isEmpty() == true || name.isEmpty() == true || designation.isEmpty() == true || department.isEmpty() == true) {
				System.out.println("All fields must be Fill");
				res.sendRedirect("index.jsp");
			}else {			
			//DB operation
				try {
					Connection con = DbConnection.connectDB();
			
					String sqlQuery = "insert into emp(ep_nic, ep_name, ep_department, ep_designation) "
								+ "values('"+nic+"','"+name+"','"+department+"','"+designation+"')";
					Statement stmt = con.createStatement();
					stmt.executeUpdate(sqlQuery);
					doGet(req, res);
				} catch (Exception e) {
					System.out.println("Something went wrong " + e);
					res.sendRedirect("index.jsp");
				}
				
			}

	}




}
