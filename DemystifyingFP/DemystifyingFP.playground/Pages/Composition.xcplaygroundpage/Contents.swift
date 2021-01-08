/*:
 # Composition
 
 How can we make larger programs?
 */
func compose<A, B, C>(
    _ f: @escaping (A) -> B,
    _ g: @escaping (B) -> C
) -> (A) -> C {
    return { a in g(f(a)) }
}

/*:
 What about this?
 */
func compose<A, B, C>(
    _ f: @escaping (A) -> B?,
    _ g: @escaping (B) -> C
) -> (A) -> C? {
    { a in f(a).map(g) }
}

func compose<A, B, C>(
    _ f: @escaping (A) -> [B],
    _ g: @escaping (B) -> C
) -> (A) -> [C] {
    { a in f(a).map(g) }
}

func compose<A, B, C>(
    _ f: @escaping (A) -> Result<B, Error>,
    _ g: @escaping (B) -> C
) -> (A) -> Result<C, Error> {
    { a in f(a).map(g) }
}

//func compose<A, B, C, F: Functor>(
//    _ f: @escaping (A) -> F<B>,
//    _ g: @escaping (B) -> C
//) -> (A) -> F<C> {
//    { a in f(a).map(g) }
//}
/*:
 And this one?
 */
func compose<A, B, C>(
    _ f: @escaping (A) -> B?,
    _ g: @escaping (B) -> C?
) -> (A) -> C? {
    { a in f(a).flatMap(g) }
}

func compose<A, B, C>(
    _ f: @escaping (A) -> [B],
    _ g: @escaping (B) -> [C]
) -> (A) -> [C] {
    { a in f(a).flatMap(g) }
}

func compose<A, B, C>(
    _ f: @escaping (A) -> Result<B, Error>,
    _ g: @escaping (B) -> Result<C, Error>
) -> (A) -> Result<C, Error> {
    { a in f(a).flatMap(g) }
}

//func compose<A, B, C, F: Monad>(
//    _ f: @escaping (A) -> F<B>,
//    _ g: @escaping (B) -> F<C>
//) -> (A) -> F<C> {
//    { a in f(a).flatMap(g) }
//}

func zip<A, B, C>(
    _ a: A?,
    _ b: B?,
    _ f: @escaping (A, B) -> C
) -> C? {
    fatalError("Complete this implementation!")
}
