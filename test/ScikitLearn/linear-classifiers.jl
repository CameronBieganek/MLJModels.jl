Xc1, yc1 = gen_classif(classes=["M", "F"])
Xc2, yc2 = gen_classif(classes=["A", "B", "C"])

@testset "LogRegClf" begin
    m, f = simple_test_classif_prob(LogisticClassifier(), Xc2, yc2)
    fp = fitted_params(m, f)
    @test keys(fp) == (:classes, :coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end

@testset "LogRegCVClf" begin
    m, f = simple_test_classif_prob(LogisticCVClassifier(), Xc2, yc2)
    fp = fitted_params(m, f)
    @test keys(fp) == (:classes, :coef, :intercept, :Cs, :l1_ratios, :coefs_paths, :scores, :C, :l1_ratio)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end

@testset "PAClf" begin
    m, f = simple_test_classif(PassiveAggressiveClassifier(), Xc1, yc1; dummybinary=true)
    fp = fitted_params(m, f)
    @test keys(fp) == (:coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end

@testset "PerceptronClf" begin
    m, f = simple_test_classif(PerceptronClassifier(), Xc2, yc2; dummybinary=true)
    fp = fitted_params(m, f)
    @test keys(fp) == (:coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end

@testset "RidgeClf" begin
    m, f = simple_test_classif(RidgeClassifier(), Xc2, yc2)
    fp = fitted_params(m, f)
    @test keys(fp) == (:coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end

@testset  "RidgeCVClf" begin
    m, f = simple_test_classif(RidgeCVClassifier(), Xc1, yc1)
    fp = fitted_params(m, f)
    @test keys(fp) == (:coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end

@testset "SGDClf" begin
    m, f = simple_test_classif(SGDClassifier(), Xc2, yc2; dummybinary=true)
    fp = fitted_params(m, f)
    @test keys(fp) == (:coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])

    m, f = simple_test_classif_prob(ProbabilisticSGDClassifier(), Xc2, yc2)
    fp = fitted_params(m, f)
    @test keys(fp) == (:coef, :intercept)
    infos = info_dict(m)
    @test infos[:input_scitype] == MLJBase.Table(MLJBase.Continuous)
    @test infos[:target_scitype] == AbstractVector{<:MLJBase.Finite}
    @test !isempty(infos[:docstring])
end
