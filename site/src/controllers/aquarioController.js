var aquarioModel = require("../models/aquarioModel");

// function buscarAquariosPorEmpresa(req, res) {
//   var idUsuario = req.params.idUsuario;

//   aquarioModel.buscarAquariosPorEmpresa(idUsuario).then((resultado) => {
//     if (resultado.length > 0) {
//       res.status(200).json(resultado);
//     } else {
//       res.status(204).json([]);
//     }
//   }).catch(function (erro) {
//     console.log(erro);
//     console.log("Houve um erro ao buscar os aquarios: ", erro.sqlMessage);
//     res.status(500).json(erro.sqlMessage);
//   });
// }

function buscarPreferencias(req, res) {
  // var idUsuario = req.params.idUsuario;

  aquarioModel.buscarPreferencias().then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os aquarios: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function cadastrar(req, res) {
  var artes = req.body.artesServer;
  var fkUsuario = req.body.fkUsuarioServer;

  if (artes == undefined) {
    res.status(400).send("descricao está undefined!");
  } else if (fkUsuario == undefined) {
    res.status(400).send("idUsuario está undefined!");
  } else {


    aquarioModel.cadastrar(artes, fkUsuario)
      .then((resultado) => {
        // res.status(201).json(resultado);
        aquarioModel.listar(fkUsuario).then(
          (resultado2) => {
            res.status(201).json(resultado2)
          }
        )
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function listar(req, res) {
  var fkUsuario = req.body.fkUsuarioServer;

  if (fkUsuario == undefined) {
    res.status(400).send("idUsuario está undefined!");
  } else {


    aquarioModel.listar(fkUsuario)
      .then((resultado) => {
        res.status(201).json(resultado);
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function deletarLista(req, res) {
  var fkUsuario = req.params.fkUsuario;

  aquarioModel.deletarLista(fkUsuario)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao deletar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );

}

module.exports = {
  buscarPreferencias,
  cadastrar,
  listar,
  deletarLista,
}