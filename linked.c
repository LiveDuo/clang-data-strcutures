#include <stdio.h>
#include <stdlib.h>

struct Node { int data; struct Node* next; };

void append(struct Node** head, int value) {

    struct Node* newNode = malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->next = NULL;

    if (*head == NULL) { *head = newNode; return; }
    struct Node* temp = *head;
    while (temp->next != NULL) { temp = temp->next; }
    temp->next = newNode;
}

void traverse(struct Node* head) {
    struct Node* temp = head;
    while (temp != NULL) { printf("%d (%p) -> ", temp->data, &temp); temp = temp->next; }
    printf("NULL\n");
}

// clang -o out/linked.out linked.c && out/linked.out
int main() {

    struct Node* head = NULL;
    append(&head, 10);
    append(&head, 20);
    traverse(head);

    return 0;
}
