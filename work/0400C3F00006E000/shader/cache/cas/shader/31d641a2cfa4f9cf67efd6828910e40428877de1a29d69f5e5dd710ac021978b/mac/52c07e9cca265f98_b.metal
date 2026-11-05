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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _437 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float2 _448 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float2 _456 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_39.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _65 * _90;
    float _106 = _65 * _96;
    float _108 = in.m_41.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _65 * _102;
    float _116 = _104 * _104;
    float _118 = fma(_106, _106, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _104 * _122;
    float _126 = _65 * _112;
    float _128 = _106 * _122;
    float _130 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _132 = _114 * _122;
    float _134 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[2].x, _130);
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c4)._m0[2].z, _134);
    float _138 = -_71;
    float _140 = fma(_138, _126, 1.0);
    float _142 = 1.0 / _140;
    float _144 = fma(_136, 0.5, 0.5);
    float _146 = fma(_144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _148 = fma(_144, _146, -0.212114393711090087890625);
    float _150 = fma(_144, _148, 1.570728778839111328125);
    float _152 = fma(_136, -0.5, 0.5);
    float _154 = _142 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _158 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[7].x, _156);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = sqrt(_152);
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _166 = _164 + 1.0;
    float _168 = -_160;
    float _170 = _168 + 1.0;
    float _172 = abs(_170);
    float _174 = log2(_172);
    float _176 = _162 * 0.636619746685028076171875;
    float _178 = -_150;
    float _180 = fma(_176, _178, 1.0);
    float _182 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _184 = exp2(_182);
    float _186 = fma(_184, _166, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _188 = fma(_186, 0.5, 0.5);
    float2 _629 = float2(_180, _188);
    float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_629, float2(0.0), isnan(_629))).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _202 = exp2(_200);
    float _204 = -_202;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _208 = _73 * _206;
    float _210 = -_78;
    float _212 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _210);
    float _214 = -_82;
    float _216 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = fma(_208, _212, _78);
    float _220 = -_80;
    float _222 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = fma(_208, _216, _82);
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _228 = fma(_208, _222, _80);
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _236 = _226 >= 1.41299998760223388671875;
    bool _238 = isnan(_226);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    bool _246 = _230 >= 1.41299998760223388671875;
    bool _248 = isnan(_230);
    bool _250 = _246 || _248;
    bool _252 = isnan(1.41299998760223388671875);
    bool _254 = _250 || _252;
    bool _256 = _232 >= 1.41299998760223388671875;
    bool _258 = isnan(_232);
    bool _260 = _256 || _258;
    bool _262 = isnan(1.41299998760223388671875);
    bool _264 = _260 || _262;
    int _267 = as_type<int>(_80);
    float _269 = _202;
    float _271 = _224;
    float _273 = _230;
    float _275 = _82;
    float _277 = _184;
    float _279 = _226;
    float _281 = (*spvDescriptorSet0.fp_c3)._m0[8].z;
    int _283 = as_type<int>(_232);
    if (!_244)
    {
        float _285 = _226 * 0.38317000865936279296875;
        _267 = as_type<int>(_285);
    }
    int _287 = _267;
    if (_244)
    {
        float _289 = _226 * (-1.44269502162933349609375);
        _269 = _289;
    }
    float _291 = _269;
    float _293 = _291;
    if (!_254)
    {
        float _295 = _230 * 0.38317000865936279296875;
        _271 = _295;
    }
    float _297 = _271;
    if (_254)
    {
        float _299 = _230 * (-1.44269502162933349609375);
        _273 = _299;
    }
    float _301 = _273;
    if (!_264)
    {
        float _303 = _232 * 0.38317000865936279296875;
        _275 = _303;
    }
    float _305 = _275;
    float _307 = _305;
    if (_264)
    {
        float _309 = _232 * (-1.44269502162933349609375);
        _277 = _309;
    }
    float _311 = _277;
    int _313 = _287;
    if (!_244)
    {
        float _315 = abs(as_type<float>(_287));
        float _317 = log2(_315);
        _313 = as_type<int>(_317);
    }
    int _319 = _313;
    if (!_264)
    {
        float _321 = abs(_305);
        float _323 = log2(_321);
        _307 = _323;
    }
    float _325 = _307;
    float _327 = _297;
    int _329 = as_type<int>(_325);
    if (!_254)
    {
        float _331 = abs(_297);
        float _333 = log2(_331);
        _327 = _333;
    }
    float _335 = _327;
    int _337 = _319;
    if (!_244)
    {
        float _339 = as_type<float>(_319) * 0.4545454680919647216796875;
        _279 = _339;
    }
    float _341 = _279;
    float _343 = _194;
    if (_244)
    {
        float _345 = exp2(_291);
        _343 = _345;
    }
    float _347 = _343;
    if (!_254)
    {
        float _349 = _335 * 0.4545454680919647216796875;
        _281 = _349;
    }
    float _351 = _281;
    if (!_264)
    {
        float _353 = _325 * 0.4545454680919647216796875;
        _293 = _353;
    }
    float _355 = _293;
    float _357 = _311;
    if (_264)
    {
        float _359 = exp2(_311);
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _301;
    if (_254)
    {
        float _365 = exp2(_301);
        _363 = _365;
    }
    float _367 = _363;
    if (!_244)
    {
        float _369 = exp2(_341);
        _283 = as_type<int>(_369);
    }
    int _371 = _283;
    int _373 = _371;
    if (!_264)
    {
        float _375 = exp2(_355);
        _337 = as_type<int>(_375);
    }
    int _377 = _337;
    int _379 = _377;
    if (!_254)
    {
        float _381 = exp2(_351);
        _329 = as_type<int>(_381);
    }
    int _383 = _329;
    int _385 = _383;
    if (_244)
    {
        float _387 = -_347;
        float _389 = _387 + 1.0;
        _373 = as_type<int>(_389);
    }
    int _391 = _373;
    if (_264)
    {
        float _393 = -_361;
        float _395 = _393 + 1.0;
        _379 = as_type<int>(_395);
    }
    int _397 = _379;
    if (_254)
    {
        float _399 = -_367;
        float _401 = _399 + 1.0;
        _385 = as_type<int>(_401);
    }
    int _403 = _385;
    out.m_44.x = as_type<float>(_391);
    out.m_44.y = as_type<float>(_397);
    out.m_44.z = as_type<float>(_403);
    out.m_44.w = _84;
    return out;
}


struct main0_out_u
{
    uint4 m_44 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _437 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float2 _448 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float2 _456 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_39.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _65 * _90;
    float _106 = _65 * _96;
    float _108 = in.m_41.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _65 * _102;
    float _116 = _104 * _104;
    float _118 = fma(_106, _106, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _104 * _122;
    float _126 = _65 * _112;
    float _128 = _106 * _122;
    float _130 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _132 = _114 * _122;
    float _134 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[2].x, _130);
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c4)._m0[2].z, _134);
    float _138 = -_71;
    float _140 = fma(_138, _126, 1.0);
    float _142 = 1.0 / _140;
    float _144 = fma(_136, 0.5, 0.5);
    float _146 = fma(_144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _148 = fma(_144, _146, -0.212114393711090087890625);
    float _150 = fma(_144, _148, 1.570728778839111328125);
    float _152 = fma(_136, -0.5, 0.5);
    float _154 = _142 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _158 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[7].x, _156);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = sqrt(_152);
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _166 = _164 + 1.0;
    float _168 = -_160;
    float _170 = _168 + 1.0;
    float _172 = abs(_170);
    float _174 = log2(_172);
    float _176 = _162 * 0.636619746685028076171875;
    float _178 = -_150;
    float _180 = fma(_176, _178, 1.0);
    float _182 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _184 = exp2(_182);
    float _186 = fma(_184, _166, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _188 = fma(_186, 0.5, 0.5);
    float2 _629 = float2(_180, _188);
    float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_629, float2(0.0), isnan(_629))).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _202 = exp2(_200);
    float _204 = -_202;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _208 = _73 * _206;
    float _210 = -_78;
    float _212 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _210);
    float _214 = -_82;
    float _216 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = fma(_208, _212, _78);
    float _220 = -_80;
    float _222 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = fma(_208, _216, _82);
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _228 = fma(_208, _222, _80);
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _236 = _226 >= 1.41299998760223388671875;
    bool _238 = isnan(_226);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    bool _246 = _230 >= 1.41299998760223388671875;
    bool _248 = isnan(_230);
    bool _250 = _246 || _248;
    bool _252 = isnan(1.41299998760223388671875);
    bool _254 = _250 || _252;
    bool _256 = _232 >= 1.41299998760223388671875;
    bool _258 = isnan(_232);
    bool _260 = _256 || _258;
    bool _262 = isnan(1.41299998760223388671875);
    bool _264 = _260 || _262;
    int _267 = as_type<int>(_80);
    float _269 = _202;
    float _271 = _224;
    float _273 = _230;
    float _275 = _82;
    float _277 = _184;
    float _279 = _226;
    float _281 = (*spvDescriptorSet0.fp_c3)._m0[8].z;
    int _283 = as_type<int>(_232);
    if (!_244)
    {
        float _285 = _226 * 0.38317000865936279296875;
        _267 = as_type<int>(_285);
    }
    int _287 = _267;
    if (_244)
    {
        float _289 = _226 * (-1.44269502162933349609375);
        _269 = _289;
    }
    float _291 = _269;
    float _293 = _291;
    if (!_254)
    {
        float _295 = _230 * 0.38317000865936279296875;
        _271 = _295;
    }
    float _297 = _271;
    if (_254)
    {
        float _299 = _230 * (-1.44269502162933349609375);
        _273 = _299;
    }
    float _301 = _273;
    if (!_264)
    {
        float _303 = _232 * 0.38317000865936279296875;
        _275 = _303;
    }
    float _305 = _275;
    float _307 = _305;
    if (_264)
    {
        float _309 = _232 * (-1.44269502162933349609375);
        _277 = _309;
    }
    float _311 = _277;
    int _313 = _287;
    if (!_244)
    {
        float _315 = abs(as_type<float>(_287));
        float _317 = log2(_315);
        _313 = as_type<int>(_317);
    }
    int _319 = _313;
    if (!_264)
    {
        float _321 = abs(_305);
        float _323 = log2(_321);
        _307 = _323;
    }
    float _325 = _307;
    float _327 = _297;
    int _329 = as_type<int>(_325);
    if (!_254)
    {
        float _331 = abs(_297);
        float _333 = log2(_331);
        _327 = _333;
    }
    float _335 = _327;
    int _337 = _319;
    if (!_244)
    {
        float _339 = as_type<float>(_319) * 0.4545454680919647216796875;
        _279 = _339;
    }
    float _341 = _279;
    float _343 = _194;
    if (_244)
    {
        float _345 = exp2(_291);
        _343 = _345;
    }
    float _347 = _343;
    if (!_254)
    {
        float _349 = _335 * 0.4545454680919647216796875;
        _281 = _349;
    }
    float _351 = _281;
    if (!_264)
    {
        float _353 = _325 * 0.4545454680919647216796875;
        _293 = _353;
    }
    float _355 = _293;
    float _357 = _311;
    if (_264)
    {
        float _359 = exp2(_311);
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _301;
    if (_254)
    {
        float _365 = exp2(_301);
        _363 = _365;
    }
    float _367 = _363;
    if (!_244)
    {
        float _369 = exp2(_341);
        _283 = as_type<int>(_369);
    }
    int _371 = _283;
    int _373 = _371;
    if (!_264)
    {
        float _375 = exp2(_355);
        _337 = as_type<int>(_375);
    }
    int _377 = _337;
    int _379 = _377;
    if (!_254)
    {
        float _381 = exp2(_351);
        _329 = as_type<int>(_381);
    }
    int _383 = _329;
    int _385 = _383;
    if (_244)
    {
        float _387 = -_347;
        float _389 = _387 + 1.0;
        _373 = as_type<int>(_389);
    }
    int _391 = _373;
    if (_264)
    {
        float _393 = -_361;
        float _395 = _393 + 1.0;
        _379 = as_type<int>(_395);
    }
    int _397 = _379;
    if (_254)
    {
        float _399 = -_367;
        float _401 = _399 + 1.0;
        _385 = as_type<int>(_401);
    }
    int _403 = _385;
    out.m_44.x = as_type<float>(_391);
    out.m_44.y = as_type<float>(_397);
    out.m_44.z = as_type<float>(_403);
    out.m_44.w = _84;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

