<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('purchases');
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->string('reference_no');
            $table->string('date');
            $table->unsignedBigInteger('vendor_id');
            $table->string('vendor')->nullable();
            $table->unsignedBigInteger('stock_id');
            $table->text('note')->nullable();
            $table->decimal('total', 10, 3);
            $table->boolean('item_fix')->default(false);
            $table->decimal('discount', 10, 3)->nullable();
            $table->decimal('total_tax', 10, 3)->nullable();
            $table->string('payment_status'); //Pendding, Paid, Done, Dude
            $table->string('due_date');
            $table->timestamps();
            $table->unsignedBigInteger('user_id');
            $table->foreign('stock_id')->references('id')->on('stocks')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('vendor_id')->references('id')->on('vendors')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchases');
    }
}
