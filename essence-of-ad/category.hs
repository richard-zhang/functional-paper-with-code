import Prelude hiding ((.))

class Category k where
    id :: a `k` a
    (.) :: (b `k` c) -> (a `k` b) -> (a `k` c)

instance Category (->) where
    id x = x
    (.) g f x = g (f x)

class Category k => Monoidal k where
    cross :: (a `k` b) -> (c `k` d) -> ((a, c) `k` (b, d))

class Category k => Cartesian k where
    exl :: (a, b) `k` a
    exr :: (a, b) `k` b
    dup :: a `k` (a, a)

class Category k => Cocartesian k where
    inl :: a `k` (a, b)
    inr :: a `k` (b, a)
    jam :: (a, a) `k` a

class Scalable k a where
    scale :: a -> (a `k` a)
-- Num

class NumCat k a where
    negateC :: a `k` a
    addC :: (a, a) `k` a
    mulC :: (a, a) `k` a

class FloatCat k a where
    sinC :: a `k` a

newtype D k a b = MkD (a -> (b, a `k` b))
newtype Add a b = MkAdd (a -> b)
newtype Cont r k a b = MkCont ((b `k` r) -> (a `k` r))
newtype Dual k a b = MkDual (b `k` a)
newtype Begin r k a b = MkBegin ((r `k` a) -> (r `k` b))