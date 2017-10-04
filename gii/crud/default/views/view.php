<?php

use yii\helpers\Inflector;
use yii\helpers\StringHelper;

/* @var $this yii\web\View */
/* @var $generator yii\gii\generators\crud\Generator */

$urlParams = $generator->generateUrlParams();

echo "<?php\n";
?>

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model <?= ltrim($generator->modelClass, '\\') ?> */

$this->title = $model-><?= $generator->getNameAttribute() ?>;
$this->params['breadcrumbs'][] = ['label' => <?= $generator->generateString(Inflector::camel2words(StringHelper::basename($generator->modelClass))) ?>, 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="<?= Inflector::camel2id(StringHelper::basename($generator->modelClass)) ?>-view">

    <h1>Detail <?= Inflector::camel2words(StringHelper::basename($generator->modelClass)) ?></h1>

    <?= "<?= " ?>DetailView::widget([
        'model' => $model,
        'template' => '<tr><th width="180px" style="text-align:right">{label}</th><td>{value}</td></tr>',
        'attributes' => [
<?php
if (($tableSchema = $generator->getTableSchema()) === false) {
    foreach ($generator->getColumnNames() as $name) {
?>

            [
                'attribute' => '<?= $name; ?>',
                'format' => 'raw',
                'value' => $model-><?= $name; ?>,
            ],
    <?php }
} else {
    foreach ($generator->getTableSchema()->columns as $column) {
?>

            [
                'attribute' => '<?= $column->name; ?>',
                'format' => 'raw',
                'value' => $model-><?= $column->name; ?>,
            ],
    <?php }
}
?>

        ],
    ]) ?>

    <p>
        <?= "<?= " ?>Html::a('<i class="glyphicon glyphicon-pencil"></i> Sunting', ['update', <?= $urlParams ?>], ['class' => 'btn btn-primary']) ?>
        <?= "<?= " ?>Html::a('<i class="glyphicon glyphicon-trash"></i> Hapus', ['delete', <?= $urlParams ?>], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => <?= $generator->generateString('Yakin akan menghapus data?') ?>,
                'method' => 'post',
            ],
        ]) ?>
        <?= "<?= " ?>Html::a('<i class="glyphicon glyphicon-list"></i> Daftar <?= Inflector::camel2words(StringHelper::basename($generator->modelClass)); ?>', ['index', <?= $urlParams ?>], ['class' => 'btn btn-warning']) ?>
    </p>
</div>
