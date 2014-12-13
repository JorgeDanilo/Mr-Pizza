package br.com.mrpizza.controller.dao;

import java.util.List;

import br.com.mrpizza.modelo.Funcionario;

public interface IntFuncionarioDao {

	boolean inserir(Funcionario funcionario);
	List<Funcionario> listarTodos();
	
	
}
