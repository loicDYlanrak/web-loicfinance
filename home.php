<!-- Hero Section -->
        <section class="hero-section fade-in">
            <div class="container">
                <h1>Budget Citoyen 2025 - Madagascar</h1>
                <p>Visualisation interactive des perspectives économiques et des recettes de l'État pour une meilleure compréhension des finances publiques</p>
            </div>
        </section>

        <!-- Statistiques Principales -->
        <section class="row mb-5 section-transition" id="statsSection">
            <div class="col-md-3 mb-4">
                <div class="stat-card slide-in-left">
                    <h3>5.0%</h3>
                    <p>Croissance économique 2025</p>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="stat-card slide-in-left" style="animation-delay: 0.1s">
                    <h3>7.1%</h3>
                    <p>Inflation prévue</p>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="stat-card slide-in-right" style="animation-delay: 0.2s">
                    <h3>11.2%</h3>
                    <p>Pression fiscale</p>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="stat-card slide-in-right" style="animation-delay: 0.3s">
                    <h3>12 626,7 Md</h3>
                    <p>Recettes totales</p>
                </div>
            </div>
        </section>

        <!-- Perspectives Économiques -->
        <section id="economie" class="mb-5 section-transition">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h2 class="mb-0"><i class="fa fa-line-chart mr-2"></i>Perspectives Économiques</h2>
                    <p class="mb-0 mt-1" style="opacity: 0.8; font-size: 0.9rem">Évolution des principaux indicateurs macroéconomiques sur trois années</p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="data-table data-table-striped data-table-hover">
                            <thead>
                                <tr>
                                    <th>Indicateur</th>
                                    <th>2024</th>
                                    <th>2025</th>
                                    <th>2026</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($perspectives as $row): ?>
                                <tr>
                                    <td><strong>PIB nominal (milliards d'Ariary)</strong></td>
                                    <td><?php echo number_format($row['pib_nominal'], 1, ',', ' '); ?></td>
                                    <td><?php echo number_format($perspectives[1]['pib_nominal'], 1, ',', ' '); ?></td>
                                    <td><?php echo number_format($perspectives[2]['pib_nominal'], 1, ',', ' '); ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Taux de croissance économique</strong></td>
                                    <td><?php echo $row['taux_croissance']; ?>%</td>
                                    <td><?php echo $perspectives[1]['taux_croissance']; ?>%</td>
                                    <td><?php echo $perspectives[2]['taux_croissance']; ?>%</td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- Croissance Sectorielle -->
        <section id="secteurs" class="mb-5 section-transition">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h2 class="mb-0"><i class="fa fa-industry mr-2"></i>Croissance Sectorielle</h2>
                    <p class="mb-0 mt-1" style="opacity: 0.8; font-size: 0.9rem">Performance des différents secteurs économiques en 2024 et 2025</p>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="chart-container">
                                <h4 class="text-center mb-3">2024</h4>
                                <div class="table-responsive">
                                    <table class="table table-sm table-striped table-hover">
                                        <thead class="bg-light">
                                            <tr>
                                                <th>Secteur</th>
                                                <th>Croissance</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($croissance2024 as $secteur): ?>
                                            <tr>
                                                <td><?php echo $secteur['secteur']; ?></td>
                                                <td class="<?php echo $secteur['taux_croissance'] < 0 ? 'text-danger' : 'text-success'; ?>">
                                                    <strong><?php echo $secteur['taux_croissance']; ?>%</strong>
                                                </td>
                                            </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="chart-container">
                                <h4 class="text-center mb-3">2025</h4>
                                <div class="table-responsive">
                                    <table class="table table-sm table-striped table-hover">
                                        <thead class="bg-light">
                                            <tr>
                                                <th>Secteur</th>
                                                <th>Croissance</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($croissance2025 as $secteur): ?>
                                            <tr>
                                                <td><?php echo $secteur['secteur']; ?></td>
                                                <td class="text-success">
                                                    <strong><?php echo $secteur['taux_croissance']; ?>%</strong>
                                                </td>
                                            </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="chartSecteurs" class="chart-container mt-4">
                        <h4 class="text-center mb-3">Comparaison de la croissance sectorielle</h4>
                        <!-- Le graphique sera inséré ici par JavaScript -->
                    </div>
                </div>
            </div>
        </section>

        <!-- Recettes -->
        <section id="recettes" class="mb-5 section-transition">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h2 class="mb-0"><i class="fa fa-money mr-2"></i>Recettes de l'État</h2>
                    <p class="mb-0 mt-1" style="opacity: 0.8; font-size: 0.9rem">Répartition des recettes fiscales et non fiscales pour l'année 2025</p>
                </div>
                <div class="card-body">
                    <div id="chartRecettes" class="chart-container">
                        <h4 class="text-center mb-3">Répartition des recettes de l'État</h4>
                        <!-- Le graphique sera inséré ici par JavaScript -->
                    </div>
                    
                    <div class="chart-container mt-4">
                        <h4 class="text-center mb-3">Recettes Fiscales Intérieures 2025</h4>
                        <div class="table-responsive">
                            <table class="data-table data-table-striped data-table-hover">
                                <thead>
                                    <tr>
                                        <th>Type d'impôt</th>
                                        <th class="text-right">Montant (Md Ar)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($fiscales2025 as $impot): ?>
                                    <tr>
                                        <td><?php echo $impot['type_impot']; ?></td>
                                        <td class="text-right"><strong><?php echo number_format($impot['montant'], 1, ',', ' '); ?></strong></td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>