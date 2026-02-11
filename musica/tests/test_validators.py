import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import pytest
from musica_validators import (
    verificar_stackefectivo,
    verificar_stack,
    verificar_name,
    verificar_bet
)

def test_verificar_stackefectivo_none_returns_none():
    assert verificar_stackefectivo(None) is None

def test_verificar_stackefectivo_numeric_returns_float():
    assert verificar_stackefectivo(123.45) == 123.45
    assert verificar_stackefectivo(42) == 42.0

def test_verificar_stackefectivo_comma_to_dot():
    assert verificar_stackefectivo("123,45") == 123.45
    assert verificar_stackefectivo("1,0") == 1.0

def test_verificar_stackefectivo_trailing_dot_removed():
    assert verificar_stackefectivo("123.") == 123.0
    assert verificar_stackefectivo("1.") == 1.0

def test_verificar_stack_none_returns_none():
    assert verificar_stack(None) is None

def test_verificar_stack_numeric_passthrough():
    assert verificar_stack(10) == 10.0
    assert verificar_stack(3.5) == 3.5

def test_verificar_stack_string_cleanup_dot0():
    assert verificar_stack("100.0") == "1000"
    assert verificar_stack(".50") == "50"
    assert verificar_stack(".") == "0"

def test_verificar_name_none_returns_empty_string():
    assert verificar_name(None) == ""
    assert verificar_name("") == ""

def test_verificar_bet_known_cases():
    assert verificar_bet("05") == 0.5
    assert verificar_bet("1s01s") == ""
    assert verificar_bet("1501") == ""
