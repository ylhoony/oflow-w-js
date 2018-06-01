class Product {
  constructor(attributes) {
    this.id = attributes.id;
    this.sku = attributes.sku;
    this.name = attributes.name;
    this.unitOfMeasure = attributes.unit_of_measure.name;
    this.price = attributes.price;
    this.productGroupId = attributes.product_group.id;
    this.productGroupName = attributes.product_group.name;
    this.tags = attributes.tags.map(x => new Tag(x));
    ajaxData("get", `/product_groups/${attributes.product_group.id}`,{})
      .done((res) => {
        this.productCategoryId = res.product_category.id;
        this.productCategoryName = res.product_category.name;
      })
  }
  renderProductShow() {
    return Product.template(this);
  }
}

$(document).on('turbolinks:load', () => {
  const pathname = window.location.pathname;
  if (pathname.includes("products")) {
    initProducts();
  }
});

const initProducts = () => {
  const pathname = window.location.pathname;
  if (pathname.endsWith("/products") || pathname.endsWith("/products/")) {
    initProductIndex();
  } else if (pathname.slice(-4).includes("new") || pathname.slice(-5).includes("edit")) {
    initProductForm();
  } else {
    initProductshow();
    Product.templateSource = document.getElementById("product-show-template").innerHTML;
    Product.template = Handlebars.compile(Product.templateSource);
  }
}

const initProductIndex = () => {
  console.log("Product Index Page is not loading with JS");
}

const initProductForm = () => {
  console.log("This is not loading with JS");
}

const initProductshow = () => {
  const pathname = window.location.pathname;
  ajaxData("get", pathname, {})
    .done((res) => {
      const product = new Product(res);
      $("#product-show").html(product.renderProductShow());
    })
    .fail((err) => {
      console.log(err);
    })
}