context("Mean Tests")

test_that("Mean works for simple inputs", {
    expect_equal(mean(c(1, 2, 3)), 2)
})
