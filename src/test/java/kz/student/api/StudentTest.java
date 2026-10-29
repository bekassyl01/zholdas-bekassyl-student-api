package kz.student.api;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class StudentTest {
    @Test
    void studentStoresName() {
        Student s = new Student("Zholdas Bekassyl", "bekassyl@example.com");
        assertEquals("Zholdas Bekassyl", s.getFullName());
    }
}
