<?php
use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../index.php';

class SimpleTest extends TestCase {
    public function testSayHello() {
        $this->assertEquals("Hello, Tito", sayHello("Tito"));
    }
}
