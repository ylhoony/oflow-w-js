"use strict";

class Warehouse {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.contact = attributes.attention;
    this.address1 = attributes.address_line_1;
    this.address2 = attributes.address_line_2;
    this.city = attributes.city;
    this.state = attributes.state;
    this.postalCode = attributes.postal_code;
    this.countryId = attributes.country.id;
    this.countryName = attributes.country.name;
    this.email = attributes.email;
    this.phone = attributes.phone;
    this.fax = attributes.fax;
    this.status = attributes.active;
  }

  renderWarehouse() {
    return Warehouse.template(this);
  }
}

$(document).on('turbolinks:load', () => {
  const pathname = window.location.pathname;
  if (pathname.includes("warehouses")) {
    initWarehouses();
  }
});

const initWarehouses = () => {
  const pathname = window.location.pathname;
  if (pathname.endsWith("/warehouses") || pathname.endsWith("/warehouses/")) {
    initWarehouseIndex();
  } else if (pathname.slice(-4).includes("new") || pathname.slice(-5).includes("edit")) {
    handlebarsFormSetup();
    initWarehouseForm();
  } else {
    initWarehouseShow();
    Warehouse.templateSource = document.getElementById("warehouse-show-template").innerHTML;
    Warehouse.template = Handlebars.compile(Warehouse.templateSource);
  }
}

const initWarehouseIndex = () => {
  const source = document.getElementById("warehouses-index-template").innerHTML;
  const template = Handlebars.compile(source);
  ajaxData("get", "/warehouses", {})
    .done((res) => {
      let data = new Object;
      data.warehouses = res.map(x => new Warehouse(x))
      $("#warehouse-list").html(template(data));
    })
    .fail((err) => {
      console.log(err);
    });
}

const handlebarsFormSetup = () => {
  Handlebars.registerHelper("displayOption", (item, options) => {
    const selector = `${item.constructor.name.toLowerCase()}Id`;
    if (item.id === options.data.root.warehouse[selector]) {
      return new Handlebars.SafeString(`<option value="${item.id}" selected>${item.name}</option>`)
    } else {
      return new Handlebars.SafeString(`<option value="${item.id}">${item.name}</option>`)
    }
  })
}

const initWarehouseForm = () => {
  const pathname = window.location.pathname;
  const source = document.getElementById("warehouse-form-template").innerHTML;
  const template = Handlebars.compile(source);

  if ((pathname === "/warehouses/new") || (pathname === "/warehouses/new/")) {
    ajaxData("get", "/countries", {})
      .done((res) => {
        let data = new Object;
        data.countries = res.map(x => new Country(x));
        $("#warehouse-form").html(template(data));

        $("form#new_warehouse").on("submit", submitWarehouseForm);
      })
      .fail((err) => {
        console.log(err);
      });
  } else {
    const getWarehouse = ajaxData("get", pathname, {}),
          getCountries = ajaxData("get", "/countries", {})
    
    $.when(getWarehouse, getCountries)
      .done((warehouseData, countriesList) => {
        let data = new Object;
        data.warehouse = new Warehouse(warehouseData[0]);
        data.countries = countriesList[0].map(x => new Country(x));

        $("#warehouse-form").html(template(data));
        $("form#edit_warehouse").on("submit", submitWarehouseForm);
      })
      .fail((err) => {
        console.log(err);
      });
  }
}

const submitWarehouseForm = (e) => {
  e.preventDefault();
  const $form = $(e.target);
  const method = $form.attr("method");
  const action = $form.attr("action");
  const params = $form.serialize();

  ajaxData(method, action, params)
    .done((res) => {
      window.location.href = `/warehouses/${res.id}`;
    })
    .fail((err) => {
      console.log(err);
    });
}

const initWarehouseShow = () => {
  const pathname = window.location.pathname

  fetch(pathname, {
    method: "GET",
    credentials: "same-origin",
    headers: {
      "Accept": "application/json",
      "Content-type": "application/json"
    }
    // mode: "cors",
    // cache: "default"
  })
  .then(res => res.json())
  .then((json) => {
    const warehouse = new Warehouse(json);
    const warehouseShow = warehouse.renderWarehouse();
    $("#warehouse-show").html(warehouseShow);
  })
  .catch(error => console.log(error))

}