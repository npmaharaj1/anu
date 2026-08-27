/**
 * Returns the sorted combination of two sorted arrays
 * @param left a sorted array of numbers
 * @param right a sorted array of numbers
 * @return a sorted array that containers exactly the elements of left and 
 *         right
 */
int[] merge(int[] left, int[] right) {
  // {1,3,5,7}
  // {2,6,8}

  // {1, 2, 3, 5, 6, 7, 8}: Increment down and eliminate numbers.
  
  int leftPos = 0;
  int rightPos = 0;
  int[] result = new int[left.length + right.length];
  while (leftPos + rightPos < left.length + right.length) {
    int leftElement = left[leftPos];
    int rightElement = right[rightPos];
    if (leftElement < rightElement) {
      result[leftPos + rightPos] = leftElement;
      leftPos++;
    } else {
      result[leftPos + rightPos] = rightElement;
      rightPos++;
    }
  }
  for (; leftPos < left.length; leftPos++) {
    result[leftPos + rightPos] = left[leftPos];
  }
  for (; rightPos < left.length; rightPos++) {
    result[leftPos + rightPos] = right[rightPos];
  }
  return result;
}

int[] mergeSort(int[] arr, int lower, int upper) {
  int middle = (lower + upper) / 2;
  int[] left = mergeSort(arr, lower, middle);
  int[] right = mergeSort(arr, middle+1, upper);
  return merge(left, right);
}

void main() {
}
