@extends('print')
@section('content')
<div class="">
   <div style="text-align: center;">
      <div>
         <img width="150px" src="{{ $logo }}">
      </div>
      <div>
         <h3>Transfers Report</h3>
         <h4>Created At: {{ $data['created'] }}</h4>
         <p>From: {{ $data['start'] }} <br> To: {{ $data['end'] }}</p>
      </div>
   </div>
   <div class="row justify-content-around">
      <div class="col-md-12">
         <table class="stripe" style=" width: 100%; ">
            <thead>
               <tr class="heading" style=" background: lightgray; font-weight: bold; ">
                  <td>Date</td>
                  <td>Source Stock</td>
                  <td>Target Stock</td>
                  <td>Amount</td>
                  <td>Causer</td>
               </tr>
            </thead>
            <tbody>
               @foreach ($transfers as $data)
               <tr>
                  <td>{{ date('Y-m-d', strtotime($data['created_at'])) }}</td>
                  <td>{{ $data['source']['name'] }}</td>
                  <td>{{ $data['target']['name'] }}</td>
                  <td>{{ abs($data['amount']) }}</td>
                  <td>{{ Helper::getUser($data['user_id']) }}</td>
               </tr>
               @endforeach
            </tbody>
         </table>
      </div>
   </div>
</div>
@stop