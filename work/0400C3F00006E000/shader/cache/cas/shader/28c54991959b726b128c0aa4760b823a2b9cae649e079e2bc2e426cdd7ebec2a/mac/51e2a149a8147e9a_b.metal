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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _49;
    float _71 = _69 * _55;
    float _73 = _69 * _61;
    float _75 = _69 * _67;
    float _77 = _71 * _71;
    float _79 = fma(_73, _73, _77);
    float _81 = fma(_75, _75, _79);
    float _83 = rsqrt(_81);
    float _85 = _71 * _83;
    float _87 = _73 * _83;
    float _89 = _75 * _83;
    float _91 = _85 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _93 = fma(_87, (*spvDescriptorSet0.fp_c5)._m0[2].x, _91);
    float _95 = _85 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].z, _93);
    float _99 = fma(_95, 0.5, 0.5);
    float _101 = fma(_97, 0.5, 0.5);
    float2 _504 = float2(_101, _99);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_504, float2(0.0), isnan(_504))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _69 * _118;
    bool _124 = _95 >= _120;
    float _126 = _120;
    float _128 = _118;
    if (!_124)
    {
        _126 = 0.0;
    }
    float _130 = _126;
    float _132 = 0.0;
    float _134 = _130;
    if (!_124)
    {
        _128 = 0.0;
        _132 = 0.0;
    }
    float _136 = _128;
    float _138 = _132;
    bool _140 = !_124;
    float _142 = _138;
    float _144 = _136;
    if (!_140)
    {
        float _146 = in.m_39.x;
        float _148 = gl_FragCoord.w;
        float _150 = _146 * _148;
        float _152 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _154 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _152;
        float _156 = 1.0 / _154;
        float _158 = _69 * _150;
        float _160 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _164 = _158 + _162;
        float _166 = log2(_160);
        float _168 = _164 * _156;
        float _170 = sqrt(_168);
        float _172 = _166 * 0.1155245304107666015625;
        float2 _597 = float2(_172, _170);
        float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).xyz;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        _142 = _178;
        _144 = _180;
        _134 = _182;
    }
    float _184 = _142;
    float _186 = _144;
    float _188 = _134;
    float _190 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _192 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _194 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[12].z, _192);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _112 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _204 = _190 + _202;
    float _206 = _190 * _184;
    float _208 = _196 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _210 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _212 = fma(_200, _204, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _214 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _216 = _210 + _214;
    float _218 = fma(_206, _208, _212);
    float _220 = _210 * _186;
    float _222 = _218 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _224 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _226 = fma(_200, _216, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _228 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _230 = _224 + _228;
    float _232 = _224 * _188;
    float _234 = fma(_220, _208, _226);
    bool _236 = _222 >= 1.41299998760223388671875;
    bool _238 = isnan(_222);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    float _246 = fma(_200, _230, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _248 = _234 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _250 = fma(_232, _208, _246);
    bool _252 = _248 >= 1.41299998760223388671875;
    bool _254 = isnan(_248);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = _250 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    int _265 = as_type<int>(_234);
    float _267 = _224;
    int _269 = as_type<int>(_210);
    float _271 = _250;
    float _273 = _248;
    float _275 = _262;
    float _277 = _232;
    float _279 = _222;
    float _281 = _208;
    float _283 = _220;
    if (!_244)
    {
        float _285 = _222 * 0.38317000865936279296875;
        _265 = as_type<int>(_285);
    }
    int _287 = _265;
    bool _289 = _262 >= 1.41299998760223388671875;
    bool _291 = isnan(_262);
    bool _293 = _289 || _291;
    bool _295 = isnan(1.41299998760223388671875);
    bool _297 = _293 || _295;
    if (_244)
    {
        float _299 = _222 * (-1.44269502162933349609375);
        _267 = _299;
    }
    float _301 = _267;
    int _303 = _287;
    int _305 = as_type<int>(_301);
    if (!_244)
    {
        float _307 = abs(as_type<float>(_287));
        float _309 = log2(_307);
        _303 = as_type<int>(_309);
    }
    int _311 = _303;
    if (!_260)
    {
        float _313 = _248 * 0.38317000865936279296875;
        _269 = as_type<int>(_313);
    }
    int _315 = _269;
    if (_260)
    {
        float _317 = _248 * (-1.44269502162933349609375);
        _271 = _317;
    }
    float _319 = _271;
    if (!_297)
    {
        float _321 = _262 * 0.38317000865936279296875;
        _273 = _321;
    }
    float _323 = _273;
    int _325 = _315;
    if (!_260)
    {
        float _327 = abs(as_type<float>(_315));
        float _329 = log2(_327);
        _325 = as_type<int>(_329);
    }
    int _331 = _325;
    if (_297)
    {
        float _333 = _262 * (-1.44269502162933349609375);
        _275 = _333;
    }
    float _335 = _275;
    int _337 = _311;
    if (!_244)
    {
        float _339 = as_type<float>(_311) * 0.4545454680919647216796875;
        _277 = _339;
    }
    float _341 = _277;
    float _343 = _323;
    if (!_297)
    {
        float _345 = abs(_323);
        float _347 = log2(_345);
        _343 = _347;
    }
    float _349 = _343;
    int _351 = _331;
    if (!_260)
    {
        float _353 = as_type<float>(_331) * 0.4545454680919647216796875;
        _279 = _353;
    }
    float _355 = _279;
    if (_244)
    {
        float _357 = exp2(_301);
        _281 = _357;
    }
    float _359 = _281;
    if (!_297)
    {
        float _361 = _349 * 0.4545454680919647216796875;
        _283 = _361;
    }
    float _363 = _283;
    float _365 = _319;
    if (_260)
    {
        float _367 = exp2(_319);
        _365 = _367;
    }
    float _369 = _365;
    if (!_260)
    {
        float _371 = exp2(_355);
        _305 = as_type<int>(_371);
    }
    int _373 = _305;
    float _375 = _335;
    int _377 = _373;
    if (_297)
    {
        float _379 = exp2(_335);
        _375 = _379;
    }
    float _381 = _375;
    if (!_244)
    {
        float _383 = exp2(_341);
        _337 = as_type<int>(_383);
    }
    int _385 = _337;
    int _387 = _385;
    if (_260)
    {
        float _389 = -_369;
        float _391 = _389 + 1.0;
        _377 = as_type<int>(_391);
    }
    int _393 = _377;
    if (!_297)
    {
        float _395 = exp2(_363);
        _351 = as_type<int>(_395);
    }
    int _397 = _351;
    int _399 = _397;
    if (_244)
    {
        float _401 = -_359;
        float _403 = _401 + 1.0;
        _387 = as_type<int>(_403);
    }
    int _405 = _387;
    if (_297)
    {
        float _407 = -_381;
        float _409 = _407 + 1.0;
        _399 = as_type<int>(_409);
    }
    int _411 = _399;
    out.m_42.x = as_type<float>(_405);
    out.m_42.y = as_type<float>(_393);
    out.m_42.z = as_type<float>(_411);
    out.m_42.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _49;
    float _71 = _69 * _55;
    float _73 = _69 * _61;
    float _75 = _69 * _67;
    float _77 = _71 * _71;
    float _79 = fma(_73, _73, _77);
    float _81 = fma(_75, _75, _79);
    float _83 = rsqrt(_81);
    float _85 = _71 * _83;
    float _87 = _73 * _83;
    float _89 = _75 * _83;
    float _91 = _85 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _93 = fma(_87, (*spvDescriptorSet0.fp_c5)._m0[2].x, _91);
    float _95 = _85 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].z, _93);
    float _99 = fma(_95, 0.5, 0.5);
    float _101 = fma(_97, 0.5, 0.5);
    float2 _504 = float2(_101, _99);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_504, float2(0.0), isnan(_504))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _69 * _118;
    bool _124 = _95 >= _120;
    float _126 = _120;
    float _128 = _118;
    if (!_124)
    {
        _126 = 0.0;
    }
    float _130 = _126;
    float _132 = 0.0;
    float _134 = _130;
    if (!_124)
    {
        _128 = 0.0;
        _132 = 0.0;
    }
    float _136 = _128;
    float _138 = _132;
    bool _140 = !_124;
    float _142 = _138;
    float _144 = _136;
    if (!_140)
    {
        float _146 = in.m_39.x;
        float _148 = gl_FragCoord.w;
        float _150 = _146 * _148;
        float _152 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _154 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _152;
        float _156 = 1.0 / _154;
        float _158 = _69 * _150;
        float _160 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _164 = _158 + _162;
        float _166 = log2(_160);
        float _168 = _164 * _156;
        float _170 = sqrt(_168);
        float _172 = _166 * 0.1155245304107666015625;
        float2 _597 = float2(_172, _170);
        float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).xyz;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        _142 = _178;
        _144 = _180;
        _134 = _182;
    }
    float _184 = _142;
    float _186 = _144;
    float _188 = _134;
    float _190 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _192 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _194 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[12].z, _192);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _112 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _204 = _190 + _202;
    float _206 = _190 * _184;
    float _208 = _196 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _210 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _212 = fma(_200, _204, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _214 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _216 = _210 + _214;
    float _218 = fma(_206, _208, _212);
    float _220 = _210 * _186;
    float _222 = _218 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _224 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _226 = fma(_200, _216, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _228 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _230 = _224 + _228;
    float _232 = _224 * _188;
    float _234 = fma(_220, _208, _226);
    bool _236 = _222 >= 1.41299998760223388671875;
    bool _238 = isnan(_222);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    float _246 = fma(_200, _230, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _248 = _234 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _250 = fma(_232, _208, _246);
    bool _252 = _248 >= 1.41299998760223388671875;
    bool _254 = isnan(_248);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = _250 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    int _265 = as_type<int>(_234);
    float _267 = _224;
    int _269 = as_type<int>(_210);
    float _271 = _250;
    float _273 = _248;
    float _275 = _262;
    float _277 = _232;
    float _279 = _222;
    float _281 = _208;
    float _283 = _220;
    if (!_244)
    {
        float _285 = _222 * 0.38317000865936279296875;
        _265 = as_type<int>(_285);
    }
    int _287 = _265;
    bool _289 = _262 >= 1.41299998760223388671875;
    bool _291 = isnan(_262);
    bool _293 = _289 || _291;
    bool _295 = isnan(1.41299998760223388671875);
    bool _297 = _293 || _295;
    if (_244)
    {
        float _299 = _222 * (-1.44269502162933349609375);
        _267 = _299;
    }
    float _301 = _267;
    int _303 = _287;
    int _305 = as_type<int>(_301);
    if (!_244)
    {
        float _307 = abs(as_type<float>(_287));
        float _309 = log2(_307);
        _303 = as_type<int>(_309);
    }
    int _311 = _303;
    if (!_260)
    {
        float _313 = _248 * 0.38317000865936279296875;
        _269 = as_type<int>(_313);
    }
    int _315 = _269;
    if (_260)
    {
        float _317 = _248 * (-1.44269502162933349609375);
        _271 = _317;
    }
    float _319 = _271;
    if (!_297)
    {
        float _321 = _262 * 0.38317000865936279296875;
        _273 = _321;
    }
    float _323 = _273;
    int _325 = _315;
    if (!_260)
    {
        float _327 = abs(as_type<float>(_315));
        float _329 = log2(_327);
        _325 = as_type<int>(_329);
    }
    int _331 = _325;
    if (_297)
    {
        float _333 = _262 * (-1.44269502162933349609375);
        _275 = _333;
    }
    float _335 = _275;
    int _337 = _311;
    if (!_244)
    {
        float _339 = as_type<float>(_311) * 0.4545454680919647216796875;
        _277 = _339;
    }
    float _341 = _277;
    float _343 = _323;
    if (!_297)
    {
        float _345 = abs(_323);
        float _347 = log2(_345);
        _343 = _347;
    }
    float _349 = _343;
    int _351 = _331;
    if (!_260)
    {
        float _353 = as_type<float>(_331) * 0.4545454680919647216796875;
        _279 = _353;
    }
    float _355 = _279;
    if (_244)
    {
        float _357 = exp2(_301);
        _281 = _357;
    }
    float _359 = _281;
    if (!_297)
    {
        float _361 = _349 * 0.4545454680919647216796875;
        _283 = _361;
    }
    float _363 = _283;
    float _365 = _319;
    if (_260)
    {
        float _367 = exp2(_319);
        _365 = _367;
    }
    float _369 = _365;
    if (!_260)
    {
        float _371 = exp2(_355);
        _305 = as_type<int>(_371);
    }
    int _373 = _305;
    float _375 = _335;
    int _377 = _373;
    if (_297)
    {
        float _379 = exp2(_335);
        _375 = _379;
    }
    float _381 = _375;
    if (!_244)
    {
        float _383 = exp2(_341);
        _337 = as_type<int>(_383);
    }
    int _385 = _337;
    int _387 = _385;
    if (_260)
    {
        float _389 = -_369;
        float _391 = _389 + 1.0;
        _377 = as_type<int>(_391);
    }
    int _393 = _377;
    if (!_297)
    {
        float _395 = exp2(_363);
        _351 = as_type<int>(_395);
    }
    int _397 = _351;
    int _399 = _397;
    if (_244)
    {
        float _401 = -_359;
        float _403 = _401 + 1.0;
        _387 = as_type<int>(_403);
    }
    int _405 = _387;
    if (_297)
    {
        float _407 = -_381;
        float _409 = _407 + 1.0;
        _399 = as_type<int>(_409);
    }
    int _411 = _399;
    out.m_42.x = as_type<float>(_405);
    out.m_42.y = as_type<float>(_393);
    out.m_42.z = as_type<float>(_411);
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

