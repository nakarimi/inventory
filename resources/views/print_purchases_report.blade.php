@extends('print')
@section('content')
<div class="">
   <div style="text-align: center;">
      <div>
         <img width="150px" src="{{ $logo }}">
      </div>
      <div>
         <h3>Purchases Report</h3>
         <h4>Created At: {{ $data['created'] }}</h4>
         <p>From: {{ $data['start'] }} <br> To: {{ $data['end'] }}</p>
      </div>
   </div>
   <div class="row justify-content-around">
      <div class="col-md-12">
         <table class="stripe" style=" width: 100%; ">
            <thead>
               <tr class="heading" style=" background: lightgray; font-weight: bold; ">
                  <td>Reference Number</td>
                  <td>Date</td>
                  <td>Vendor</td>
                  <td>Stock</td>
                  <td>Total</td>
                  <td>Discount</td>
                  <td>Tax</td>
               </tr>
            </thead>
            <tbody>
               @foreach ($purchases as $data)
               <tr>
                  <td>{{ $data['reference_no'] }}</td>
                  <td>{{ date('Y-m-d', strtotime($data['date'])) }}</td>
                  <td>{{ $data['customer'] }}</td>
                  <td>{{ $data['stock']['name'] }}</td>
                  <td>{{ abs($data['total']) }}</td>
                  <td>{{ abs($data['discount']) }}</td>
                  <td>{{ abs($data['product_tax']) }}</td>
               </tr>
               @endforeach
            </tbody>
         </table>
      </div>
   </div>
</div>
@stop