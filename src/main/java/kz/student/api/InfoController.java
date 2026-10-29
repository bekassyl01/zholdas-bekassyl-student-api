package kz.student.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InfoController {
    @GetMapping("/")
    public String info() { return "Student API by Zholdas Bekassyl, version 1.1"; }
}
