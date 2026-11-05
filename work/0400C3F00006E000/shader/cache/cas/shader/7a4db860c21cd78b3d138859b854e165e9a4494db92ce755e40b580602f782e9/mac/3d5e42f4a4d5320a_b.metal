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
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _473 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_473, float2(0.0), isnan(_473))).x;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = _63 * _87;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _89 * _89;
    float _103 = fma(_93, _93, _101);
    float _105 = fma(_91, _91, _103);
    float _107 = rsqrt(_105);
    float _109 = _89 * _107;
    float _111 = _63 * _99;
    float _113 = _93 * _107;
    float _115 = _91 * _107;
    float _117 = _109 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _119 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[2].x, _117);
    float _121 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[2].z, _119);
    float _123 = fma(_121, -0.5, 0.5);
    float _125 = fma(_121, 0.5, 0.5);
    float _127 = fma(_125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _129 = sqrt(_123);
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _133 = _131 + 1.0;
    float _135 = fma(_125, _127, -0.212114393711090087890625);
    float _137 = fma(_125, _135, 1.570728778839111328125);
    float _139 = _129 * 0.636619746685028076171875;
    float _141 = -_137;
    float _143 = fma(_139, _141, 1.0);
    float _145 = -_69;
    float _147 = fma(_145, _111, 1.0);
    float _149 = 1.0 / _147;
    float _151 = _149 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[7].x, _153);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = abs(_161);
    float _165 = log2(_163);
    float _167 = _165 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _169 = exp2(_167);
    float _171 = fma(_169, _133, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _173 = fma(_171, 0.5, 0.5);
    float2 _641 = float2(_65, _67);
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float2 _657 = float2(_143, _173);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_657, float2(0.0), isnan(_657))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _165 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _200 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = exp2(_196);
    float _206 = -_202;
    float _208 = _206 + 1.0;
    float _210 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _212 = abs(_208);
    float _214 = log2(_212);
    float _216 = -_204;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _222 = exp2(_220);
    float _224 = -_222;
    float _226 = fma(_210, _224, _210);
    float _228 = -_178;
    float _230 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].x, _228);
    float _232 = -_182;
    float _234 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _232);
    float _236 = fma(_218, _230, _178);
    float _238 = fma(_218, _234, _182);
    float _240 = -_236;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _244 = fma(_226, _242, _236);
    float _246 = -_180;
    float _248 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].x, _246);
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _252 = fma(_218, _248, _180);
    float _254 = -_252;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _260 = _250 >= 1.41299998760223388671875;
    bool _262 = isnan(_250);
    bool _264 = _260 || _262;
    bool _266 = isnan(1.41299998760223388671875);
    bool _268 = _264 || _266;
    float _270 = fma(_226, _256, _252);
    float _272 = -_238;
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _278 = fma(_226, _274, _238);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _282 = _276 >= 1.41299998760223388671875;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan(1.41299998760223388671875);
    bool _290 = _286 || _288;
    float _292 = _192;
    float _294 = _204;
    float _296 = _220;
    int _299 = as_type<int>(_182);
    float _301 = _210;
    float _303 = _214;
    float _305 = _218;
    float _307 = _250;
    int _309 = as_type<int>(_280);
    int _311 = as_type<int>(_276);
    if (!_268)
    {
        float _313 = _250 * 0.38317000865936279296875;
        _292 = _313;
    }
    float _315 = _292;
    if (_268)
    {
        float _317 = _250 * (-1.44269502162933349609375);
        _294 = _317;
    }
    float _319 = _294;
    bool _321 = _280 >= 1.41299998760223388671875;
    bool _323 = isnan(_280);
    bool _325 = _321 || _323;
    bool _327 = isnan(1.41299998760223388671875);
    bool _329 = _325 || _327;
    float _331 = _319;
    if (_268)
    {
        float _333 = exp2(_319);
        _296 = _333;
    }
    float _335 = _296;
    if (!_290)
    {
        float _337 = _276 * 0.38317000865936279296875;
        _299 = as_type<int>(_337);
    }
    int _339 = _299;
    float _341 = _315;
    if (!_268)
    {
        float _343 = abs(_315);
        float _345 = log2(_343);
        _341 = _345;
    }
    float _347 = _341;
    if (_290)
    {
        float _349 = _276 * (-1.44269502162933349609375);
        _301 = _349;
    }
    float _351 = _301;
    if (!_329)
    {
        float _353 = _280 * 0.38317000865936279296875;
        _303 = _353;
    }
    float _355 = _303;
    if (_329)
    {
        float _357 = _280 * (-1.44269502162933349609375);
        _305 = _357;
    }
    float _359 = _305;
    int _361 = _339;
    if (!_290)
    {
        float _363 = abs(as_type<float>(_339));
        float _365 = log2(_363);
        _361 = as_type<int>(_365);
    }
    int _367 = _361;
    float _369 = _355;
    if (!_329)
    {
        float _371 = abs(_355);
        float _373 = log2(_371);
        _369 = _373;
    }
    float _375 = _369;
    float _377 = _347;
    if (!_268)
    {
        float _379 = _347 * 0.4545454680919647216796875;
        _307 = _379;
    }
    float _381 = _307;
    int _383 = _367;
    if (!_290)
    {
        float _385 = as_type<float>(_367) * 0.4545454680919647216796875;
        _377 = _385;
    }
    float _387 = _377;
    float _389 = _351;
    if (_290)
    {
        float _391 = exp2(_351);
        _389 = _391;
    }
    float _393 = _389;
    if (!_329)
    {
        float _395 = _375 * 0.4545454680919647216796875;
        _331 = _395;
    }
    float _397 = _331;
    float _399 = _359;
    if (_329)
    {
        float _401 = exp2(_359);
        _399 = _401;
    }
    float _403 = _399;
    if (!_268)
    {
        float _405 = exp2(_381);
        _309 = as_type<int>(_405);
    }
    int _407 = _309;
    int _409 = _407;
    if (!_290)
    {
        float _411 = exp2(_387);
        _311 = as_type<int>(_411);
    }
    int _413 = _311;
    int _415 = _413;
    if (!_329)
    {
        float _417 = exp2(_397);
        _383 = as_type<int>(_417);
    }
    int _419 = _383;
    int _421 = _419;
    if (_268)
    {
        float _423 = -_335;
        float _425 = _423 + 1.0;
        _409 = as_type<int>(_425);
    }
    int _427 = _409;
    if (_290)
    {
        float _429 = -_393;
        float _431 = _429 + 1.0;
        _415 = as_type<int>(_431);
    }
    int _433 = _415;
    if (_329)
    {
        float _435 = -_403;
        float _437 = _435 + 1.0;
        _421 = as_type<int>(_437);
    }
    int _439 = _421;
    out.m_42.x = as_type<float>(_427);
    out.m_42.y = as_type<float>(_433);
    out.m_42.z = as_type<float>(_439);
    out.m_42.w = _184;
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
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _473 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_473, float2(0.0), isnan(_473))).x;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = _63 * _87;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _89 * _89;
    float _103 = fma(_93, _93, _101);
    float _105 = fma(_91, _91, _103);
    float _107 = rsqrt(_105);
    float _109 = _89 * _107;
    float _111 = _63 * _99;
    float _113 = _93 * _107;
    float _115 = _91 * _107;
    float _117 = _109 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _119 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[2].x, _117);
    float _121 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[2].z, _119);
    float _123 = fma(_121, -0.5, 0.5);
    float _125 = fma(_121, 0.5, 0.5);
    float _127 = fma(_125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _129 = sqrt(_123);
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _133 = _131 + 1.0;
    float _135 = fma(_125, _127, -0.212114393711090087890625);
    float _137 = fma(_125, _135, 1.570728778839111328125);
    float _139 = _129 * 0.636619746685028076171875;
    float _141 = -_137;
    float _143 = fma(_139, _141, 1.0);
    float _145 = -_69;
    float _147 = fma(_145, _111, 1.0);
    float _149 = 1.0 / _147;
    float _151 = _149 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[7].x, _153);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = abs(_161);
    float _165 = log2(_163);
    float _167 = _165 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _169 = exp2(_167);
    float _171 = fma(_169, _133, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _173 = fma(_171, 0.5, 0.5);
    float2 _641 = float2(_65, _67);
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float2 _657 = float2(_143, _173);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_657, float2(0.0), isnan(_657))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _165 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _200 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = exp2(_196);
    float _206 = -_202;
    float _208 = _206 + 1.0;
    float _210 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _212 = abs(_208);
    float _214 = log2(_212);
    float _216 = -_204;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _222 = exp2(_220);
    float _224 = -_222;
    float _226 = fma(_210, _224, _210);
    float _228 = -_178;
    float _230 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].x, _228);
    float _232 = -_182;
    float _234 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _232);
    float _236 = fma(_218, _230, _178);
    float _238 = fma(_218, _234, _182);
    float _240 = -_236;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _244 = fma(_226, _242, _236);
    float _246 = -_180;
    float _248 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].x, _246);
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _252 = fma(_218, _248, _180);
    float _254 = -_252;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _260 = _250 >= 1.41299998760223388671875;
    bool _262 = isnan(_250);
    bool _264 = _260 || _262;
    bool _266 = isnan(1.41299998760223388671875);
    bool _268 = _264 || _266;
    float _270 = fma(_226, _256, _252);
    float _272 = -_238;
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _278 = fma(_226, _274, _238);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _282 = _276 >= 1.41299998760223388671875;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan(1.41299998760223388671875);
    bool _290 = _286 || _288;
    float _292 = _192;
    float _294 = _204;
    float _296 = _220;
    int _299 = as_type<int>(_182);
    float _301 = _210;
    float _303 = _214;
    float _305 = _218;
    float _307 = _250;
    int _309 = as_type<int>(_280);
    int _311 = as_type<int>(_276);
    if (!_268)
    {
        float _313 = _250 * 0.38317000865936279296875;
        _292 = _313;
    }
    float _315 = _292;
    if (_268)
    {
        float _317 = _250 * (-1.44269502162933349609375);
        _294 = _317;
    }
    float _319 = _294;
    bool _321 = _280 >= 1.41299998760223388671875;
    bool _323 = isnan(_280);
    bool _325 = _321 || _323;
    bool _327 = isnan(1.41299998760223388671875);
    bool _329 = _325 || _327;
    float _331 = _319;
    if (_268)
    {
        float _333 = exp2(_319);
        _296 = _333;
    }
    float _335 = _296;
    if (!_290)
    {
        float _337 = _276 * 0.38317000865936279296875;
        _299 = as_type<int>(_337);
    }
    int _339 = _299;
    float _341 = _315;
    if (!_268)
    {
        float _343 = abs(_315);
        float _345 = log2(_343);
        _341 = _345;
    }
    float _347 = _341;
    if (_290)
    {
        float _349 = _276 * (-1.44269502162933349609375);
        _301 = _349;
    }
    float _351 = _301;
    if (!_329)
    {
        float _353 = _280 * 0.38317000865936279296875;
        _303 = _353;
    }
    float _355 = _303;
    if (_329)
    {
        float _357 = _280 * (-1.44269502162933349609375);
        _305 = _357;
    }
    float _359 = _305;
    int _361 = _339;
    if (!_290)
    {
        float _363 = abs(as_type<float>(_339));
        float _365 = log2(_363);
        _361 = as_type<int>(_365);
    }
    int _367 = _361;
    float _369 = _355;
    if (!_329)
    {
        float _371 = abs(_355);
        float _373 = log2(_371);
        _369 = _373;
    }
    float _375 = _369;
    float _377 = _347;
    if (!_268)
    {
        float _379 = _347 * 0.4545454680919647216796875;
        _307 = _379;
    }
    float _381 = _307;
    int _383 = _367;
    if (!_290)
    {
        float _385 = as_type<float>(_367) * 0.4545454680919647216796875;
        _377 = _385;
    }
    float _387 = _377;
    float _389 = _351;
    if (_290)
    {
        float _391 = exp2(_351);
        _389 = _391;
    }
    float _393 = _389;
    if (!_329)
    {
        float _395 = _375 * 0.4545454680919647216796875;
        _331 = _395;
    }
    float _397 = _331;
    float _399 = _359;
    if (_329)
    {
        float _401 = exp2(_359);
        _399 = _401;
    }
    float _403 = _399;
    if (!_268)
    {
        float _405 = exp2(_381);
        _309 = as_type<int>(_405);
    }
    int _407 = _309;
    int _409 = _407;
    if (!_290)
    {
        float _411 = exp2(_387);
        _311 = as_type<int>(_411);
    }
    int _413 = _311;
    int _415 = _413;
    if (!_329)
    {
        float _417 = exp2(_397);
        _383 = as_type<int>(_417);
    }
    int _419 = _383;
    int _421 = _419;
    if (_268)
    {
        float _423 = -_335;
        float _425 = _423 + 1.0;
        _409 = as_type<int>(_425);
    }
    int _427 = _409;
    if (_290)
    {
        float _429 = -_393;
        float _431 = _429 + 1.0;
        _415 = as_type<int>(_431);
    }
    int _433 = _415;
    if (_329)
    {
        float _435 = -_403;
        float _437 = _435 + 1.0;
        _421 = as_type<int>(_437);
    }
    int _439 = _421;
    out.m_42.x = as_type<float>(_427);
    out.m_42.y = as_type<float>(_433);
    out.m_42.z = as_type<float>(_439);
    out.m_42.w = _184;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

