<?php

use yii\helpers\Inflector;
use yii\helpers\StringHelper;

/* @var $this yii\web\View */
/* @var $generator yii\gii\generators\crud\Generator */

/* @var $model \yii\db\ActiveRecord */
$model = new $generator->modelClass();
$safeAttributes = $model->safeAttributes();
if (empty($safeAttributes)) {
    $safeAttributes = $model->attributes();
}

echo "<?php\n";
?>

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model <?= ltrim($generator->modelClass, '\\') ?> */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="<?= Inflector::camel2id(StringHelper::basename($generator->modelClass)) ?>-form">

    <?= "<?php" ?> $form = ActiveForm::begin([
        'layout'=>'horizontal',
        'fieldConfig' => [
            'horizontalCssClasses' => [
                'label' => 'col-sm-2',
                'wrapper' => 'col-sm-4',
                'error' => '',
                'hint' => '',
            ],
        ]
    ]); ?>

<?php foreach ($generator->getColumnNames() as $attribute) {
    if (in_array($attribute, $safeAttributes)) {
        if (strpos($attribute, 'id_') !== false) {
            $modelName =  str_replace(' ', '', ucwords(str_replace('_', ' ', str_replace('id_', '', $attribute))));
            echo "    <?= " . '$form->field($model, \'' . $attribute . '\')->dropDownList(\app\models\\' . $modelName . '::getList(), [\'prompt\' => \'- Pilih -\']); ' . "?>\n\n";
        } elseif (strpos($attribute, 'tanggal') !== false) {
            echo "    <?= " . '$form->field($model, \'' . $attribute . '\')->widget(\yii\jui\DatePicker::className(), [
            \'dateFormat\'=>\'yyyy-MM-dd\',
            \'options\' => [
            \'class\' => \'form-control\'
        ]
    ]); ?>' . "\n\n";
        } else {
            echo "    <?= " . $generator->generateActiveField($attribute) . " ?>\n\n";
        }
    }
} ?>
    <div class="form-group">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-2">
                <?= "<?= " ?>Html::submitButton('<i class="glyphicon glyphicon-save"></i> Simpan', ['class' => 'btn btn-primary']) ?>
            </div>
        </div>
    </div>
    <?= "<?php " ?>ActiveForm::end(); ?>

</div>
