class Tag {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
  }
}

$(() => {
  // console.log("test");
  init();
});

const init = () => {
  ajaxData("get", "/tags", {})
    .done((res) => {
      console.log(res);
    })
    .fail((err) => {
      console.log(err);
    });

  // fetch("/tags", {
  //   method: "get",
  //   headers: {
  //     'content-type': 'application/json'
  //   }
  // })
  //   .then((res) => {
  //     console.log(res);
  //   })
}

const ajaxData = (method, dataURL, params) => {
  return $.ajax({
    method: method,
    url: dataURL,
    data: params,
    dataType: "json"
  });
}

