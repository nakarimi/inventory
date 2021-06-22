@extends('print')
@section('content')
<div class="">
   <div style="text-align: center;">
      <div>
         <img width="150px" src="{{ $logo }}">
      </div>
      <div>
         <h3>Balance Sheet Report</h3>
         <h4>Created At: {{ $data['created'] }}</h4>
         <p>From: {{ $data['start'] }} <br> To: {{ $data['end'] }}</p>
      </div>
   </div>
   <div class="row justify-content-around">
      <div class="col-md-12">
         <table class="stripe" style=" width: 100%; ">
            <thead>
               <tr class="heading" style=" background: lightgray; font-weight: bold; ">
                  <td>Name</td>
                  <td>Owner</td>
                  <td>Total Debit</td>
                  <td>Total Credit</td>
                  <td>Main Balance</td>
               </tr>
            </thead>
            <tbody>
               @foreach ($accounts as $data)
               <tr>
                  <td>{{ $data['name'] }}</td>
                  <td>{{ $data['user_account']['first_name'] }} {{ $data['user_account']['last_name'] }}</td>
                  <td>{{ $data['t_debit'] }}</td>
                  <td>{{ $data['t_credit'] }}</td>
                  <td>{{ $data['t_balance'] }}</td>
               </tr>
               @endforeach
            </tbody>
         </table>
      </div>
   </div>
</div>
@stop