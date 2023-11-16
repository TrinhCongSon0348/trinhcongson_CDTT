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
        Schema::create('db_post', function (Blueprint $table) {
            $table->id(); //id
            $table->unsignedInteger('topic_id');
            $table->string('title');
            $table->string('slug');
            $table->mediumText('detail');
            $table->unsignedInteger('relay_id');
            $table->unsignedInteger('sort_order')->default(0);
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
        Schema::dropIfExists('db_post');
    }
};
