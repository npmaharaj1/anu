/*
 * Searches for a needle in a sorted haystack
*/

boolean binarySearch(int[] haystack, int needle) {
  int lower = 0;
  int upper = haystack.length - 1;
  while () {
    int middle = (lower + upper) / 2;
    if (needle == haystack[middle]) {
      return true;
    } else if (needle > haystack[middle]) {
      lower = middle;
    }
  }
  return false;
}

void main() {

}
