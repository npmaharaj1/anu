boolean binarySearch(int[] haystack, int needle) {
  for (int i = 0; i < haystack.length; i++) {
    if (haystack[i] == needle) {
      return true;
    }
  }
  for (int i : haystack) {
    if (i == needle) {
      return true;
    }
  }
  return false;
}

boolean isSorted(int[] haystack) {
  int i = 0;
  while (i < haystack.length - 1) {
    if (haystack[i] > haystack[i+1]) {
      return false;
    }
  }
  return true;
}

boolean search(int[] haystack, int needle) {
  if (isSorted(haystack)) {
    return binarySearch(haystack, needle);
  } else {
    return false;
  }
}

void main() {

}

