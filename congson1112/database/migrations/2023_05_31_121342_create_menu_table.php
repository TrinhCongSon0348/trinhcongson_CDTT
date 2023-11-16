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
        Schema::create('db_menu', function (Blueprint $table) {
            $table->id(); //id
            $table->string('name');
            $table->string('link');
            $table->unsignedInteger('table_id')->default(0);
            $table->unsignedInteger('parent_id')->default(0);
            $table->string('position');
            $table->string('type');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps(); //created_at, updated_at
            $table->unsignedInteger('created_by')->default(1);
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
        Schema::dropIfExists('db_menu');
    }
};
