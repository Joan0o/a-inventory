<template>
  <div>
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">
      <b-form-group id="input-group-1" label="Nombre:" label-for="input-1">
        <b-form-input id="input-1" v-model="form.name" required placeholder="nombre..."></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-2" label="Codigo:" label-for="input-2">
        <b-form-input
          id="input-2"
          v-model="form.code"
          type="number"
          required
          placeholder="codigo..."
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-3" label="Existencia:" label-for="input-3">
        <b-form-input
          type="number"
          id="input-3"
          v-model="form.onStock"
          required
          placeholder="existencia..."
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-4" label="Bodega:" label-for="input-4">
        <b-form-select id="input-4" v-model="form.warehouse" :options="warehouses" required></b-form-select>
      </b-form-group>

      <b-form-group id="input-group-5" label="Descripción:" label-for="input-5">
        <b-form-textarea
          id="textarea"
          v-model="form.description"
          placeholder="descripcion..."
          rows="3"
          max-rows="6"
        ></b-form-textarea>
      </b-form-group>

      <b-form-group label="Estado">
        <b-form-radio-group id="radio-group-1" v-model="form.status" name="radio-sub-component">
          <b-form-radio name="radios" value="active">Activo</b-form-radio>
          <b-form-radio name="radios" value="inactive">Inactivo</b-form-radio>
        </b-form-radio-group>
      </b-form-group>

      <b-button type="submit" variant="primary">Submit</b-button>
      <b-button type="reset" variant="secondary">Reset</b-button>
    </b-form>
    <b-card class="mt-3" header="Datos">
      <pre class="m-0">{{ form }}</pre>
    </b-card>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      form: {
        name: "",
        code: "",
        onStock: "",
        warehouse: "",
        description: "",
        status: "active",
      },
      warehouses: [],
      show: true,
    };
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      axios
        .post("api/items", {
          ...this.form,
        })
        .then(a => {
            this.$bvModal.hide('create-item');
            this.$emit('newItem', a.data)           
        });
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.code = "";
      this.form.name = "";
      this.form.onStock = "";
      this.form.warehouse = null;
      this.form.description = "";
      this.form.status = "active";
    },
  },
  mounted() {
    axios.get("api/warehouses").then((response) => {
      this.warehouses = response.data.data.map(
        (x) => new Object({ value: x["id"], text: x["name"] })
      );
      this.form.warehouse = this.warehouses[0]["id"];
    });
  },
};
</script>