<?php ob_start() ?>

<section class="accueil">
    <article>
        <div><p>Commencer le test du vendredi</p><p>Dernier test : xx/xx/xxxx</p></div>
        <div><p>S'entrainer sur un test aléatoire</p></div>
    </article>
    <article>
        <div>
            <h2>test par catégories</h2>
            <p><a href="./ExempleQuiz.html">vocabulaire</a></p>
            <p>images</p>
        </div>
        <div>
            <h2>test par thème</h2>
            <p>cablage</p>
        </div>
    </article>
</section>

<?php
$content = ob_get_clean();
$titre = "Accueil";
require "Template.php";
?>