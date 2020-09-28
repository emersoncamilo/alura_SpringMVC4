package br.com.caelum.contas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.contas.dao.UsuarioDAO;
import br.com.caelum.contas.modelo.Usuario;

@Controller
public class UsuarioController {

	@RequestMapping("/loginForm")
	public String formulario() {
		return "usuario/login"; 
		
	}
		
	@RequestMapping("/efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {
		UsuarioDAO usuDAO = new UsuarioDAO();
		System.out.println(usuario);
		
		if(usuDAO.existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			System.out.println("Usuario existe");
			return "menu";
		}else {
			
			System.out.println("Usuario não existe");
			return "redirect:loginForm";
		}
	}
	
	@RequestMapping("/efetuaLogout")
	public String efetuaLogout(HttpSession session) {
		session.invalidate();
		
		System.out.println("Saindo do Sistema... ");
		return "redirect:loginForm";
	}
	
	
	
}
