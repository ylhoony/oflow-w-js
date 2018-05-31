"use strict";

class Country {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.alpha2Code = attributes.alpha_2_code;
    this.alpha3Code = attributes.alpha_3_code;
    this.status = attributes.active;
  }
}