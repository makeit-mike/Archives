#include <iostream>

class Solution {
	int main() {
		ListNode n = new ListNode(1);
		ListNode n2 = new ListNode(2);
		addTwoNumbers(n*, n2*);

		std::cout << "Hello... world\n";	
		return 0;
	}
		
	public:
	    struct ListNode {
	    	int val;
		ListNode *next;
		ListNode() : val(0), next(nullptr){}
		ListNode(int x) : val (x), next (nullptr) {}
		ListNode(int x, ListNode *next) : val(x), next(next) {}
	    };
	    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
		
		if(l1 == NULL && l2 == NULL)
     			return NULL;

		ListNode *head = new ListNode();
		ListNode *res = head;
		int carry = 0;

		while(l1 != nullptr || l2 != nullptr){
			int sum = carry;

			if(l1 != nullptr){
				sum += l1 -> val;
				l1 = l1 -> next;
			}
			if(l2 != nullptr){
				sum += l2 -> val;
				l2 = l2 -> next;
			}

			res->next = new ListNode(sum % 10);

			carry = sum / 10;

			res = res -> next;
		}		

		if (carry > 0){
			res -> next = new ListNode(carry);
			res = res -> next;
		}
		return head -> next;
	  }
};