<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->string('date');
            $table->string('reference_no');
            $table->unsignedBigInteger('customer_id');
            $table->string('customer');
            $table->unsignedBigInteger('biller_id');
            $table->string('biller');
            $table->unsignedBigInteger('stock_id');
            $table->decimal('total', 10, 3);
            $table->string('sale_status');
            $table->string('payment_status');
            $table->string('due_date');
            $table->text('note')->nullable();
            $table->decimal('discount', 10, 3)->nullable();
            $table->decimal('product_tax', 10, 3)->nullable();
            $table->string('payment_term')->nullable();
            $table->string('total_items')->nullable();
            $table->string('pos')->nullable(); // remaining cost
            $table->string('paid')->nullable(); //How much paid
            $table->unsignedBigInteger('user_id');
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->foreign('biller_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');
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
        Schema::dropIfExists('sales');
    }
}
