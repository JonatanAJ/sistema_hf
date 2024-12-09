<?php 
include_once '../app/buscar.php';
include_once '../app/session_config.php';
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Dados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand text-white" href="#">HF Solucoes</a>
    <button id="logout" class="btn btn-danger" onclick="window.location.href='../assets/logout.php';">Sair</button>
   
</nav>

<section class="container mt-5">
    <?php if ($_SERVER['REQUEST_METHOD'] !== 'POST' || empty($resultados) && empty($detalhes)): ?>
        <!-- Formulário de Busca -->
        <form method="POST" action="pagina_buscar.php" class="form-container p-4 border rounded">
            <div class="mb-3">
                <h2 class="text-center">Buscar Dados do Usuário</h2>
            </div>
            
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome">
            </div>
            <div class="mb-3">
                <label for="codigo" class="form-label">Código</label>
                <input type="number" class="form-control" id="codigo" name="codigo" min="1" placeholder="Digite o código">
            </div>
            <div class="d-grid gap-2">
                <input type="submit" value="Buscar" class="btn btn-primary">
            </div>
        </form>
    <?php elseif (!empty($resultados)): ?>
        <!-- Tabela de Resultados -->
        <div class="table-responsive">
            <h2 class="text-center mb-4">Resultados Encontrados</h2>
            <div class="text-center mt-4">
                <a href="pagina_buscar.php" class="btn btn-primary">Nova Busca</a>
            </div>
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Nome</th>
                        <th>Código</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($resultados as $pessoa): ?>
                        <tr>
                            <td><?= htmlspecialchars($pessoa['nmPessoa']); ?></td>
                            <td><?= htmlspecialchars($pessoa['cdPessoa']); ?></td>
                            <td>
                                <form method="POST" action="pagina_buscar.php" class="form-tabela">
                                    <input type="hidden" name="acao" value="selecionar">
                                    <input type="hidden" name="codigo" value="<?= htmlspecialchars($pessoa['cdPessoa']); ?>">
                                    <button type="submit" class="btn btn-success">Selecionar</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    <?php elseif (!empty($detalhes)): ?>
        <!-- Detalhes da Pessoa -->
        <div class="card">
            <div class="card-header">
                <h2>Detalhes da Pessoa</h2>
            </div>
            <div class="card-body">
                <p><strong>Nome:</strong> <?= htmlspecialchars($detalhes['nmPessoa']); ?></p>
                <p><strong>Código:</strong> <?= htmlspecialchars($detalhes['cdPessoa']); ?></p>
                <!-- Adicione mais campos de acordo com as colunas da tabela -->
            </div>
            <div class="card-footer text-center">
                <a href="pagina_buscar.php" class="btn btn-primary">Nova Busca</a>
            </div>
        </div>
    <?php endif; ?>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>