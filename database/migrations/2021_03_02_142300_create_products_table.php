<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('code');
            $table->string('name');
            $table->string('unit');
            $table->decimal('cost', 10, 3);
            $table->decimal('price', 10, 3);
            $table->string('image')->nullable();
            $table->unsignedBigInteger('category_id');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->integer('quantity')->nullable();
            $table->string('stock')->nullable();
            $table->unsignedBigInteger('stock_id');
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->string('barcode_symbology')->nullable();
            $table->string('product_details')->nullable();
            $table->decimal('tax', 10, 3)->nullable();
            $table->string('type')->nullable();
            $table->string('supplier');
            $table->string('supplier_price');
            $table->string('sale_unit')->nullable();
            $table->string('purchase_unit')->nullable();
            $table->string('brand')->nullable();
            $table->string('featured')->nullable();
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
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
        Schema::dropIfExists('products');
    }
}
