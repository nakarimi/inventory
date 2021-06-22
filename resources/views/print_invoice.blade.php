@extends('print')
@section('content')
<div class="content-box">
   <table cellpadding="0" cellspacing="0">
      <tr class="top">
         <td colspan="2">
            <table>
               <tr>
                  <td class="title">
                     <img width="150px" src="{{ $logo }}">
                  </td>

                  <td>
                     Sale # {{ $data['sale']['id'] }}<br />
                     Created: {{ $data['created'] }}<br />
                     Due: {{ $data['due'] }}
                  </td>
               </tr>
            </table>
         </td>
      </tr>

      <tr class="information">
         <td colspan="2">
            <table>
               <tr>
                  <td>
                     @foreach ($data['company_info'] as $item)
                         {{ $item }} <br>
                     @endforeach
                  </td>

                  <td>
                     @foreach ($data['reciever_info'] as $item)
                         {{ $item }} <br>
                     @endforeach
                  </td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
   <h3>Sale Info</h3>
   <div class="row justify-content-around">
      <div class="col-md-6">
         <table class="stripe">
            <tr class="heading">
               <td>Reference Number</td>
               <td>{{ $data['sale']['reference_no'] }}</td>
            </tr>
            <tr>
               <td>Date</td>
               <td>{{ date('Y-m-d H:i:s', strtotime($data['sale']['date'])) }}</td>
            </tr>
            <tr>
               <td>Customer</td>
               <td>{{ $data['sale']['customer'] }}</td>
            </tr>
            <tr>
               <td>Biller</td>
               <td>{{ $data['sale']['biller'] }}</td>
            </tr>
            <tr>
               <td>Stock</td>
               <td>{{ $data['sale']['stock'] }}</td>
            </tr>
            <tr>
               <td>Total</td>
               <td>{{ $data['sale']['total'] }}</td>
            </tr>
            <tr>
               <td>Due Date</td>
               <td>{{ date('Y-m-d H:i:s', strtotime($data['sale']['due_date'])) }}</td>
            </tr>
            <tr>
               <td>Note</td>
               <td>{{ $data['sale']['note'] }}</td>
            </tr>
         </table>
      </div>
      <div class="col-md-6">
         <table class="stripe">
            <tr>
               <td>Discount</td>
               <td>{{ $data['sale']['discount'] }}</td>
            </tr>
            <tr>
               <td>Product Tax</td>
               <td>{{ $data['sale']['product_tax'] }}</td>
            </tr>
            <tr>
               <td>Payment Term</td>
               <td>{{ $data['sale']['payment_term'] }}</td>
            </tr>
            <tr>
               <td>Total Items</td>
               <td>{{ $data['sale']['total_items'] }}</td>
            </tr>
            <tr>
               <td>POS</td>
               <td>{{ $data['sale']['pos'] }}</td>
            </tr>
            <tr>
               <td>Paid</td>
               <td>{{ $data['sale']['paid'] }}</td>
            </tr>
         </table>
      </div>
   </div>
   <h3>Items</h3>
   <table class="">
      <tr class="heading">
         <td>Amount</td>
         <td>Unit</td>
         <td>Unit Price</td>
         <td>Total Price</td>
         <td>Category</td>
         <td>Product</td>
      </tr>
      @foreach ($data['sale']['items'] as $item)
      <tr>
         <td>{{ $item['amount'] }}</td>
         <td>{{ Helper::findUnit($item['unit_id']) }}</td>
         <td>{{ $item['unit_price'] }}</td>
         <td>{{ $item['total_price'] }}</td>
         <td>{{ $item['item_id']['category']['name'] }}</td>
         <td>{{ $item['item_id']['name'] }}</td>
      </tr>
      @endforeach
   </table>
</div>
@stop