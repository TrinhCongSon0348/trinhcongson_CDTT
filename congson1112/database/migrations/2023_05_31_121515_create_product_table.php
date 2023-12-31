<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_product', function (Blueprint $table) {
            $table->id(); //id
            $table->unsignedInteger('category_id');
            $table->unsignedInteger('brand_id');
            $table->string('name');
            $table->string('slug');
            $table->float('price');
            $table->float('price_sale');
            $table->string('image');
            $table->unsignedInteger('qty');
            $table->mediumText('detail');
            $table->string('metakey');
            $table->string('metadesc');
            $table->unsignedInteger('sort_order')->default(0);
            $table->unsignedInteger('created_by')->default(1);
            $table->timestamps(); //created_at, updated_at
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedTinyInteger('status')->default(2);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('db_product');
    }
};
