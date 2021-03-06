// Titleize

const titleize = (names, printCallback) => {
  let title_names = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  printCallback(title_names);
};
titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

// Constructors, Prototypes, and 'this'

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
};

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  random_index = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[random_index]}!`)
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// Function Invocation

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

herd.forEach(ele => Elephant.paradeHelper(ele));

// Closures

const dinerBreakfast = () => {
  let order = 'I\'d like scrambled eggs and bacon please.';
  console.log(order);
  return function(addition) {
    order = `${order.slice(0, order.length - 8)} and ${addition} please.`;
    console.log(order);
  };
};
