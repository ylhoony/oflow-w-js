"use strict";

class Tag {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
  }
}

$(document).on('turbolinks:load', () => {
  const pathname = window.location.pathname;
  if (pathname.includes("tags")) {
    initTags();
  }

});

const initTags = () => {
  const pathname = window.location.pathname;
  if (pathname.endsWith("/tags") || pathname.endsWith("/tags/")) {
    initTagIndex();
    tagsEventListener();
  }
}

const initTagIndex = () => {
  ajaxData("get", "/tags", {})
    .done((res) => {
      const data = new Object;
      data.tags = res.map(x => new Tag(x));
      const tagsListSource = document.getElementById("tags-list-template").innerHTML;
      const tagsListTemplate = Handlebars.compile(tagsListSource);
      $("#tags-list").html(tagsListTemplate(data));
    })
    .fail((err) => {
      console.log(err);
    })
}

const tagsEventListener = () => {
  $(".new_tag").on("click", (e) => {
    e.preventDefault();
    const tagFormSource = document.getElementById("tag-form-template").innerHTML;
    const tagFormTemplate = Handlebars.compile(tagFormSource);
    $("#tag-header").html(tagFormTemplate());

    $("form#new_tag").on("submit", (e) => {
      e.preventDefault();
      const $form = $(e.target);
      const method = $form.attr("method");
      const action = $form.attr("action");
      const params = $form.serialize();

      ajaxData(method, action, params)
        .done((res) => {
          console.log(res);
          $("#tag-header").empty();
          initTags();
        })
        .fail((err) => {
          console.log(err);
        })
    })
  });
}