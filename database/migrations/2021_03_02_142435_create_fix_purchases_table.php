<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFixPurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fix_purchases', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->decimal('ammount', 10, 3);
            $table->string('receiver');
            $table->unsignedBigInteger('source_account_id');
            $table->foreign('source_account_id')->references('id')->on('accounts')->onDelete('cascade');
            $table->string('date');
            $table->text('note');
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
        Schema::dropIfExists('fix_purchases');
    }
}
