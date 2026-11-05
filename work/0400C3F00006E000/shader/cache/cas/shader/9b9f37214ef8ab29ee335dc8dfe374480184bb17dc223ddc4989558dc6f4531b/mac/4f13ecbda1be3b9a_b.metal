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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_53 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _76;
    float _92 = _90 * _82;
    float _94 = _90 * _88;
    float2 _744 = float2(_92, _94);
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_744, float2(0.0), isnan(_744))).xyzw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = _97.w;
    float _107 = in.m_44.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_46.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_42.z;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _90 * _111;
    float _127 = _90 * _117;
    float _129 = _90 * _123;
    float _131 = _105 * _125;
    float _133 = 0.0 + _131;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = _135 * _127;
    bool _141 = _137 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _143 = isnan(_137);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _149 = _145 || _147;
    float _151 = in.m_42.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    if (!_149)
    {
        discard_fragment();
    }
    float _157 = _90 * _155;
    float2 _836 = float2(_129, _157);
    float2 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_836, float2(0.0), isnan(_836))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_836, float2(0.0), isnan(_836))).xy;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = in.m_44.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_44.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_48.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_44.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_48.y;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_48.z;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _90 * _171;
    float _205 = _90 * _177;
    float _207 = _90 * _183;
    float _209 = _90 * _189;
    float _211 = _90 * _195;
    float _213 = _90 * _201;
    float _215 = -_207;
    float _217 = _203 + _215;
    float _219 = -_211;
    float _221 = _205 + _219;
    float _223 = -_213;
    float _225 = _209 + _223;
    float _227 = fma(_99, _217, _207);
    float _229 = fma(_101, _221, _211);
    float _231 = fma(_103, _225, _213);
    if (!_149)
    {
        out.m_51.x = _227;
        out.m_51.y = _229;
        out.m_51.z = _231;
        out.m_51.w = _131;
        return out;
    }
    float _233 = in.m_53.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _90 * _237;
    bool _241 = _239 != 1.0;
    bool _243 = isnan(_239);
    bool _245 = _241 || _243;
    bool _247 = isnan(1.0);
    bool _249 = _245 || _247;
    bool _251 = !_249;
    if (!_251)
    {
        float _253 = gl_FragCoord.x;
        float _255 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _257 = _253 / _255;
        float _259 = gl_FragCoord.y;
        float _261 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _263 = _259 / _261;
        float _265 = _239 * 256.0;
        float _267 = trunc(_265);
        int _270 = int(_267);
        uint _273 = uint(int(uint(_270) >> uint(7)));
        int _275 = int(_273) + _270;
        float _277 = trunc(_257);
        int _279 = int(_277);
        float _281 = trunc(_263);
        int _283 = int(_281);
        int _285 = _279 + 2;
        int _287 = _285 >> 1;
        uint _289 = uint(int(uint(_283) >> uint(1)));
        int _291 = _287 ^ int(_289);
        int _293 = _291 << 16;
        int _295 = _293 ^ _287;
        int _297 = 983055 & _295;
        int _299 = _297 << 6;
        int _301 = _299 + _297;
        int _303 = _301 & 13369548;
        uint _305 = uint(int(uint(_303) >> uint(3)));
        int _307 = _303 | int(_305);
        int _309 = _307 & 5570560;
        int _311 = _307 & 85;
        uint _313 = uint(int(uint(_309) >> uint(15)));
        int _315 = int(_313) + _311;
        bool _317 = uint(_275) > uint(_315);
        if (!_317)
        {
            discard_fragment();
        }
        if (!_317)
        {
            out.m_51.x = _227;
            out.m_51.y = _229;
            out.m_51.z = _231;
            out.m_51.w = _137;
            return out;
        }
    }
    float _319 = in.m_55.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_57.z;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_55.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_57.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_55.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_57.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_59.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_59.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_59.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = _165 * _165;
    float _375 = fma(_163, _163, _373);
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = -_377;
    float _381 = _379 + 1.0;
    float _383 = sqrt(_381);
    float _385 = _90 * _323;
    float _387 = _90 * _329;
    float _389 = _90 * _335;
    float _391 = _90 * _341;
    float _393 = _385 * _385;
    float _395 = _90 * _347;
    float _397 = _90 * _353;
    float _399 = _391 * _391;
    float _401 = fma(_389, _389, _393);
    float _403 = _90 * _359;
    float _405 = _90 * _365;
    float _407 = fma(_397, _397, _399);
    float _409 = fma(_395, _395, _401);
    float _411 = _403 * _403;
    float _413 = _90 * _371;
    float _415 = fma(_387, _387, _407);
    float _417 = fma(_405, _405, _411);
    float _419 = rsqrt(_409);
    float _421 = fma(_413, _413, _417);
    float _423 = rsqrt(_415);
    float _425 = rsqrt(_421);
    float _427 = _419 * _165;
    float _429 = _385 * _427;
    float _431 = _423 * _163;
    float _433 = _389 * _427;
    float _435 = fma(_391, _431, _429);
    float _437 = fma(_397, _431, _433);
    float _439 = _425 * _383;
    float _441 = _395 * _427;
    float _443 = fma(_403, _439, _435);
    float _445 = fma(_387, _431, _441);
    float _447 = fma(_405, _439, _437);
    float _449 = in.m_53.x;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = _443 * _443;
    float _457 = fma(_413, _439, _445);
    float _459 = fma(_447, _447, _455);
    float _461 = fma(_457, _457, _459);
    float _463 = rsqrt(_461);
    float _465 = _447 * _463;
    float _467 = _443 * _463;
    float _469 = _457 * _463;
    float _471 = abs(_465);
    float _473 = abs(_467);
    float _475 = precise::max(_471, _473);
    float _477 = abs(_469);
    float _479 = precise::max(_477, _475);
    float _481 = _90 * _453;
    float _483 = 1.0 / _479;
    float _485 = precise::min(_481, 1.0);
    float _487 = _465 * _483;
    float _489 = _467 * _483;
    float _491 = -_483;
    float _493 = _469 * _491;
    float3 _1330 = float3(_487, _489, _493);
    float3 _497 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1330, float3(0.0), isnan(_1330)), level(_485)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1330, float3(0.0), isnan(_1330)), level(_485)).xyz;
    float _499 = _497.x;
    float _501 = _497.y;
    float _503 = _497.z;
    float _505 = in.m_61.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_61.x;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_63.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_61.z;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_63.y;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_63.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_65.x;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_65.y;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_65.z;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_67.x;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_67.w;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_67.y;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_67.z;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _585 = _583 + 1.0;
    float _587 = _90 * _509;
    float _589 = _90 * _515;
    float _591 = _90 * _527;
    float _593 = fma(_587, (*spvDescriptorSet0.fp_c13)._m0[0].y, _585);
    float _595 = fma(_589, (*spvDescriptorSet0.fp_c13)._m0[0].y, _585);
    float _597 = _90 * _539;
    float _599 = fma(_591, (*spvDescriptorSet0.fp_c13)._m0[0].y, _585);
    float _601 = _229 * _593;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = _90 * _521;
    float _607 = _227 * _595;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = _90 * _533;
    float _613 = _231 * _599;
    float _615 = precise::clamp(_613, 0.0, 1.0);
    float _617 = _90 * _545;
    float _619 = _90 * _551;
    float _621 = _90 * _557;
    float _623 = _90 * _563;
    float _625 = _90 * _569;
    float _627 = _90 * _581;
    float _629 = fma(_499, 0.20999999344348907470703125, _605);
    float _631 = fma(_501, 0.20999999344348907470703125, _611);
    float _633 = fma(_503, 0.20999999344348907470703125, _597);
    float _635 = _629 + _617;
    bool _637 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _639 = _631 + _619;
    float _641 = _633 + _621;
    float _643 = _609 * _635;
    float _645 = 0.0 + _137;
    float _647 = precise::clamp(_645, 0.0, 1.0);
    float _649 = _603 * _639;
    float _651 = _615 * _641;
    float _653 = _90 * _575;
    float _655 = fma(_643, _625, _623);
    float _657 = fma(_651, _625, _627);
    float _659 = fma(_649, _625, _653);
    float _661 = _623;
    if (!_637)
    {
        _661 = _647;
    }
    float _663 = _661;
    bool _665 = !_637;
    float _667 = _663;
    if (!_665)
    {
        float _669 = in.m_69.w;
        float _671 = gl_FragCoord.w;
        float _673 = _669 * _671;
        float _675 = in.m_69.z;
        float _677 = gl_FragCoord.w;
        float _679 = _675 * _677;
        float _681 = _90 * _673;
        float _683 = _90 * _679;
        float _685 = 1.0 / _681;
        float _687 = _683 * _685;
        float _689 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _691 = fma(_687, (*spvDescriptorSet0.fp_c8)._m0[30].w, _689);
        float _693 = 1.0 / _691;
        float _695 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _697 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _699 = fma(_693, _695, _697);
        float _701 = _699 * 8.0;
        float _703 = precise::clamp(_701, 0.0, 1.0);
        float _705 = _647 * _703;
        _667 = _705;
    }
    float _707 = _667;
    float _709 = 0.0 + _707;
    float _711 = precise::clamp(_709, 0.0, 1.0);
    out.m_51.x = _655;
    out.m_51.y = _659;
    out.m_51.z = _657;
    out.m_51.w = _711;
    return out;
}

