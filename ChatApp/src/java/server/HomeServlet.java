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
@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet"})
public class HomeServlet extends HttpServlet {

    public static Vector<MessageDTO> messages = new Vector<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = (String) request.getSession().getAttribute("name");
        String message = request.getParameter("message");
        MessageDTO msg = new MessageDTO();
        msg.setUsername(name);
        msg.setMessage(message);
        messages.add(msg);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        Gson msgGson = new Gson();
        System.out.println(messages.size());
        PrintWriter out = response.getWriter();
        out.write(msgGson.toJson(messages));
    }
}
