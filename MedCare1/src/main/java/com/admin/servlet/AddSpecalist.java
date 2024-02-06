package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecalistDao;
import com.db.Dbconnect;
import com.entity.User;

@WebServlet("/addSpecalist")
public class AddSpecalist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		
		SpecalistDao dao = new SpecalistDao(Dbconnect.getConn());
		boolean f = dao.addSpecalist(specName);
		
		HttpSession session = req.getSession();
		
		if(f) 
		{
			session.setAttribute("succMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}else
		{
			session.setAttribute("errorMsg", "Something Went Wrong!");
			resp.sendRedirect("admin_login.jsp");	
		}
	}
	

}
