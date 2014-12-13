package br.com.mrpizza.modelo;

/**
 * Classe bean responsável por guardar as informações dos funcionarios.
 * 
 * @author danilo
 * 
 */
public class Funcionario extends Cliente {

	private String cpf;
	private String ctps;
	private String funcao;
	private int nivel;

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCtps() {
		return ctps;
	}

	public void setCtps(String ctps) {
		this.ctps = ctps;
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

}
