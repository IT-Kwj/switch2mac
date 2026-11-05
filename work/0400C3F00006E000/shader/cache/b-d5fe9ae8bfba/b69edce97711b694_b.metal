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
    float2 _431 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_431, float2(0.0), isnan(_431))).x;
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
    float _123 = fma(_121, 0.5, 0.5);
    float _125 = fma(_123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _127 = fma(_123, _125, -0.212114393711090087890625);
    float _129 = fma(_123, _127, 1.570728778839111328125);
    float _131 = -_69;
    float _133 = fma(_131, _111, 1.0);
    float _135 = 1.0 / _133;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _137 + 1.0;
    float _141 = _135 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[7].x, _143);
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = fma(_121, -0.5, 0.5);
    float _151 = -_147;
    float _153 = _151 + 1.0;
    float _155 = sqrt(_149);
    float _157 = abs(_153);
    float _159 = log2(_157);
    float _161 = _155 * 0.636619746685028076171875;
    float _163 = -_129;
    float _165 = fma(_161, _163, 1.0);
    float _167 = _159 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _169 = exp2(_167);
    float2 _592 = float2(_65, _67);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_592, float2(0.0), isnan(_592))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float _182 = fma(_169, _139, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _184 = fma(_182, 0.5, 0.5);
    float2 _615 = float2(_165, _184);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_615, float2(0.0), isnan(_615))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _159 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _198 = exp2(_196);
    float _200 = -_198;
    float _202 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _204 = -_174;
    float _206 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = -_178;
    float _210 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = fma(_202, _206, _174);
    float _214 = -_176;
    float _216 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = fma(_202, _210, _178);
    float _220 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _222 = fma(_202, _216, _176);
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _226 = _222 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _230 = _220 >= 1.41299998760223388671875;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.41299998760223388671875);
    bool _238 = _234 || _236;
    bool _240 = _224 >= 1.41299998760223388671875;
    bool _242 = isnan(_224);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.41299998760223388671875);
    bool _248 = _244 || _246;
    bool _250 = _226 >= 1.41299998760223388671875;
    bool _252 = isnan(_226);
    bool _254 = _250 || _252;
    bool _256 = isnan(1.41299998760223388671875);
    bool _258 = _254 || _256;
    int _261 = as_type<int>(_176);
    float _263 = _220;
    float _265 = _155;
    float _267 = _192;
    int _269 = as_type<int>(_178);
    float _271 = _184;
    float _273 = _198;
    float _275 = _202;
    int _277 = as_type<int>(_226);
    if (!_238)
    {
        float _279 = _220 * 0.38317000865936279296875;
        _261 = as_type<int>(_279);
    }
    int _281 = _261;
    if (_238)
    {
        float _283 = _220 * (-1.44269502162933349609375);
        _263 = _283;
    }
    float _285 = _263;
    float _287 = _285;
    if (!_248)
    {
        float _289 = _224 * 0.38317000865936279296875;
        _265 = _289;
    }
    float _291 = _265;
    if (_248)
    {
        float _293 = _224 * (-1.44269502162933349609375);
        _267 = _293;
    }
    float _295 = _267;
    if (!_258)
    {
        float _297 = _226 * 0.38317000865936279296875;
        _269 = as_type<int>(_297);
    }
    int _299 = _269;
    if (_258)
    {
        float _301 = _226 * (-1.44269502162933349609375);
        _271 = _301;
    }
    float _303 = _271;
    int _305 = _281;
    if (!_238)
    {
        float _307 = abs(as_type<float>(_281));
        float _309 = log2(_307);
        _305 = as_type<int>(_309);
    }
    int _311 = _305;
    int _313 = _299;
    if (!_258)
    {
        float _315 = abs(as_type<float>(_299));
        float _317 = log2(_315);
        _313 = as_type<int>(_317);
    }
    int _319 = _313;
    float _321 = _291;
    if (!_248)
    {
        float _323 = abs(_291);
        float _325 = log2(_323);
        _321 = _325;
    }
    float _327 = _321;
    int _329 = _311;
    if (!_238)
    {
        float _331 = as_type<float>(_311) * 0.4545454680919647216796875;
        _273 = _331;
    }
    float _333 = _273;
    float _335 = 0.5;
    if (_238)
    {
        float _337 = exp2(_285);
        _335 = _337;
    }
    float _339 = _335;
    int _341 = _319;
    if (!_258)
    {
        float _343 = as_type<float>(_319) * 0.4545454680919647216796875;
        _275 = _343;
    }
    float _345 = _275;
    float _347 = _303;
    if (_258)
    {
        float _349 = exp2(_303);
        _347 = _349;
    }
    float _351 = _347;
    if (!_248)
    {
        float _353 = _327 * 0.4545454680919647216796875;
        _287 = _353;
    }
    float _355 = _287;
    float _357 = _295;
    if (_248)
    {
        float _359 = exp2(_295);
        _357 = _359;
    }
    float _361 = _357;
    if (!_238)
    {
        float _363 = exp2(_333);
        _277 = as_type<int>(_363);
    }
    int _365 = _277;
    int _367 = _365;
    if (!_258)
    {
        float _369 = exp2(_345);
        _329 = as_type<int>(_369);
    }
    int _371 = _329;
    int _373 = _371;
    if (!_248)
    {
        float _375 = exp2(_355);
        _341 = as_type<int>(_375);
    }
    int _377 = _341;
    int _379 = _377;
    if (_238)
    {
        float _381 = -_339;
        float _383 = _381 + 1.0;
        _367 = as_type<int>(_383);
    }
    int _385 = _367;
    if (_258)
    {
        float _387 = -_351;
        float _389 = _387 + 1.0;
        _373 = as_type<int>(_389);
    }
    int _391 = _373;
    if (_248)
    {
        float _393 = -_361;
        float _395 = _393 + 1.0;
        _379 = as_type<int>(_395);
    }
    int _397 = _379;
    out.m_42.x = as_type<float>(_385);
    out.m_42.y = as_type<float>(_391);
    out.m_42.z = as_type<float>(_397);
    out.m_42.w = _180;
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
    float2 _431 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_431, float2(0.0), isnan(_431))).x;
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
    float _123 = fma(_121, 0.5, 0.5);
    float _125 = fma(_123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _127 = fma(_123, _125, -0.212114393711090087890625);
    float _129 = fma(_123, _127, 1.570728778839111328125);
    float _131 = -_69;
    float _133 = fma(_131, _111, 1.0);
    float _135 = 1.0 / _133;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _137 + 1.0;
    float _141 = _135 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[7].x, _143);
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = fma(_121, -0.5, 0.5);
    float _151 = -_147;
    float _153 = _151 + 1.0;
    float _155 = sqrt(_149);
    float _157 = abs(_153);
    float _159 = log2(_157);
    float _161 = _155 * 0.636619746685028076171875;
    float _163 = -_129;
    float _165 = fma(_161, _163, 1.0);
    float _167 = _159 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _169 = exp2(_167);
    float2 _592 = float2(_65, _67);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_592, float2(0.0), isnan(_592))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float _182 = fma(_169, _139, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _184 = fma(_182, 0.5, 0.5);
    float2 _615 = float2(_165, _184);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_615, float2(0.0), isnan(_615))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _159 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _198 = exp2(_196);
    float _200 = -_198;
    float _202 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _204 = -_174;
    float _206 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = -_178;
    float _210 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = fma(_202, _206, _174);
    float _214 = -_176;
    float _216 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = fma(_202, _210, _178);
    float _220 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _222 = fma(_202, _216, _176);
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _226 = _222 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _230 = _220 >= 1.41299998760223388671875;
    bool _232 = isnan(_220);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.41299998760223388671875);
    bool _238 = _234 || _236;
    bool _240 = _224 >= 1.41299998760223388671875;
    bool _242 = isnan(_224);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.41299998760223388671875);
    bool _248 = _244 || _246;
    bool _250 = _226 >= 1.41299998760223388671875;
    bool _252 = isnan(_226);
    bool _254 = _250 || _252;
    bool _256 = isnan(1.41299998760223388671875);
    bool _258 = _254 || _256;
    int _261 = as_type<int>(_176);
    float _263 = _220;
    float _265 = _155;
    float _267 = _192;
    int _269 = as_type<int>(_178);
    float _271 = _184;
    float _273 = _198;
    float _275 = _202;
    int _277 = as_type<int>(_226);
    if (!_238)
    {
        float _279 = _220 * 0.38317000865936279296875;
        _261 = as_type<int>(_279);
    }
    int _281 = _261;
    if (_238)
    {
        float _283 = _220 * (-1.44269502162933349609375);
        _263 = _283;
    }
    float _285 = _263;
    float _287 = _285;
    if (!_248)
    {
        float _289 = _224 * 0.38317000865936279296875;
        _265 = _289;
    }
    float _291 = _265;
    if (_248)
    {
        float _293 = _224 * (-1.44269502162933349609375);
        _267 = _293;
    }
    float _295 = _267;
    if (!_258)
    {
        float _297 = _226 * 0.38317000865936279296875;
        _269 = as_type<int>(_297);
    }
    int _299 = _269;
    if (_258)
    {
        float _301 = _226 * (-1.44269502162933349609375);
        _271 = _301;
    }
    float _303 = _271;
    int _305 = _281;
    if (!_238)
    {
        float _307 = abs(as_type<float>(_281));
        float _309 = log2(_307);
        _305 = as_type<int>(_309);
    }
    int _311 = _305;
    int _313 = _299;
    if (!_258)
    {
        float _315 = abs(as_type<float>(_299));
        float _317 = log2(_315);
        _313 = as_type<int>(_317);
    }
    int _319 = _313;
    float _321 = _291;
    if (!_248)
    {
        float _323 = abs(_291);
        float _325 = log2(_323);
        _321 = _325;
    }
    float _327 = _321;
    int _329 = _311;
    if (!_238)
    {
        float _331 = as_type<float>(_311) * 0.4545454680919647216796875;
        _273 = _331;
    }
    float _333 = _273;
    float _335 = 0.5;
    if (_238)
    {
        float _337 = exp2(_285);
        _335 = _337;
    }
    float _339 = _335;
    int _341 = _319;
    if (!_258)
    {
        float _343 = as_type<float>(_319) * 0.4545454680919647216796875;
        _275 = _343;
    }
    float _345 = _275;
    float _347 = _303;
    if (_258)
    {
        float _349 = exp2(_303);
        _347 = _349;
    }
    float _351 = _347;
    if (!_248)
    {
        float _353 = _327 * 0.4545454680919647216796875;
        _287 = _353;
    }
    float _355 = _287;
    float _357 = _295;
    if (_248)
    {
        float _359 = exp2(_295);
        _357 = _359;
    }
    float _361 = _357;
    if (!_238)
    {
        float _363 = exp2(_333);
        _277 = as_type<int>(_363);
    }
    int _365 = _277;
    int _367 = _365;
    if (!_258)
    {
        float _369 = exp2(_345);
        _329 = as_type<int>(_369);
    }
    int _371 = _329;
    int _373 = _371;
    if (!_248)
    {
        float _375 = exp2(_355);
        _341 = as_type<int>(_375);
    }
    int _377 = _341;
    int _379 = _377;
    if (_238)
    {
        float _381 = -_339;
        float _383 = _381 + 1.0;
        _367 = as_type<int>(_383);
    }
    int _385 = _367;
    if (_258)
    {
        float _387 = -_351;
        float _389 = _387 + 1.0;
        _373 = as_type<int>(_389);
    }
    int _391 = _373;
    if (_248)
    {
        float _393 = -_361;
        float _395 = _393 + 1.0;
        _379 = as_type<int>(_395);
    }
    int _397 = _379;
    out.m_42.x = as_type<float>(_385);
    out.m_42.y = as_type<float>(_391);
    out.m_42.z = as_type<float>(_397);
    out.m_42.w = _180;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

