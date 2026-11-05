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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _600;
    _600.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_90, _92));
    _600.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_90, _92));
    float _94 = _600.x;
    float _96 = _94 * 256.0;
    int _99 = int(_96);
    float _101 = in.m_42.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_42.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_42.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _88 * _105;
    float _121 = _88 * _111;
    float _123 = _88 * _117;
    float _125 = 1.0 / _119;
    float _127 = _121 * _125;
    float _129 = _123 * _125;
    float2 _648 = float2(_129, _127);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_648, float2(0.0), isnan(_648))).x;
    float _133 = float(uint(_99));
    float _135 = _133 * 0.00390625;
    float _137 = precise::min(_135, 2.0);
    float2 _669 = float2(_90, _92);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_669, float2(0.0), isnan(_669)), level(_137)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_669, float2(0.0), isnan(_669)), level(_137)).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float _150 = in.m_42.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_44.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_46.w;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_48.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _88 * _154;
    float _176 = _88 * _160;
    float _178 = _88 * _166;
    float _180 = _174 * _125;
    float _182 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_180, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _190 = fma(_131, (*spvDescriptorSet0.fp_c8)._m0[30].w, _188);
    float _192 = 1.0 / _186;
    float _194 = 1.0 / _190;
    float _196 = in.m_46.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_50.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_50.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_44.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_44.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_44.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _88 * _206;
    float _234 = _148 * _176;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _238 = _192 * _236;
    float _240 = _88 * _172;
    float _242 = _178 * _234;
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _246 = -_238;
    float _248 = fma(_194, _244, _246);
    float _250 = 0.0 + _242;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _248 * _182;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _252 * _256;
    float _260 = _258 * _240;
    bool _263 = _260 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _265 = isnan(_260);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _271 = _267 || _269;
    float _273 = in.m_46.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_50.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_46.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    if (!_271)
    {
        discard_fragment();
    }
    float _291 = _88 * _277;
    float _293 = _88 * _283;
    float _295 = _88 * _200;
    float _297 = _88 * _289;
    float _299 = _88 * _212;
    float _301 = -_293;
    float _303 = _291 + _301;
    float _305 = -_232;
    float _307 = _295 + _305;
    float _309 = -_299;
    float _311 = _297 + _309;
    float _313 = fma(_142, _303, _293);
    float _315 = fma(_144, _307, _232);
    float _317 = _88 * _218;
    float _319 = fma(_146, _311, _299);
    float _321 = _88 * _224;
    float _323 = _88 * _230;
    float _325 = _313 * _317;
    float _327 = _315 * _321;
    float _329 = _319 * _323;
    if (!_271)
    {
        out.m_53.x = _325;
        out.m_53.y = _327;
        out.m_53.z = _329;
        out.m_53.w = _242;
        return out;
    }
    float _331 = in.m_55.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _339 = in.m_55.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_55.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_61.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = _88 * _335;
    bool _359 = as_type<int>(_337) != 0;
    float _361 = _88 * _343;
    bool _363 = !_359;
    float _365 = -_357;
    float _367 = _363 ? _365 : _357;
    float _369 = _88 * _349;
    bool _371 = !_359;
    float _373 = -_361;
    float _375 = _371 ? _373 : _361;
    float _377 = _367 * _367;
    bool _379 = !_359;
    float _381 = -_369;
    float _383 = _379 ? _381 : _369;
    float _385 = fma(_375, _375, _377);
    float _387 = fma(_383, _383, _385);
    float _389 = rsqrt(_387);
    float _391 = _375 * _389;
    float _393 = _367 * _389;
    float _395 = _383 * _389;
    float _397 = abs(_391);
    float _399 = abs(_393);
    float _401 = precise::max(_397, _399);
    float _403 = abs(_395);
    float _405 = precise::max(_403, _401);
    float _407 = _88 * _355;
    float _409 = 1.0 / _405;
    float _411 = precise::min(_407, 1.0);
    float _413 = _393 * _409;
    float _415 = -_409;
    float _417 = _395 * _415;
    float _419 = _391 * _409;
    float3 _1072 = float3(_419, _413, _417);
    float3 _423 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1072, float3(0.0), isnan(_1072)), level(_411)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1072, float3(0.0), isnan(_1072)), level(_411)).xyz;
    float _425 = _423.x;
    float _427 = _423.y;
    float _429 = _423.z;
    float _431 = in.m_63.x;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_63.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_63.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_65.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_65.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_65.y;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_67.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_67.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_67.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_67.w;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    bool _491 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _493 = _88 * _435;
    float _495 = _88 * _447;
    float _497 = _88 * _453;
    float _499 = _88 * _459;
    float _501 = _88 * _465;
    float _503 = _88 * _477;
    float _505 = _88 * _483;
    float _507 = fma(_425, 0.20999999344348907470703125, _493);
    float _509 = _88 * _441;
    float _511 = fma(_427, 0.20999999344348907470703125, _495);
    float _513 = _88 * _471;
    float _515 = _507 + _499;
    float _517 = fma(_429, 0.20999999344348907470703125, _509);
    float _519 = _509;
    if (_491)
    {
        float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _523 = _238 + _521;
        _519 = _523;
    }
    float _525 = _519;
    float _527 = _511 + _501;
    float _529 = _88 * _489;
    float _531 = _517 + _497;
    float _533 = 0.0 + _260;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    float _537 = _525;
    float _539 = _535;
    if (_491)
    {
        float _541 = _525 * 8.0;
        float _543 = precise::clamp(_541, 0.0, 1.0);
        _537 = _543;
    }
    float _545 = _537;
    float _547 = _325 * _515;
    float _549 = _327 * _527;
    float _551 = _329 * _531;
    if (_491)
    {
        float _553 = _535 * _545;
        _539 = _553;
    }
    float _555 = _539;
    float _557 = fma(_547, _529, _513);
    float _559 = fma(_549, _529, _503);
    float _561 = fma(_551, _529, _505);
    float _563 = 0.0 + _555;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    out.m_53.x = _557;
    out.m_53.y = _559;
    out.m_53.z = _561;
    out.m_53.w = _565;
    return out;
}

