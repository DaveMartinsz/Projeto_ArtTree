var express = require("express");
var router = express.Router();

var aquarioController = require("../controllers/aquarioController");

router.get("/obterDados", function (req, res) {
  aquarioController.buscarPreferencias(req, res);
});

router.post("/cadastrar", function (req, res) {
  aquarioController.cadastrar(req, res);
})

router.post("/listar", function (req, res) {
  aquarioController.listar(req, res);
})

  router.delete("/deletarLista/:fkUsuario", function (req, res) {
    aquarioController.deletarLista(req, res);
  });

module.exports = router;