; block

; call

(call) @call.outer (arguments) @call.inner

; class

; comment

(comment) @comment.outer

; conditional

(if
  condition: (_)? @conditional.inner) @conditional.outer

; function

[
  (function_definition)
  (lambda_function)
] @function.outer

(function_definition
  [
    (call)
    (binary)
    (brace_list)
  ] @function.inner) @function.outer

(lambda_function
  [
    (call)
    (binary)
    (brace_list)
  ] @function.inner
) @function.outer

; loop

[
  (while)
  (repeat)
  (for)
] @loop.outer

(while body: (_) @loop.inner)

(repeat body: (_) @loop.inner)

(for body: (_) @loop.inner)

; statement
(brace_list (_) @statement.outer)
(program (_) @statement.outer)


; parameter

((formal_parameters
  ","  @parameter.outer._start .
  (_) @parameter.inner @parameter.outer._end
  )
  )

((formal_parameters
  . (_) @parameter.inner @parameter.outer._start
  . ","?  @parameter.outer._end
  )
  )

((arguments
  ","  @parameter.outer._start .
  (_) @parameter.inner @parameter.outer._end
  )
  )

((arguments
  . (_) @parameter.inner @parameter.outer._start
  . ","?  @parameter.outer._end
  )
  )

