#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = _65 * _77;
    float _81 = _67 * _77;
    float _83 = _69 * _77;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = _79 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _91 = fma(_87, 0.5, 0.5);
    float _93 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _95 = fma(_93, 0.5, 0.5);
    float2 _444 = float2(_95, _91);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_444, float2(0.0), isnan(_444))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = 0.0 + _87;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = in.m_33.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = abs(_110);
    float _120 = log2(_118);
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _124 = _122 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _128 = exp2(_126);
    float _130 = _63 * _116;
    float _132 = fma(_128, _124, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _134 = _132 * _130;
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _138 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].x, _136);
    float _140 = _106 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _146 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].x, _144);
    float _148 = fma(_142, _138, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _150 = fma(_142, _146, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _152 = -_148;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _156 = fma(_134, _154, _148);
    float _158 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _160 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _158);
    float _162 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _164 = fma(_142, _160, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _166 = -_150;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _170 = -_164;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _174 = fma(_134, _168, _150);
    bool _178 = _162 >= 1.41299998760223388671875;
    bool _180 = isnan(_162);
    bool _182 = _178 || _180;
    bool _184 = isnan(1.41299998760223388671875);
    bool _186 = _182 || _184;
    float _188 = fma(_134, _172, _164);
    float _190 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _192 = _188 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _194 = _190 >= 1.41299998760223388671875;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.41299998760223388671875);
    bool _202 = _198 || _200;
    bool _204 = _192 >= 1.41299998760223388671875;
    bool _206 = isnan(_192);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.41299998760223388671875);
    bool _212 = _208 || _210;
    int _215 = as_type<int>(_150);
    float _217 = _128;
    float _219 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _221 = _132;
    float _223 = _116;
    int _225 = as_type<int>(_164);
    float _227 = _192;
    float _229 = _162;
    float _231 = _134;
    int _233 = as_type<int>(_190);
    if (!_186)
    {
        float _235 = _162 * 0.38317000865936279296875;
        _215 = as_type<int>(_235);
    }
    int _237 = _215;
    if (_186)
    {
        float _239 = _162 * (-1.44269502162933349609375);
        _217 = _239;
    }
    float _241 = _217;
    float _243 = _241;
    if (_186)
    {
        float _245 = exp2(_241);
        _219 = _245;
    }
    float _247 = _219;
    if (!_202)
    {
        float _249 = _190 * 0.38317000865936279296875;
        _221 = _249;
    }
    float _251 = _221;
    if (_202)
    {
        float _253 = _190 * (-1.44269502162933349609375);
        _223 = _253;
    }
    float _255 = _223;
    if (!_212)
    {
        float _257 = _192 * 0.38317000865936279296875;
        _225 = as_type<int>(_257);
    }
    int _259 = _225;
    if (_212)
    {
        float _261 = _192 * (-1.44269502162933349609375);
        _227 = _261;
    }
    float _263 = _227;
    int _265 = _237;
    if (!_186)
    {
        float _267 = abs(as_type<float>(_237));
        float _269 = log2(_267);
        _265 = as_type<int>(_269);
    }
    int _271 = _265;
    int _273 = _259;
    if (!_212)
    {
        float _275 = abs(as_type<float>(_259));
        float _277 = log2(_275);
        _273 = as_type<int>(_277);
    }
    int _279 = _273;
    float _281 = _251;
    if (!_202)
    {
        float _283 = abs(_251);
        float _285 = log2(_283);
        _281 = _285;
    }
    float _287 = _281;
    int _289 = _271;
    if (!_186)
    {
        float _291 = as_type<float>(_271) * 0.4545454680919647216796875;
        _229 = _291;
    }
    float _293 = _229;
    int _295 = _279;
    if (!_212)
    {
        float _297 = as_type<float>(_279) * 0.4545454680919647216796875;
        _243 = _297;
    }
    float _299 = _243;
    float _301 = _263;
    if (_212)
    {
        float _303 = exp2(_263);
        _301 = _303;
    }
    float _305 = _301;
    if (!_202)
    {
        float _307 = _287 * 0.4545454680919647216796875;
        _231 = _307;
    }
    float _309 = _231;
    if (!_212)
    {
        float _311 = exp2(_299);
        _233 = as_type<int>(_311);
    }
    int _313 = _233;
    float _315 = _255;
    int _317 = _313;
    if (_202)
    {
        float _319 = exp2(_255);
        _315 = _319;
    }
    float _321 = _315;
    if (!_186)
    {
        float _323 = exp2(_293);
        _289 = as_type<int>(_323);
    }
    int _325 = _289;
    int _327 = _325;
    if (_212)
    {
        float _329 = -_305;
        float _331 = _329 + 1.0;
        _317 = as_type<int>(_331);
    }
    int _333 = _317;
    if (!_202)
    {
        float _335 = exp2(_309);
        _295 = as_type<int>(_335);
    }
    int _337 = _295;
    int _339 = _337;
    if (_186)
    {
        float _341 = -_247;
        float _343 = _341 + 1.0;
        _327 = as_type<int>(_343);
    }
    int _345 = _327;
    if (_202)
    {
        float _347 = -_321;
        float _349 = _347 + 1.0;
        _339 = as_type<int>(_349);
    }
    int _351 = _339;
    out.m_36.x = as_type<float>(_345);
    out.m_36.y = as_type<float>(_333);
    out.m_36.z = as_type<float>(_351);
    out.m_36.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = _65 * _77;
    float _81 = _67 * _77;
    float _83 = _69 * _77;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = _79 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _91 = fma(_87, 0.5, 0.5);
    float _93 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _95 = fma(_93, 0.5, 0.5);
    float2 _444 = float2(_95, _91);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_444, float2(0.0), isnan(_444))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = 0.0 + _87;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = in.m_33.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = abs(_110);
    float _120 = log2(_118);
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _124 = _122 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _128 = exp2(_126);
    float _130 = _63 * _116;
    float _132 = fma(_128, _124, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _134 = _132 * _130;
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _138 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].x, _136);
    float _140 = _106 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _146 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].x, _144);
    float _148 = fma(_142, _138, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _150 = fma(_142, _146, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _152 = -_148;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _156 = fma(_134, _154, _148);
    float _158 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _160 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _158);
    float _162 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _164 = fma(_142, _160, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _166 = -_150;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _170 = -_164;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _174 = fma(_134, _168, _150);
    bool _178 = _162 >= 1.41299998760223388671875;
    bool _180 = isnan(_162);
    bool _182 = _178 || _180;
    bool _184 = isnan(1.41299998760223388671875);
    bool _186 = _182 || _184;
    float _188 = fma(_134, _172, _164);
    float _190 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _192 = _188 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _194 = _190 >= 1.41299998760223388671875;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.41299998760223388671875);
    bool _202 = _198 || _200;
    bool _204 = _192 >= 1.41299998760223388671875;
    bool _206 = isnan(_192);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.41299998760223388671875);
    bool _212 = _208 || _210;
    int _215 = as_type<int>(_150);
    float _217 = _128;
    float _219 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _221 = _132;
    float _223 = _116;
    int _225 = as_type<int>(_164);
    float _227 = _192;
    float _229 = _162;
    float _231 = _134;
    int _233 = as_type<int>(_190);
    if (!_186)
    {
        float _235 = _162 * 0.38317000865936279296875;
        _215 = as_type<int>(_235);
    }
    int _237 = _215;
    if (_186)
    {
        float _239 = _162 * (-1.44269502162933349609375);
        _217 = _239;
    }
    float _241 = _217;
    float _243 = _241;
    if (_186)
    {
        float _245 = exp2(_241);
        _219 = _245;
    }
    float _247 = _219;
    if (!_202)
    {
        float _249 = _190 * 0.38317000865936279296875;
        _221 = _249;
    }
    float _251 = _221;
    if (_202)
    {
        float _253 = _190 * (-1.44269502162933349609375);
        _223 = _253;
    }
    float _255 = _223;
    if (!_212)
    {
        float _257 = _192 * 0.38317000865936279296875;
        _225 = as_type<int>(_257);
    }
    int _259 = _225;
    if (_212)
    {
        float _261 = _192 * (-1.44269502162933349609375);
        _227 = _261;
    }
    float _263 = _227;
    int _265 = _237;
    if (!_186)
    {
        float _267 = abs(as_type<float>(_237));
        float _269 = log2(_267);
        _265 = as_type<int>(_269);
    }
    int _271 = _265;
    int _273 = _259;
    if (!_212)
    {
        float _275 = abs(as_type<float>(_259));
        float _277 = log2(_275);
        _273 = as_type<int>(_277);
    }
    int _279 = _273;
    float _281 = _251;
    if (!_202)
    {
        float _283 = abs(_251);
        float _285 = log2(_283);
        _281 = _285;
    }
    float _287 = _281;
    int _289 = _271;
    if (!_186)
    {
        float _291 = as_type<float>(_271) * 0.4545454680919647216796875;
        _229 = _291;
    }
    float _293 = _229;
    int _295 = _279;
    if (!_212)
    {
        float _297 = as_type<float>(_279) * 0.4545454680919647216796875;
        _243 = _297;
    }
    float _299 = _243;
    float _301 = _263;
    if (_212)
    {
        float _303 = exp2(_263);
        _301 = _303;
    }
    float _305 = _301;
    if (!_202)
    {
        float _307 = _287 * 0.4545454680919647216796875;
        _231 = _307;
    }
    float _309 = _231;
    if (!_212)
    {
        float _311 = exp2(_299);
        _233 = as_type<int>(_311);
    }
    int _313 = _233;
    float _315 = _255;
    int _317 = _313;
    if (_202)
    {
        float _319 = exp2(_255);
        _315 = _319;
    }
    float _321 = _315;
    if (!_186)
    {
        float _323 = exp2(_293);
        _289 = as_type<int>(_323);
    }
    int _325 = _289;
    int _327 = _325;
    if (_212)
    {
        float _329 = -_305;
        float _331 = _329 + 1.0;
        _317 = as_type<int>(_331);
    }
    int _333 = _317;
    if (!_202)
    {
        float _335 = exp2(_309);
        _295 = as_type<int>(_335);
    }
    int _337 = _295;
    int _339 = _337;
    if (_186)
    {
        float _341 = -_247;
        float _343 = _341 + 1.0;
        _327 = as_type<int>(_343);
    }
    int _345 = _327;
    if (_202)
    {
        float _347 = -_321;
        float _349 = _347 + 1.0;
        _339 = as_type<int>(_349);
    }
    int _351 = _339;
    out.m_36.x = as_type<float>(_345);
    out.m_36.y = as_type<float>(_333);
    out.m_36.z = as_type<float>(_351);
    out.m_36.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

