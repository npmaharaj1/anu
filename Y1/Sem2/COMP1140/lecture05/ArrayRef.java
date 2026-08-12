void fun1(int[] arr) {
  arr[0] = 100; // Overwrites input: Pass by reference due to non-elemetary
}

void fun2(int[] arr) {
  arr = new int[]{5,4,3,2,1}; // Makes a new array
}

void fun3(int i) {
  i = 200; // Local i value created and changed
}

void main() {
  int[] arr = new int[]{1,2,3,4,5,6};
  int i = arr[0];

  fun1(arr);
  IO.println(arr[0]);
  IO.println(i);


  fun2(arr);
  IO.println(arr[0]);
  IO.println(i);

  fun3(i);

  IO.println(arr[0]);
  IO.println(i);
}
