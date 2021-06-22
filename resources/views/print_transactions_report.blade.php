@extends('print')
@section('content')
<div class="">
   <div style="text-align: center;">
      <div>
         <img width="150px" src="{{ $logo }}">
      </div>
      <div>
         <h3>Transactions Report</h3>
         <h4>Created At: {{ $data['created'] }}</h4>
         <p>From: {{ $data['start'] }} <br> To: {{ $data['end'] }}</p>
      </div>
   </div>
   <div class="row justify-content-around">
      <div class="col-md-12">
         <table class="stripe" style=" width: 100%; ">
            <thead>
               <tr class="heading" style=" background: lightgray; font-weight: bold; ">
                  <td>Account</td>
                  <td>Amount</td>
                  <td>Date</td>
                  <td>Causer</td>
                  <td>Type</td>
               </tr>
            </thead>
            <tbody>
               @foreach ($transactions as $data)
               <tr>
                  <td>{{ $data['account']['name'] }}</td>
                  <td>{{ abs($data['debit']) > 0 ? abs($data['debit']) . ' debited' :  abs($data['credit']) . ' credited' }}</td>
                  <td>{{ date('Y-m-d', strtotime($data['created_at'])) }}</td>
                  <td>{{ Helper::getUser($data['user_id']) }}</td>
                  <td>{{ $data['type'] }}</td>
               </tr>
               @endforeach
            </tbody>
         </table>
      </div>
   </div>
</div>
@stop