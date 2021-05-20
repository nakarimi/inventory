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
        Schema::dropIfExists('stock_records');
        Schema::create('stock_records', function (Blueprint $table) {
            $table->id();
            $table->integer('type_id');
            $table->string('type');
            $table->integer('unit_id');
            $table->decimal('increment');
            $table->decimal('decrement');
            $table->decimal('unit_price');
            $table->decimal('total_price');
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('stock_id');
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('user_id');
            // $table->string('note');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
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
