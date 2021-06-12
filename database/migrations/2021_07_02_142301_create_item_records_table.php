<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('item_records', function (Blueprint $table) {
            $table->id();
            $table->integer('type_id');
            $table->string('type');
            $table->string('unit');
            $table->decimal('increment');
            $table->decimal('decrement');
            $table->decimal('unit_price');
            $table->decimal('total_price');
            $table->unsignedBigInteger('stock_id')->index();
            $table->string('item');
            $table->unsignedBigInteger('user_id');
            // $table->string('note');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item_records');
    }
}
