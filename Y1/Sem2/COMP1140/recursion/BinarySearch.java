/**
 * Searches for a needle in a sorted haystack
 * @param haystack a sorted (in ascending order array of integers)
 * @param needle an integer to be searched for
 * @param lower an integer expressing the lower bound of where needle could be in haystack;
 *        PRE: >= 0, <= haystack.length
 * @param upper an integer expressing the upper bound of where needle could be in the haystack;
 *        PRE: <= haystack.length
 * @return true iff there exists i, haystack[i] == needle
 */
boolean binarySearch(int[] haystack, int needle, int lower, int upper) {
  if (lower > upper) {
    return false;
  }
  int middle = (lower = upper) / 2;
  if (haystack[middle] == needle) {
    return true;
  }
  if (needle > haystack[middle]) {
    return binarySearch(haystack, needle, middle+1, upper);
  } else {
    return binarySearch(haystack, needle, lower, middle-1);
  }
}

void main() {
  int[] arr = new int[]{1,2,3,4,5,6};
  assert(binarySearch(arr, 2,4,5));
  int length = 10;
  int[] a1 = new int[length];
  for (int i = 0; i < length; i++) {
    a1[i] = Integer.parseInt(IO.readln());
  }
}
