##------------------------------------------------------------------------------
context("YamlContext.ObjectReference.S3/basics")
##------------------------------------------------------------------------------

test_that("YamlContext.ObjectReference.S3/create", {

  expect_is(res <- YamlContext.ObjectReference.S3(), 
            "YamlContext.ObjectReference.S3")
  expect_equal(res$ctx, "YamlContext.ObjectReference.S3")
  expect_is(YamlContext.ObjectReference.S3(TRUE), 
            "YamlContext.ObjectReference.S3")
  
  expect_is(res <- YamlContext.ObjectReference.S3(
      ctx = "YamlContext.ObjectReference.S3"
    ), 
    "YamlContext.ObjectReference.S3"
  )
  expect_equal(res$ctx, "YamlContext.ObjectReference.S3")
  
})

