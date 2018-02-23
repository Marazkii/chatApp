/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asmaa
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    public static Vector<UserDTO> onlineUsers = new Vector<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = (String) request.getSession().getAttribute("name");
        String pass = (String) request.getSession().getAttribute("pass");
        System.out.println(name+pass);
        for(int counter=0;counter<onlineUsers.size();counter++){
            if(onlineUsers.get(counter).getUsername().equals(name) && onlineUsers.get(counter).getPassword().equals(pass)){
                onlineUsers.remove(counter);
            }
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        Gson msgGson = new Gson();
        PrintWriter out = response.getWriter();
        out.write(msgGson.toJson(onlineUsers));
    }
}
