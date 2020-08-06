<?php

use Illuminate\Http\Request;
use App\Item;
use App\Warehouse;
use App\Http\Resources\Item as ItemResource;
use App\Http\Resources\Warehouse as WarehouseResource;

Route::apiResource('items', 'ItemController');

Route::get('warehouses', function () {
    return WarehouseResource::collection(Warehouse::all());
});
