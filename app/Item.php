<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'name', 'code', 'onStock', 'warehouse', 'description', 'status'
    ];
}
