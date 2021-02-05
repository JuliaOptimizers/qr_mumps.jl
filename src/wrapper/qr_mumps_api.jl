for (fname, lname, elty, subty) in ((:sqrm_spmat_init_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spmat_init_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spmat_init_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spmat_init_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spmat_init(spmat :: qrm_spmat{$elty})
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}},), ptr_spmat)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spmat_destroy_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spmat_destroy_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spmat_destroy_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spmat_destroy_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spmat_destroy(spmat :: qrm_spmat{$elty})
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}},), ptr_spmat)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spfct_init_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spfct_init_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spfct_init_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spfct_init_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spfct_init(spfct :: qrm_spfct{$elty}, spmat :: qrm_spmat{$elty})
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, Ptr{qrm_spmat{$elty}}), ptr_spfct, ptr_spmat)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spfct_destroy_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spfct_destroy_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spfct_destroy_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spfct_destroy_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spfct_destroy(spfct :: qrm_spfct{$elty})
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}},), ptr_spfct)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_readmat_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_readmat_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_readmat_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_readmat_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_readmat(matfile :: Cstring, spmat :: qrm_spmat{$elty})
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cvoid, (Cstring, Ptr{qrm_spmat{$elty}}), matfile, ptr_spmat)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_analyse_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_analyse_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_analyse_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_analyse_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_analyse(spmat :: qrm_spmat{$elty}, spfct :: qrm_spfct{$elty}; transp :: Char='n')
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{qrm_spfct{$elty}}, UInt8), ptr_spmat, ptr_spfct, transp)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_factorize_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_factorize_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_factorize_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_factorize_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_factorize(spmat :: qrm_spmat{$elty}, spfct :: qrm_spfct{$elty}; transp :: Char='n')
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{qrm_spfct{$elty}}, UInt8), ptr_spmat, ptr_spfct, transp)
    end
  end
end


for (fname, lname, elty, subty) in ((:sqrm_solve_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_solve_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_solve_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_solve_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_solve(spfct :: qrm_spfct{$elty}, b :: Vector{$elty}, x :: Vector{$elty}; transp :: Char='n')
      nrhs = 1
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, UInt8, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spfct, transp, pointer(b), pointer(x), nrhs)
    end

    function qrm_solve(spfct :: qrm_spfct{$elty}, b :: Matrix{$elty}, x :: Matrix{$elty}; transp :: Char='n')
      nrhs = size(b, 2)
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, UInt8, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spfct, transp, pointer(b), pointer(x), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_apply_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_apply_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_apply_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_apply_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_apply(spfct :: qrm_spfct{$elty}, b :: Vector{$elty}; transp :: Char='n')
      nrhs = 1
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, UInt8, Ptr{$elty}, Cint), ptr_spfct, transp, pointer(b), nrhs)
    end

    function qrm_apply(spfct :: qrm_spfct{$elty}, b :: Matrix{$elty}; transp :: Char='n')
      nrhs = size(b, 2)
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, UInt8, Ptr{$elty}, Cint), ptr_spfct, transp, pointer(b), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_matmul_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_matmul_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_matmul_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_matmul_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_matmul(spmat :: qrm_spmat{$elty}, alpha :: $elty, x :: Vector{$elty}, beta :: $elty, y :: Vector{$elty}; transp :: Char='n')
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      cccall(($(String(fname)), $lname), Cvoid, (Ptr{qrm_spmat{$elty}}, UInt8, $elty, Ptr{$elty}, $elty, Ptr{$elty}, Cint), ptr_spmat, transp, alpha, pointer(x), beta, pointer(y), nrhs)
    end

    function qrm_matmul(spmat :: qrm_spmat{$elty}, alpha :: $elty, x :: Matrix{$elty}, beta :: $elty, y :: Matrix{$elty}; transp :: Char='n')
      nrhs = size(y, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cvoid, (Ptr{qrm_spmat{$elty}}, UInt8, $elty, Ptr{$elty}, $elty, Ptr{$elty}, Cint), ptr_spmat, transp, alpha, pointer(x), beta, pointer(y), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spmat_nrm_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spmat_nrm_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spmat_nrm_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spmat_nrm_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spmat_nrm(spmat :: qrm_spmat{$elty}, ntype :: Char, nrm :: $subty)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, UInt8, Ptr{$subty}), ptr_spmat, ntype, nrm)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_vecnrm_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_vecnrm_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_vecnrm_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_vecnrm_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_vecnrm(x :: Vector{$elty}, n :: Integer, ntype :: Char, nrm :: $subty)
      nrhs = 1
      ccall(($(String(fname)), $lname), Cint, (Ptr{$elty}, Cint, Cint, UInt8, $subty), pointer(x), n, nrhs, ntype, nrm)
    end

    function qrm_vecnrm(x :: Matrix{$elty}, n :: Integer, ntype :: Char, nrm :: Vector{$subty})
      nrhs = size(b, 2)
      ccall(($(String(fname)), $lname), Cint, (Ptr{$elty}, Cint, Cint, UInt8, Ptr{$subty}), pointer(x), n, nrhs, ntype, pointer(nrm))
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spbackslash_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spbackslash_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spbackslash_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spbackslash_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spbackslash(spmat :: qrm_spmat{$elty}, b :: Vector{$elty}, x :: Vector{$elty})
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end

    function qrm_spbackslash(spmat :: qrm_spmat{$elty}, b :: Matrix{$elty}, x :: Matrix{$elty})
      nrhs = size(b, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spposv_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spposv_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spposv_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spposv_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spposv(spmat :: qrm_spmat{$elty}, b :: Vector{$elty}, x :: Vector{$elty})
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end

    function qrm_spposv(spmat :: qrm_spmat{$elty}, b :: Matrix{$elty}, x :: Matrix{$elty})
      nrhs = size(b, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_least_squares_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_least_squares_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_least_squares_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_least_squares_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_least_squares(spmat :: qrm_spmat{$elty}, b :: Vector{$elty}, x :: Vector{$elty})
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      cccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end

    function qrm_least_squares(spmat :: qrm_spmat{$elty}, b :: Matrix{$elty}, x :: Matrix{$elty})
      nrhs = size(b, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_min_norm_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_min_norm_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_min_norm_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_min_norm_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_min_norm(spmat :: qrm_spmat{$elty}, b :: Vector{$elty}, x :: Vector{$elty})
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end

    function qrm_min_norm(spmat :: qrm_spmat{$elty}, b :: Matrix{$elty}, x :: Matrix{$elty})
      nrhs = size(b, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint), ptr_spmat, pointer(b), pointer(x), nrhs)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_residual_norm_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_residual_norm_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_residual_norm_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_residual_norm_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_residual_norm(spmat :: qrm_spmat{$elty}, b :: Vector{$elty}, x :: Vector{$elty}, nrm :: $subty)
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint, $subty), ptr_spmat, pointer(b), pointer(x), nrhs, nrm)
    end

    function qrm_residual_norm(spmat :: qrm_spmat{$elty}, b :: Matrix{$elty}, x :: Matrix{$elty}, nrm :: Vector{$subty})
      nrhs = size(r, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Ptr{$elty}, Cint, Ptr{$subty}), ptr_spmat, pointer(b), pointer(x), nrhs, pointer(nrm))
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_residual_orth_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_residual_orth_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_residual_orth_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_residual_orth_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_residual_orth(spmat :: qrm_spmat{$elty}, r :: Vector{$elty}, nrm :: $subty)
      nrhs = 1
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Cint, $subty), ptr_spmat, pointer(r), nrhs, nrm)
    end

    function qrm_residual_orth(spmat :: qrm_spmat{$elty}, r :: Matrix{$elty}, nrm :: Vector{$subty})
      rhs = size(r, 2)
      ptr_spmat = Ptr{qrm_spmat{$elty}}(pointer_from_objref(spmat))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spmat{$elty}}, Ptr{$elty}, Cint, Ptr{$subty}), ptr_spmat, pointer(r), nrhs, pointer(nrm))
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spfct_seti_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spfct_seti_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spfct_seti_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spfct_seti_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spfct_seti(spfct :: qrm_spfct{$elty}, str :: Cstring, val :: Integer)
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, Cstring, Cint), ptr_spfct, str, val)
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spfct_geti_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spfct_geti_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spfct_geti_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spfct_geti_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spfct_geti(spfct :: qrm_spfct{$elty}, str :: Cstring, val :: Vector{Integer})
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, Cstring, Ptr{Cint}), ptr_spfct, str, pointer(val))
    end
  end
end

for (fname, lname, elty, subty) in ((:sqrm_spfct_getii_c, :libsqrm, Float32   , Float32),
                                    (:dqrm_spfct_getii_c, :libdqrm, Float64   , Float64),
                                    (:cqrm_spfct_getii_c, :libcqrm, ComplexF32, Float32),
                                    (:zqrm_spfct_getii_c, :libzqrm, ComplexF64, Float64))
  @eval begin
    function qrm_spfct_getii(spfct :: qrm_spfct{$elty}, str :: Cstring, val :: Vector{Integer})
      ptr_spfct = Ptr{qrm_spfct{$elty}}(pointer_from_objref(spfct))
      ccall(($(String(fname)), $lname), Cint, (Ptr{qrm_spfct{$elty}}, Cstring, Ptr{Clonglong}), ptr_spfct, str, pointer(val))
    end
  end
end

function qrm_swtime()
  ccall((:qrm_swtime, :libqrm_common), Cdouble, ())
end

function qrm_gseti(str :: Cstring, val :: Integer)
  ccall((:qrm_gseti_c, :libqrm_common), Cint, (Cstring, Cint), str, val)
end

function qrm_ggeti(str :: Cstring, val :: Vector{Integer})
  ccall((:qrm_ggeti_c, :libqrm_common), Cint, (Cstring, Ptr{Cint}), str, pointer(val))
end

function qrm_ggetii(str :: Cstring, val :: Vector{Integer})
  ccall((:qrm_ggetii_c, :libqrm_common), Cint, (Cstring, Ptr{Clonglong}), str, pointer(val))
end

function qrm_init(ncpu :: Integer, ngpu :: Integer)
  ccall((:qrm_init_c, :libqrm_common), Cint, (Cint, Cint), ncpu, ngpu)
end

function qrm_finalize()
  ccall((:qrm_finalize_c, :libqrm_common), Cvoid, ())
end
