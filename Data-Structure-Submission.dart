عكس قائمة - Stacks//

void reverseList(List<int> list) {  // تعريف دالة لعكس ترتيب عناصر القائمة
  for (int i = list.length - 1; i>= 0; i--) {  // تكرار العناصر من النهاية إلى البداية
    print(list[i]);  // طباعة كل عنصر بعد عكس ترتيبه
}
}

void main() {  // نقطة البداية في البرنامج
  reverseList([1, 2, 3, 4, 5]);  // استدعاء الدالة مع قائمة من الأرقام لعكسها
}


 التحقق من توازن الأقواس - Stacks//

bool isBalanced(String str) {  // تعريف دالة للتحقق من توازن الأقواس
  int balance = 0;  // متغير لتتبع عدد الأقواس المفتوحة والمغلقة
  for (var char in str.runes) {  // تكرار كل حرف في النص
    if (char == '('.codeUnitAt(0)) balance++;  // زيادة العداد عند العثور على '('
    if (char == ')'.codeUnitAt(0)) balance--;  // إنقاص العداد عند العثور على ')'
    if (balance < 0) return false;  // إذا أصبح العدد سالبًا، فهذا يعني أن الأقواس غير متوازنة
}
  return balance == 0;  // إذا كان العدد صفرًا، فهذا يعني أن الأقواس متوازنة
}

void main() {  // نقطة البداية في البرنامج
  print(isBalanced("(())")); // طباعة true لأن الأقواس متوازنة
  print(isBalanced("(()))")); // طباعة false لأن الأقواس غير متوازنة
}


 طباعة القائمة المرتبطة بالعكس - Linked List//

class Node {  // تعريف فئة لتمثيل العقدة في القائمة المرتبطة
  int data;  // متغير لتخزين البيانات داخل العقدة
  Node? next;  // مؤشر يشير إلى العقدة التالية في القائمة
  Node(this.data);  // مُنشئ يأخذ البيانات ويخزنها في العقدة
}

void printReverse(Node? head) {  // دالة لطباعة القائمة المرتبطة بالعكس
  if (head == null) return;  // شرط الإيقاف عند الوصول لنهاية القائمة
  printReverse(head.next);  // استدعاء الدالة بشكل متكرر للوصول إلى العقدة الأخيرة أولاً
  print(head.data);  // طباعة البيانات بعد اكتمال الاستدعاءات العكسية
}

void main() {  // نقطة البداية في البرنامج
  Node head = Node(1)..next = Node(2)..next?.next = Node(3);  // إنشاء قائمة مرتبطة بـ 3 عقد
  printReverse(head);  // استدعاء الدالة لطباعة القائمة بالعكس
}


 العثور على العقدة الوسطى - Linked List//

Node? findMiddle(Node? head) {  // دالة للعثور على العقدة الوسطى في القائمة المرتبطة
  Node? slow = head, fast = head;  // مؤشران، أحدهما يتحرك بمعدل بطيء والآخر بسرعة مضاعفة
  while (fast!= null && fast.next!= null) {  // تكرار حتى نهاية القائمة
    slow = slow!.next;  // تحريك المؤشر البطيء بمقدار واحد
    fast = fast.next!.next;  // تحريك المؤشر السريع بمقدار اثنين
}
  return slow;  // عند انتهاء الحلقة، يكون المؤشر البطيء عند العقدة الوسطى
}

void main() {  // نقطة البداية في البرنامج
  Node head = Node(1)..next = Node(2)..next?.next = Node(3)..next?.next?.next = Node(4);  // إنشاء قائمة مرتبطة
  print(findMiddle(head)?.data);  // طباعة قيمة العقدة الوسطى
}




 عكس القائمة المرتبطة - Linked List//

Node? reverseList(Node? head) {  // دالة لعكس ترتيب العقد في القائمة المرتبطة
  Node? prev;  // مؤشر للعقدة السابقة
  while (head!= null) {  // التكرار حتى نهاية القائمة
    Node? next = head.next;  // حفظ العقدة التالية مؤقتًا
    head.next = prev;  // تغيير الربط بحيث تشير العقدة الحالية إلى العقدة السابقة
    prev = head;  // تحديث العقدة السابقة
    head = next;  // الانتقال إلى العقدة التالية
}
  return prev;  // إرجاع رأس القائمة بعد عكس ترتيبها
}

void main() {  // نقطة البداية في البرنامج
  Node head = Node(1)..next = Node(2)..next?.next = Node(3);  // إنشاء قائمة مرتبطة
  Node? reversed = reverseList(head);  // عكس ترتيب القائمة
  printReverse(reversed);  // طباعة القائمة بعد عكس ترتيبها
}




إزالة جميع التكرارات - Linked List//

Node? removeAllOccurrences(Node? head, int target) {  // دالة لإزالة جميع التكرارات لقيمة معينة في القائمة
  while (head!= null && head.data == target) {  // إذا كانت القيمة في رأس القائمة، يتم تحديث الرأس
    head = head.next;
}
  Node? current = head;  // متغير لتتبع العقد أثناء التكرار
  while (current?.next!= null) {  // التكرار حتى نهاية القائمة
if (current!.next!.data == target) {  // إذا كانت العقدة تحتوي على القيمة المستهدفة
      current.next = current.next!.next;  // إزالة العقدة بتغيير الربط إلى العقدة التالية
} else {
      current = current.next;  // الانتقال إلى العقدة التالية
}
}
  return head;  // إرجاع رأس القائمة بعد إزالة التكرارات
}

void main() {  // نقطة البداية في البرنامج
  Node head = Node(1)..next = Node(2)..next?.next = Node(1)..next?.next?.next = Node(3);  // إنشاء قائمة مرتبطة
  Node? result = removeAllOccurrences(head, 1);  // إزالة كل التكرارات للقيمة 1
  printReverse(result);  // طباعة القائمة بعد إزالة التكرارات
}
