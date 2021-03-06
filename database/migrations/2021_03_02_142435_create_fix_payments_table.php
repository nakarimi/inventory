<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFixPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fix_payments', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->decimal('amount', 10, 3);
            $table->string('receiver');
            $table->unsignedBigInteger('account_id');
            $table->string('date');
            $table->string('payment_status');
            $table->string('type');
            $table->string('approval_code');
            $table->text('note');
            $table->unsignedBigInteger('user_id');
            $table->foreign('account_id')->references('id')->on('accounts')->onDelete('cascade');
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
        Schema::dropIfExists('fix_payments');
    }
}
