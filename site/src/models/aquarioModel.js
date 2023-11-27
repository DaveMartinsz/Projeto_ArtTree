var database = require("../database/config");

function buscarPreferencias() {

  // instrucaoSql = `select * from aquario a where fk_empresa = ${empresaId}`;
  
  instrucaoSql = `SELECT COUNT(fkEstiloFav) as Preferencias FROM Usuario GROUP BY fkEstiloFav`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(artes, fkUsuario) {
  
  instrucaoSql = `INSERT INTO Lista (Artes, fkUsuario) VALUES ('${artes}', ${fkUsuario});`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function listar(fkUsuario){

    instrucaoSql = `SELECT Lista.Artes as ArtesQueGosta FROM Usuario
    JOIN LISTA
    ON idUsuario = fkUsuario
    WHERE idUsuario = ${fkUsuario};`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

function deletarLista(fkUsuario) {

    instrucaoSql = `DELETE FROM Lista WHERE fkUsuario = ${fkUsuario};`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}


module.exports = {
  buscarPreferencias,
  cadastrar,
  listar,
  deletarLista,
}
