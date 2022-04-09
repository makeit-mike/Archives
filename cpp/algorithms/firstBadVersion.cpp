#import <iostream>

    int firstBadVersion(int n) {
        return binarySearch(1, n, n);
    }
    
    int binarySearch(int low, int high, int max){
        if(low >= high)
            return high;
        
        int mid = low + (high - low) / 2;
        
        if(mid == max)
            return high;
        
        if(isBadVersion(mid)){ // go left
            if(isBadVersion(mid - 1) == false)
                return mid;
            return binarySearch( low, mid, max );
        }else { // go right
            return binarySearch( mid, high, max );
        }

int main(){
	int version = 4;
	int fbv = 2;



	return 0;
}

