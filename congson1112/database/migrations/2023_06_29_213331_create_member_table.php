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
        Schema::create('db_member', function (Blueprint $table) {
            $table->id(); //id
            $table->string('name');
            $table->string('email');
            $table->string('phone');
            $table->string('gioitinh');
            $table->string('username');
            $table->string('password');
            $table->string('address');
            $table->string('image');
            $table->string('roles');
            $table->unsignedInteger('sort_order')->default(0);
            $table->unsignedInteger('parent_id')->default(0);
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
        Schema::dropIfExists('db_member');
    }
};
