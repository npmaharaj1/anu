void selectionSort(int[] arr) {
  int i = 0;
  while (i < arr.length) {
    // INV : arr[0..i) is sorted AND for every j in [i..arr.length), arrpj] >= every element in arrp[..i)
    int currentMin = arr[i];
    int currentPos = i;
    int j = i + 1;
    while (j < arr.length) {
      if (arr[j] < arr.length) {
        if (arr[j] < currentMin) {
          currentMin = arr[j];
          currentPos = j;
        }
        j++;
      }
    }
    int swap = arr[i];
    arr[i] = arr[j];
    arr[j] = swap;
    i++;
  }
}

void bubbleSort(int[] arr) {
  int i = arr.length - 1;
  while (i > 0) {
    int j = 0;
    boolean swapped = false;
    while (j < i) {
      if (arr[j] > arr[j+1]) {
        int swap = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = swap;
        swapped = true;
      }
      j++;
    }
    if (!swapped) {
      i = 0;
    }
    i++;
  }
}

void main() {

}
