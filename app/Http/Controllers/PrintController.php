<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\PDF;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Response;

class PrintController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function print()
  {
    $pdf = App::make('dompdf.wrapper');
    $logo = $this->loadImg('/images/pages/404.png');
    $pdf->loadView('print_invoice', compact('logo'));

    // Direct download.
    // return $pdf->stream();
    return $pdf->download('invoice-'.Carbon::now().'.pdf');
  }

    
  /**
   * load Image by using the path from public directory, convert to base 64 to be used in the pdf generation.
   *
   * @param  mixed $path
   * @return void
   */
  public function loadImg($path){
    return "data:image/png;base64," . base64_encode(file_get_contents(public_path($path)));
  }
}
