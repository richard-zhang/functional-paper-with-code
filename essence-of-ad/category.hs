import Prelude hiding ((.))

class Category k where
    id :: a `k` a
    (.) :: (b `k` c) -> (a `k` b) -> (a `k` c)

instance Category (->) where
    id x = x
    (.) g f x = g (f x)

class Category k => Monoidal k where
    cross :: (a `k` b) -> (c `k` d) -> ((a, c) `k` (b, d))