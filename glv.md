* Implementation in SageMath
    * Parameters of the curve
	* Simple double and add; test vectors
	* Multi-Scalar multiplication; test vectors
	* Psi; test vectors
	* Scalar decomposition
	* GLV method; test vectors match the double and add
      algorithm. Bench avec le double and add.
   
* Implementation in Rust bls12_381 (zk dusk)
    * Implement multi-scalar multiplication; match SageMath impl
	* Scalar decomposition (from Bandersnatch code)
	* GLV
	* Bench.
