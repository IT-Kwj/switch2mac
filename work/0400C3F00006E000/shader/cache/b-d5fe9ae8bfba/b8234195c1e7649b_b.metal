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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _47;
    float _81 = _79 * _53;
    float _83 = _79 * _59;
    float _85 = _79 * _65;
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _81 * _93;
    float _97 = _83 * _93;
    float _99 = _85 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _105 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _107 = _79 * _71;
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _103);
    float _111 = fma(_105, 0.5, 0.5);
    float _113 = fma(_109, -0.5, 0.5);
    float _115 = fma(_109, 0.5, 0.5);
    float _117 = fma(_115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _119 = sqrt(_113);
    float _121 = fma(_115, _117, -0.212114393711090087890625);
    float _123 = fma(_115, _121, 1.570728778839111328125);
    float _125 = _119 * 0.636619746685028076171875;
    float _127 = -_123;
    float _129 = fma(_125, _127, 1.0);
    float _131 = _79 * _77;
    float2 _547 = float2(_129, _111);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float2 _566 = float2(_107, _131);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_566, float2(0.0), isnan(_566))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float _154 = 0.0 + _105;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = in.m_37.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = abs(_156);
    float _166 = log2(_164);
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _172 = _166 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _174 = exp2(_172);
    float _176 = fma(_174, _170, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _178 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _180 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].x, _178);
    float _182 = _142 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _188 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = fma(_184, _180, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _192 = fma(_184, _188, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _194 = _190 * _152;
    float _196 = _79 * _162;
    float _198 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _200 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
    float _202 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].y, _194);
    float _204 = _176 * _196;
    float _206 = fma(_184, _200, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _208 = -_202;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _212 = _206 * _152;
    float _214 = _192 * _152;
    float _216 = fma(_204, _210, _202);
    float _218 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].y, _212);
    float _220 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].y, _214);
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _224 = -_218;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _230 = _222 >= 1.41299998760223388671875;
    bool _232 = isnan(_222);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.41299998760223388671875);
    bool _238 = _234 || _236;
    float _240 = fma(_204, _226, _218);
    float _242 = -_220;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _248 = fma(_204, _244, _220);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _252 = _246 >= 1.41299998760223388671875;
    bool _254 = isnan(_246);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = _148;
    float _264 = _184;
    float _266 = _138;
    int _269 = as_type<int>(_220);
    float _271 = _214;
    float _273 = _192;
    float _275 = _196;
    float _277 = _222;
    int _279 = as_type<int>(_250);
    int _281 = as_type<int>(_246);
    if (!_238)
    {
        float _283 = _222 * 0.38317000865936279296875;
        _262 = _283;
    }
    float _285 = _262;
    if (_238)
    {
        float _287 = _222 * (-1.44269502162933349609375);
        _264 = _287;
    }
    float _289 = _264;
    bool _291 = _250 >= 1.41299998760223388671875;
    bool _293 = isnan(_250);
    bool _295 = _291 || _293;
    bool _297 = isnan(1.41299998760223388671875);
    bool _299 = _295 || _297;
    float _301 = _289;
    if (_238)
    {
        float _303 = exp2(_289);
        _266 = _303;
    }
    float _305 = _266;
    if (!_260)
    {
        float _307 = _246 * 0.38317000865936279296875;
        _269 = as_type<int>(_307);
    }
    int _309 = _269;
    if (_260)
    {
        float _311 = _246 * (-1.44269502162933349609375);
        _271 = _311;
    }
    float _313 = _271;
    float _315 = _285;
    if (!_238)
    {
        float _317 = abs(_285);
        float _319 = log2(_317);
        _315 = _319;
    }
    float _321 = _315;
    if (!_299)
    {
        float _323 = _250 * 0.38317000865936279296875;
        _273 = _323;
    }
    float _325 = _273;
    if (_299)
    {
        float _327 = _250 * (-1.44269502162933349609375);
        _275 = _327;
    }
    float _329 = _275;
    int _331 = _309;
    if (!_260)
    {
        float _333 = abs(as_type<float>(_309));
        float _335 = log2(_333);
        _331 = as_type<int>(_335);
    }
    int _337 = _331;
    float _339 = _325;
    if (!_299)
    {
        float _341 = abs(_325);
        float _343 = log2(_341);
        _339 = _343;
    }
    float _345 = _339;
    float _347 = _321;
    if (!_238)
    {
        float _349 = _321 * 0.4545454680919647216796875;
        _277 = _349;
    }
    float _351 = _277;
    int _353 = _337;
    if (!_260)
    {
        float _355 = as_type<float>(_337) * 0.4545454680919647216796875;
        _347 = _355;
    }
    float _357 = _347;
    float _359 = _313;
    if (_260)
    {
        float _361 = exp2(_313);
        _359 = _361;
    }
    float _363 = _359;
    if (!_299)
    {
        float _365 = _345 * 0.4545454680919647216796875;
        _301 = _365;
    }
    float _367 = _301;
    if (!_260)
    {
        float _369 = exp2(_357);
        _279 = as_type<int>(_369);
    }
    int _371 = _279;
    float _373 = _329;
    int _375 = _371;
    if (_299)
    {
        float _377 = exp2(_329);
        _373 = _377;
    }
    float _379 = _373;
    if (!_238)
    {
        float _381 = exp2(_351);
        _281 = as_type<int>(_381);
    }
    int _383 = _281;
    int _385 = _383;
    if (_260)
    {
        float _387 = -_363;
        float _389 = _387 + 1.0;
        _375 = as_type<int>(_389);
    }
    int _391 = _375;
    if (!_299)
    {
        float _393 = exp2(_367);
        _353 = as_type<int>(_393);
    }
    int _395 = _353;
    int _397 = _395;
    if (_238)
    {
        float _399 = -_305;
        float _401 = _399 + 1.0;
        _385 = as_type<int>(_401);
    }
    int _403 = _385;
    if (_299)
    {
        float _405 = -_379;
        float _407 = _405 + 1.0;
        _397 = as_type<int>(_407);
    }
    int _409 = _397;
    out.m_40.x = as_type<float>(_403);
    out.m_40.y = as_type<float>(_391);
    out.m_40.z = as_type<float>(_409);
    out.m_40.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _47;
    float _81 = _79 * _53;
    float _83 = _79 * _59;
    float _85 = _79 * _65;
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _81 * _93;
    float _97 = _83 * _93;
    float _99 = _85 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _105 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _107 = _79 * _71;
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _103);
    float _111 = fma(_105, 0.5, 0.5);
    float _113 = fma(_109, -0.5, 0.5);
    float _115 = fma(_109, 0.5, 0.5);
    float _117 = fma(_115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _119 = sqrt(_113);
    float _121 = fma(_115, _117, -0.212114393711090087890625);
    float _123 = fma(_115, _121, 1.570728778839111328125);
    float _125 = _119 * 0.636619746685028076171875;
    float _127 = -_123;
    float _129 = fma(_125, _127, 1.0);
    float _131 = _79 * _77;
    float2 _547 = float2(_129, _111);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float2 _566 = float2(_107, _131);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_566, float2(0.0), isnan(_566))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float _154 = 0.0 + _105;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = in.m_37.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = abs(_156);
    float _166 = log2(_164);
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _172 = _166 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _174 = exp2(_172);
    float _176 = fma(_174, _170, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _178 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _180 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].x, _178);
    float _182 = _142 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _188 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = fma(_184, _180, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _192 = fma(_184, _188, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _194 = _190 * _152;
    float _196 = _79 * _162;
    float _198 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _200 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
    float _202 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].y, _194);
    float _204 = _176 * _196;
    float _206 = fma(_184, _200, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _208 = -_202;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _212 = _206 * _152;
    float _214 = _192 * _152;
    float _216 = fma(_204, _210, _202);
    float _218 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].y, _212);
    float _220 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].y, _214);
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _224 = -_218;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _230 = _222 >= 1.41299998760223388671875;
    bool _232 = isnan(_222);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.41299998760223388671875);
    bool _238 = _234 || _236;
    float _240 = fma(_204, _226, _218);
    float _242 = -_220;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _248 = fma(_204, _244, _220);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _252 = _246 >= 1.41299998760223388671875;
    bool _254 = isnan(_246);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = _148;
    float _264 = _184;
    float _266 = _138;
    int _269 = as_type<int>(_220);
    float _271 = _214;
    float _273 = _192;
    float _275 = _196;
    float _277 = _222;
    int _279 = as_type<int>(_250);
    int _281 = as_type<int>(_246);
    if (!_238)
    {
        float _283 = _222 * 0.38317000865936279296875;
        _262 = _283;
    }
    float _285 = _262;
    if (_238)
    {
        float _287 = _222 * (-1.44269502162933349609375);
        _264 = _287;
    }
    float _289 = _264;
    bool _291 = _250 >= 1.41299998760223388671875;
    bool _293 = isnan(_250);
    bool _295 = _291 || _293;
    bool _297 = isnan(1.41299998760223388671875);
    bool _299 = _295 || _297;
    float _301 = _289;
    if (_238)
    {
        float _303 = exp2(_289);
        _266 = _303;
    }
    float _305 = _266;
    if (!_260)
    {
        float _307 = _246 * 0.38317000865936279296875;
        _269 = as_type<int>(_307);
    }
    int _309 = _269;
    if (_260)
    {
        float _311 = _246 * (-1.44269502162933349609375);
        _271 = _311;
    }
    float _313 = _271;
    float _315 = _285;
    if (!_238)
    {
        float _317 = abs(_285);
        float _319 = log2(_317);
        _315 = _319;
    }
    float _321 = _315;
    if (!_299)
    {
        float _323 = _250 * 0.38317000865936279296875;
        _273 = _323;
    }
    float _325 = _273;
    if (_299)
    {
        float _327 = _250 * (-1.44269502162933349609375);
        _275 = _327;
    }
    float _329 = _275;
    int _331 = _309;
    if (!_260)
    {
        float _333 = abs(as_type<float>(_309));
        float _335 = log2(_333);
        _331 = as_type<int>(_335);
    }
    int _337 = _331;
    float _339 = _325;
    if (!_299)
    {
        float _341 = abs(_325);
        float _343 = log2(_341);
        _339 = _343;
    }
    float _345 = _339;
    float _347 = _321;
    if (!_238)
    {
        float _349 = _321 * 0.4545454680919647216796875;
        _277 = _349;
    }
    float _351 = _277;
    int _353 = _337;
    if (!_260)
    {
        float _355 = as_type<float>(_337) * 0.4545454680919647216796875;
        _347 = _355;
    }
    float _357 = _347;
    float _359 = _313;
    if (_260)
    {
        float _361 = exp2(_313);
        _359 = _361;
    }
    float _363 = _359;
    if (!_299)
    {
        float _365 = _345 * 0.4545454680919647216796875;
        _301 = _365;
    }
    float _367 = _301;
    if (!_260)
    {
        float _369 = exp2(_357);
        _279 = as_type<int>(_369);
    }
    int _371 = _279;
    float _373 = _329;
    int _375 = _371;
    if (_299)
    {
        float _377 = exp2(_329);
        _373 = _377;
    }
    float _379 = _373;
    if (!_238)
    {
        float _381 = exp2(_351);
        _281 = as_type<int>(_381);
    }
    int _383 = _281;
    int _385 = _383;
    if (_260)
    {
        float _387 = -_363;
        float _389 = _387 + 1.0;
        _375 = as_type<int>(_389);
    }
    int _391 = _375;
    if (!_299)
    {
        float _393 = exp2(_367);
        _353 = as_type<int>(_393);
    }
    int _395 = _353;
    int _397 = _395;
    if (_238)
    {
        float _399 = -_305;
        float _401 = _399 + 1.0;
        _385 = as_type<int>(_401);
    }
    int _403 = _385;
    if (_299)
    {
        float _405 = -_379;
        float _407 = _405 + 1.0;
        _397 = as_type<int>(_407);
    }
    int _409 = _397;
    out.m_40.x = as_type<float>(_403);
    out.m_40.y = as_type<float>(_391);
    out.m_40.z = as_type<float>(_409);
    out.m_40.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

