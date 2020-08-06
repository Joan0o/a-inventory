<template>
  <div class="box main">
    <div>
      <b-modal id="create-item" title="Crear producto">
        <ItemForm @newItem="onNewItem" />
      </b-modal>
    </div>
    <div class="column">
      <div class="row d-flex justify-content-between" style="margin-bottom: .7rem">
        <h1>Gestion de productos</h1>
        <button v-b-modal.create-item type="button" class="btn create-button">Crear producto</button>
      </div>
      <div style="padding: 1rem;">
        <div class="row d-flex justify-content-between" style="margin-bottom: .3rem">
          <form class="form-inline">
            <div class="form-group mb-2">
              <label for="search">Nombre del producto</label>
              <input type="text" v-model="filter" class="form-control" id="search" />
              <b-input-group-append>
                <b-button @click="filter = ''">Limpiar</b-button>
              </b-input-group-append>
            </div>

            <button type="button" class="btn btn-primary mb-2">Buscar</button>
          </form>

          <div>
            <b-form-group label-cols-sm="3" label-align-sm="right" label-size="sm" class="mb-0">
                <b-form-checkbox selected v-model="show_all">Mostrar todos</b-form-checkbox>
              <b-form-checkbox-group v-model="selected" class="mt-1">
                <b-form-checkbox value="active">Activos</b-form-checkbox>
                <b-form-checkbox value="inactive">Inactivos</b-form-checkbox>
                <b-form-checkbox value="pending">Pendientes</b-form-checkbox>
              </b-form-checkbox-group>
            </b-form-group>
          </div>
        </div>
        <div class="row">
          <b-table id="table1" ref="table1" :fields="fields" :items="items" :filter="filter">
            <template v-slot:cell(name)="data">
              <svg
                width="1.5em"
                height="1.5em"
                viewBox="0 0 16 16"
                class="bi bi-check2-circle"
                fill="currentColor"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z"
                />
                <path
                  fill-rule="evenodd"
                  d="M8 2.5A5.5 5.5 0 1 0 13.5 8a.5.5 0 0 1 1 0 6.5 6.5 0 1 1-3.25-5.63.5.5 0 1 1-.5.865A5.472 5.472 0 0 0 8 2.5z"
                />
              </svg>
              {{ data.value }}
            </template>
            <template v-slot:cell(Editar)="row">
              <b-button size="sm" @click="row.toggleDetails" class="mr-2">Editar</b-button>
            </template>
            <template v-slot:row-details="row">
              <b-card>
                <b-row class="mb-2">
                  <b-col sm="3" class="text-sm-right">
                    <b>Age:</b>
                  </b-col>
                  <b-col>{{ row.item.age }}</b-col>
                </b-row>

                <b-row class="mb-2">
                  <b-col sm="3" class="text-sm-right">
                    <b>Is Active:</b>
                  </b-col>
                  <b-col>{{ row.item.isActive }}</b-col>
                </b-row>

                <b-button size="sm" @click="row.toggleDetails">Hide Details</b-button>
              </b-card>
            </template>
          </b-table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
const axios = require("axios");
import ItemForm from "./ItemForm";

let fields = [
  { key: "name", label: "Nombre del producto" },
  { key: "code", label: "Código" },
  { key: "onStock", label: "Existencia" },
  { key: "warehouse", label: "Bodega" },
  { key: "description", label: "Descripción" },
  "Editar",
  { key: "status", label: "Estado" },
];

export default {
  data() {
    return {
      fields,
      rawItems: null,
      filter: "",
      _show_all: true,
      selected: ["active", "inactive", "pending"],
      infoModal: {
        id: "info-modal",
        title: "",
        content: "",
      },
      totalRows: 1,
    };
  },
  mounted() {
    this.getItems();
  },
  components: {
    ItemForm,
  },
  methods: {
    getItems() {
      axios
        .get("api/items")
        .then((response) => (this.items = response.data.data));
    },
    onNewItem(event) {
      this.items.push(event);
      console.log(event);
    },
  },
  computed: {
    items: {
      get: function () {
        return this.rawItems
          ? this.rawItems.filter((item) => this.selected.includes(item.status))
          : this.rawItems;
      },
      set: function (newValue) {
        this.rawItems = newValue;
      },
    },
    show_all: {
      get: function () {
        return this._show_all;
      },
      set: function (n) {
        if (n === true) {
          this._show_all = ["active", "inactive", "pending"];
        } else {
          this._show_all = [];
        }
        this.selected = this._show_all;
      },
    },
  },
};
</script>
