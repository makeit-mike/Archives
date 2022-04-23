// BASICS

let id = 4; // plain ol JS
let id2: number = 5; // Yay, TS.
id = 6; // reassigning.
// id = '5'; // Compiliation error. 'String is not a number'

// Basic Types:
let firstName: string = "Michael";
let isHuman: boolean = true;
let x: any = "Hello";
x = 15; // oof... sadness

// Basic collections
let myArray1: number[] = [1, 2, 3, 4, 5];
let myArray2: any[] = [1, "Hello", false];
let myTuple: [number, string, boolean] = [1234, "Tuples", true || false];

// Basic logic
let userIsMichael: boolean = firstName == "Michael";

console.log("ID: ", id2);
