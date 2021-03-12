<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_records', function (Blueprint $table) {
            $table->id();
            $table->string('type');
            $table->integer('type_id');
            $table->string('source');
            $table->unsignedBigInteger('source_id');
            $table->unsignedBigInteger('product_id');
            $table->decimal('increment');
            $table->decimal('decrement');
            $table->decimal('product_price');
            $table->decimal('total_price');
            $table->string('note');
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('source_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
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
        Schema::dropIfExists('stock_records');
    }
}
