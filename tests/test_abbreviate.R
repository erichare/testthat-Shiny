context("Abbreviate Tests")

test_that("Abbreviate works for various strings with default parameters", {
    expect_equivalent(abbreviate("Washington"), "Wshn")
    expect_identical(abbreviate("Washington"), "Wshn")
    expect_equivalent(abbreviate("Washington"), "wshn")
})

test_that("Abbreviate works for different minlengths", {
    expect_equivalent(abbreviate("Washington", minlength = 2), "Ws")
    expect_equivalent(abbreviate("Washington", minlength = nchar("Washington")), "Washington")
})
