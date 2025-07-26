package oop.week02accessmodifier;

public class B extends A { 
    
}

/**
 * B báo lỗi vì ở B sẽ có 1 constructor mặc định, và nó sẽ gọi tới constructor của A.
 * Nhưng constructor của A là private, nên B không thể gọi được.
 */