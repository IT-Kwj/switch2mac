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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_65 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_58 [[user(locn9), flat]];
    float4 m_52 [[user(locn10), flat]];
    float4 m_62 [[user(locn11)]];
    float4 m_60 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
    float4 m_50 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_46.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = 1.0 / _82;
    float _110 = _108 * _88;
    float _112 = _108 * _94;
    float _114 = _108 * _100;
    float _116 = _108 * _106;
    float2 _721 = float2(_110, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_721, float2(0.0), isnan(_721))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_721, float2(0.0), isnan(_721))).w;
    float2 _732 = float2(_112, _114);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_732, float2(0.0), isnan(_732))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_732, float2(0.0), isnan(_732))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_48.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_48.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_50.y;
    float _145 = in.m_50.x;
    float _147 = in.m_48.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_50.z;
    float _155 = in.m_52.x;
    float _157 = in.m_54.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_56.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_58.x;
    float _171 = in.m_60.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = _108 * _135;
    float _179 = _108 * _141;
    float _181 = -_143;
    float _183 = _177 + _181;
    float _185 = -_145;
    float _187 = _179 + _185;
    float _189 = _108 * _151;
    float _191 = _155 * 0.5;
    float _193 = _183 * _183;
    float _195 = _155 * (-0.20000000298023223876953125);
    float _197 = -_153;
    float _199 = _189 + _197;
    float _201 = _155 * 0.300000011920928955078125;
    float _203 = fma(_187, _187, _193);
    float _205 = precise::max(_183, _195);
    float _207 = -_195;
    float _209 = _207 + _201;
    float _211 = fma(_199, _199, _203);
    float _213 = _155 * 0.20000000298023223876953125;
    float _215 = precise::min(_201, _205);
    float _217 = 1.0 / _209;
    float _219 = -_213;
    float _221 = _219 + _191;
    float _223 = -_195;
    float _225 = _223 + _215;
    float _227 = sqrt(_211);
    float _229 = 1.0 / _221;
    float _231 = precise::max(_213, _227);
    float _233 = _225 * _217;
    float _235 = precise::min(_191, _231);
    float _237 = -_213;
    float _239 = _237 + _235;
    float _241 = _239 * _229;
    float _243 = _108 * _161;
    float _245 = _241 * _233;
    float _247 = in.m_62.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _108 * _251;
    float _255 = -_243;
    float _257 = fma(_129, _118, _255);
    float _259 = -_245;
    float _261 = _259 + 1.0;
    float _263 = _108 * _167;
    float _265 = fma(_245, _169, _261);
    float _267 = _263 * _257;
    float _269 = _267 * _265;
    float _271 = _108 * _175;
    float _273 = 0.0 + _269;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _275 * _271;
    bool _281 = _277 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _283 = isnan(_277);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _289 = _285 || _287;
    float _291 = in.m_62.w;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    if (!_289)
    {
        discard_fragment();
    }
    float _297 = in.m_62.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _108 * _295;
    float _305 = 1.0 / _303;
    float _307 = _108 * _301;
    float _309 = _253 * _305;
    float _311 = _307 * _305;
    float2 _991 = float2(_311, _309);
    float _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_991, float2(0.0), isnan(_991))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_991, float2(0.0), isnan(_991))).x;
    float _315 = in.m_56.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_56.x;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_56.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_54.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_54.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_54.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = -_123;
    float _353 = _351 + 1.0;
    float _355 = -_127;
    float _357 = _355 + 1.0;
    float _359 = -_125;
    float _361 = _359 + 1.0;
    float _363 = _108 * _319;
    float _365 = _108 * _325;
    float _367 = _108 * _331;
    float _369 = _363 * _361;
    float _371 = _365 * _353;
    float _373 = _367 * _357;
    float _375 = _108 * _337;
    float _377 = _108 * _343;
    float _379 = _108 * _349;
    float _381 = fma(_123, _375, _371);
    float _383 = fma(_125, _377, _369);
    float _385 = fma(_127, _379, _373);
    if (!_289)
    {
        out.m_65.x = _381;
        out.m_65.y = _383;
        out.m_65.z = _385;
        out.m_65.w = _269;
        return out;
    }
    float _387 = in.m_67.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_67.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_67.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_69.x;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _108 * _391;
    float _413 = _108 * _397;
    float _415 = _108 * _403;
    float _417 = _108 * _409;
    float _419 = _411 * _411;
    float _421 = fma(_413, _413, _419);
    float _423 = precise::min(_417, 1.0);
    float _425 = fma(_415, _415, _421);
    float _427 = rsqrt(_425);
    float _429 = _413 * _427;
    float _431 = _411 * _427;
    float _433 = _415 * _427;
    float _435 = abs(_429);
    float _437 = abs(_431);
    float _439 = precise::max(_435, _437);
    float _441 = abs(_433);
    float _443 = precise::max(_441, _439);
    float _445 = 1.0 / _443;
    float _447 = -_445;
    float _449 = _433 * _447;
    float _451 = _429 * _445;
    float _453 = _431 * _445;
    float3 _1195 = float3(_451, _453, _449);
    float3 _457 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1195, float3(0.0), isnan(_1195)), level(_423)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1195, float3(0.0), isnan(_1195)), level(_423)).xyz;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = in.m_62.z;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_71.w;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_71.y;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_71.z;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_73.y;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _497 = fma(_313, (*spvDescriptorSet0.fp_c8)._m0[30].w, _495);
    float _499 = in.m_73.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_75.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_75.w;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_75.z;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = 1.0 / _497;
    float _525 = _108 * _469;
    float _527 = _525 * _305;
    float _529 = _155 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _531 = in.m_73.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_71.x;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _545 = fma(_527, (*spvDescriptorSet0.fp_c8)._m0[30].w, _543);
    float _547 = -_211;
    float _549 = fma(_529, _529, _547);
    float _551 = _108 * _487;
    float _553 = _108 * _493;
    float _555 = 1.0 / _545;
    float _557 = _108 * _503;
    float _559 = precise::max(0.0, _549);
    float _561 = _108 * _509;
    float _563 = sqrt(_559);
    float _565 = _108 * _481;
    float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _569 = _555 * _567;
    float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _573 = -_569;
    float _575 = fma(_523, _571, _573);
    float _577 = _563 + _575;
    float _579 = _108 * _475;
    float _581 = _108 * _535;
    float _583 = in.m_75.y;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = _108 * _541;
    float _591 = -_579;
    float _593 = _591 + _577;
    float _595 = _108 * _515;
    float _597 = _593 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _599 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _601 = _597 * (-1.44269502162933349609375);
    float _603 = exp2(_601);
    float _605 = _569;
    if (_599)
    {
        float _607 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _609 = _569 + _607;
        _605 = _609;
    }
    float _611 = _605;
    float _613 = _611;
    if (_599)
    {
        float _615 = _611 * 8.0;
        float _617 = precise::clamp(_615, 0.0, 1.0);
        _613 = _617;
    }
    float _619 = _613;
    float _621 = -_603;
    float _623 = _621 + 1.0;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    float _627 = _108 * _587;
    float _629 = _108 * _521;
    float _631 = _277 * _625;
    float _633 = precise::clamp(_631, 0.0, 1.0);
    float _635 = _633;
    if (_599)
    {
        float _637 = _633 * _619;
        _635 = _637;
    }
    float _639 = _635;
    float _641 = 0.0 + _639;
    float _643 = precise::clamp(_641, 0.0, 1.0);
    float _645 = fma(_459, 0.20999999344348907470703125, _589);
    float _647 = fma(_461, 0.20999999344348907470703125, _565);
    float _649 = fma(_463, 0.20999999344348907470703125, _551);
    float _651 = _645 + _581;
    float _653 = _647 + _553;
    float _655 = _649 + _557;
    float _657 = _381 * _651;
    float _659 = _383 * _653;
    float _661 = _385 * _655;
    float _663 = fma(_657, _595, _561);
    float _665 = fma(_659, _595, _627);
    float _667 = fma(_661, _595, _629);
    out.m_65.x = _663;
    out.m_65.y = _665;
    out.m_65.z = _667;
    out.m_65.w = _643;
    return out;
}

