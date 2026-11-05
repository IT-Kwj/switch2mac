#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_14 [[id(12)]];
    sampler vp_t_tcb_14Smplr [[id(13)]];
    sampler vp_t_tcb_28Smplr_w [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_14Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_88 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_62 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_74 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
    float4 m_64 [[attribute(10)]];
    float4 m_70 [[attribute(11)]];
    float4 m_66 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1750 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_49.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_52.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_125);
        out.gl_Position.z = _2103;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_54.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_139)
    {
        float _145 = float(_109);
        _119 = _145;
    }
    float _147 = _119;
    bool _149 = _143 >= _147;
    bool _151 = !_139;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_52.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    float _163 = as_type<float>(_161);
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_161);
        out.gl_Position.z = _2174;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_56.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = in.m_56.y;
    float _171 = in.m_58.z;
    float _173 = in.m_58.y;
    float _175 = in.m_60.z;
    float _177 = in.m_60.y;
    float _179 = _165 * _165;
    float _181 = in.m_56.x;
    float _183 = _169 * _169;
    float _185 = in.m_58.x;
    float _187 = fma(_171, _171, _179);
    float _189 = in.m_60.x;
    float _191 = fma(_173, _173, _183);
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _191);
    float _197 = sqrt(_193);
    float _199 = in.m_62.x;
    float _201 = in.m_62.y;
    float _203 = in.m_62.z;
    float _205 = sqrt(_195);
    bool _207 = _197 > 0.0;
    bool _209 = _205 > 0.0;
    float _211 = _169 * _201;
    float _213 = _173 * _201;
    float _215 = _177 * _201;
    float _217 = _193;
    float _219 = _213;
    float _221 = _195;
    if (_207)
    {
        float _223 = rsqrt(_193);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = fma(_199, _181, _211);
    float _229 = fma(_199, _185, _213);
    float _231 = fma(_199, _189, _215);
    float _233 = _231;
    if (!_207)
    {
        _219 = 0.0;
    }
    float _235 = _219;
    float _237 = fma(_165, _203, _227);
    float _239 = fma(_171, _203, _229);
    float _241 = fma(_175, _203, _231);
    float _243 = 0.0;
    float _245 = _235;
    if (_209)
    {
        float _247 = rsqrt(_195);
        _243 = _247;
    }
    float _249 = _243;
    if (!_209)
    {
        _163 = 0.0;
    }
    float _251 = _163;
    float _253 = 0.0;
    float _255 = _251;
    if (!_209)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_209)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _225;
    float _267 = _263;
    if (_207)
    {
        float _269 = _225 * 0.001000000047497451305389404296875;
        _233 = _269;
    }
    float _271 = _233;
    if (!_207)
    {
        _221 = 0.0;
    }
    float _273 = _221;
    float _275 = _273;
    if (!_207)
    {
        _265 = 0.0;
    }
    float _277 = _265;
    float _279 = _277;
    if (_207)
    {
        float _281 = _165 * _271;
        _245 = _281;
    }
    float _283 = _245;
    if (_207)
    {
        float _285 = _171 * _271;
        _275 = _285;
    }
    float _287 = _275;
    if (_207)
    {
        float _289 = _175 * _271;
        _279 = _289;
    }
    float _291 = _279;
    if (_209)
    {
        float _293 = _249 * _169;
        _255 = _293;
    }
    float _295 = _255;
    float _297 = _295;
    if (_209)
    {
        float _299 = _249 * _173;
        _261 = _299;
    }
    float _301 = _261;
    float _303 = _301;
    if (_209)
    {
        float _305 = _249 * _177;
        _267 = _305;
    }
    float _307 = _267;
    bool _309 = !_167;
    float _311 = _307;
    float _329;
    if (!_309)
    {
        float _313 = in.m_64.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        float _333 = float(_109);
        float _335 = 1.0 / _333;
        float _337 = _143 * _335;
        _329 = _337;
    }
    _331 = false;
    float _339 = _329;
    float _341 = in.m_49.x;
    float _343 = in.m_49.y;
    float _345 = in.m_49.z;
    float _347 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
    float _349 = in.m_66.x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    float _363 = 1.0 / _353;
    float _365 = in.m_64.x;
    float _367 = 1.0 / _357;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _339 + _369;
    float _373 = _173 * _343;
    float _375 = _177 * _343;
    float _377 = 1.0 / _361;
    float _379 = fma(_185, _341, _373);
    float _381 = fma(_189, _341, _375);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _339 + _383;
    float _387 = _237 * _237;
    float _389 = fma(_171, _345, _379);
    float _391 = fma(_175, _345, _381);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _339 + _393;
    float _397 = _385 * _363;
    float _399 = fma(_239, _239, _387);
    bool _401 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_339);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = abs(_349);
    float _415 = log2(_413);
    float _417 = _395 * _367;
    float _419 = _241 * _347;
    float _421 = fma(_241, _241, _399);
    float _423 = _239 * _347;
    float _425 = _371 * _377;
    float _427 = _419 * _419;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    float _433 = rsqrt(_421);
    float _435 = fma(_423, _423, _427);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _441;
    float _445 = fma(_431, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _447 = fma(_439, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _449 = sqrt(_435);
    float _451 = _415 * 0.5;
    bool _453 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_339);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = fma(_443, _397, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _467 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _469 = isnan(_339);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _483 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _485 = isnan(_339);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -_463;
    float _497 = _495 + 1.0;
    float _499 = exp2(_451);
    float _501 = _239 * _433;
    float _503 = _241 * _433;
    float _505 = _477 * _497;
    float _507 = -_477;
    float _509 = _507 + 1.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_481, _417, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _521 = _449 * 200.0;
    float _523 = fma(_513, _417, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _525 = fma(_517, _417, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _527 = in.m_60.w;
    float _529 = fma(_143, 0.20000000298023223876953125, _521);
    float _531 = _237 * _433;
    float _533 = _411 * _509;
    float _535 = -_411;
    float _537 = _535 + 1.0;
    float _539 = fma(_499, 0.942477881908416748046875, _529);
    float _541 = _531 * _295;
    float _543 = _493 * _537;
    float _545 = fma(_365, 6.283185482025146484375, _539);
    float _547 = fma(_501, _301, _541);
    float _549 = -_493;
    float _551 = _549 + 1.0;
    float _553 = _445 * _543;
    float _555 = _545 * 0.15915493667125701904296875;
    float _557 = fma(_503, _307, _547);
    float _559 = _447 * _543;
    float _561 = _465 * _543;
    float _563 = _555 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].y, _553);
    float _569 = abs(_557);
    bool _571 = _569 > 0.99989998340606689453125;
    float _573 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _575;
    float _579 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _581 = fma(_525, _533, _567);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _583;
    float _587 = in.m_68.x;
    float _589 = in.m_68.y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _591;
    float _595 = fma(_577, _425, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _597 = fma(_585, _425, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _599 = fma(_519, _533, _573);
    float _601 = _343;
    float _603 = _501;
    float _605 = _503;
    if (_571)
    {
        float _607 = _301 + _287;
        _303 = _607;
    }
    float _609 = _303;
    float _611 = _565 * 0.349065840244293212890625;
    if (_571)
    {
        float _613 = _295 + _283;
        _297 = _613;
    }
    float _615 = _297;
    if (_571)
    {
        float _617 = _307 + _291;
        _311 = _617;
    }
    float _619 = _311;
    float _621 = -_609;
    float _623 = _503 * _621;
    float _625 = fma(_593, _425, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _627 = _611 * 0.15915493667125701904296875;
    float _629 = in.m_70.x;
    float _631 = in.m_70.y;
    float _633 = in.m_70.z;
    float _635 = -_619;
    float _637 = _531 * _635;
    float _639 = fma(_523, _533, _579);
    float _641 = -_619;
    float _643 = -_623;
    float _645 = fma(_501, _641, _643);
    float _647 = _627 * 6.283185482025146484375;
    float _649 = cos(_647);
    float _651 = -_615;
    float _653 = -_637;
    float _655 = fma(_503, _651, _653);
    float _657 = -_615;
    float _659 = _501 * _657;
    float _661 = _645 * _645;
    float _663 = fma(_595, _505, _599);
    float _665 = in.m_68.z;
    float _667 = -_609;
    float _669 = -_659;
    float _671 = fma(_531, _667, _669);
    float _673 = fma(_655, _655, _661);
    float _675 = _627 * 6.283185482025146484375;
    float _677 = sin(_675);
    float _679 = fma(_597, _505, _581);
    float _681 = fma(_625, _505, _639);
    float _683 = fma(_671, _671, _673);
    float _685 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _663);
    float _687 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _679);
    float _689 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].z, _681);
    float _691 = rsqrt(_683);
    float _693 = _649 * _589;
    float _695 = in.m_58.w;
    float _697 = _391 + _527;
    float _699 = _687 * _631;
    float _701 = _685 * _629;
    float _703 = _689 * _633;
    float _705 = fma(_677, _587, _693);
    float _707 = _677 * _589;
    float _709 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _715 = -_707;
    float _717 = fma(_649, _587, _715);
    float _719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _665);
    float _721 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _723 = _709 * _713;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _717);
    float _727 = _645 * _691;
    float _729 = _671 * _691;
    float _731 = _655 * _691;
    float _733 = _711 * _725;
    float _735 = _501 * _727;
    float _737 = _723 * _503;
    float _739 = _531 * _729;
    float _741 = _721 * _719;
    float _743 = -_735;
    float _745 = fma(_531, _731, _743);
    float _747 = _723 * _501;
    float _749 = fma(_733, _729, _737);
    float _751 = -_739;
    float _753 = fma(_503, _727, _751);
    float _755 = _389 + _695;
    float _757 = fma(_733, _731, _747);
    float _759 = fma(_741, _745, _749);
    float _761 = _723 * _531;
    float _763 = _503 * _731;
    float _765 = fma(_741, _753, _757);
    float _767 = _697 + _759;
    float _769 = fma(_733, _727, _761);
    float _771 = in.m_72.y;
    float _773 = _755 + _765;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _777 = _767 + _775;
    float _779 = -_763;
    float _781 = fma(_501, _729, _779);
    float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _785 = _773 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_741, _781, _769);
    float _791 = fma(_785, _785, _787);
    float _793 = sqrt(_791);
    float _795 = _343 + _771;
    float _797 = _795 + _789;
    bool _799 = _793 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _801 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _803 = _793 + _801;
    float _805 = _561;
    float _807 = _769;
    float _809 = _733;
    float _811 = _721;
    float _813 = _797;
    if (_799)
    {
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _805 = _815;
    }
    float _817 = _805;
    if (_799)
    {
        float _819 = _797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _819;
    }
    float _821 = _601;
    if (!_799)
    {
        _807 = _767;
    }
    float _823 = _807;
    float _825 = _823;
    if (_799)
    {
        float _827 = rsqrt(_791);
        _809 = _827;
    }
    float _829 = _809;
    float _831 = _817;
    float _833 = _829;
    if (_799)
    {
        float _835 = _803 * _817;
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _837;
    if (_799)
    {
        float _841 = _837 * 0.15915493667125701904296875;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = _803;
    if (_799)
    {
        float _847 = _843 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = _851;
    if (_799)
    {
        float _855 = fma(_851, _821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _811 = _855;
    }
    float _857 = _811;
    if (!_799)
    {
        _853 = _773;
    }
    float _859 = _853;
    float _861 = _859;
    if (_799)
    {
        float _863 = _829 * _857;
        _833 = _863;
    }
    float _865 = _833;
    if (_799)
    {
        float _867 = fma(_785, _865, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _861 = _867;
    }
    float _869 = _861;
    if (_799)
    {
        float _871 = fma(_777, _865, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _825 = _871;
    }
    float _873 = _825;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _877 = _869 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _881 = _873 + _879;
    float _883 = fma(_877, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3290 = float2(_883, _885);
    float _887 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3290, float2(0.0), isnan(_3290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3290, float2(0.0), isnan(_3290)), level(0.0)).x;
    float _889 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _891 = fma(_887, 100.0, _795);
    float _893 = _891 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _897 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _901 = _891 + _889;
    float _903 = _897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _905 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].x, _899);
    float _907 = 1.0 / _903;
    float _909 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _905);
    float _911 = _909 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _913 = _911 + _903;
    float _915 = _913 * _907;
    float _917 = _915 * 0.5;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _921 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _919);
    float _923 = 1.0 / _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _927 = _923 * _925;
    bool _929 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _931 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _933 = !_929;
    int _935 = _933 ? 0 : 1;
    int _937 = 2;
    if (!_929)
    {
        _937 = 1;
    }
    int _939 = _937;
    int _941 = _939;
    if (!_931)
    {
        _941 = _935;
    }
    int _943 = _941;
    int _945 = _943 << 6;
    int _947 = _945 + 96;
    uint _950 = uint(int(uint(_947) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c15)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c15)._m0[int(_960)][_962];
    int _966 = _945 + 104;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.vp_c15)._m0[int(_970)][_972];
    int _976 = int(_968) + 1;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    int _980 = _976 & 3;
    float _982 = (*spvDescriptorSet0.vp_c15)._m0[int(_978)][_980];
    int _984 = _945 + 48;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
    int _1002 = _945 + 64;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.vp_c15)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.vp_c15)._m0[int(_1014)][_1016];
    int _1020 = _945 + 56;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    uint _1024 = uint(int(uint(int(_1022)) >> uint(2)));
    int _1026 = int(_1022) & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    int _1030 = int(_1022) + 1;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    int _1034 = _1030 & 3;
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[int(_1032)][_1034];
    int _1038 = _945 + 72;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
    int _1044 = int(_1040) & 3;
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[int(_1042)][_1044];
    int _1048 = int(_1040) + 1;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    int _1052 = _1048 & 3;
    float _1054 = (*spvDescriptorSet0.vp_c15)._m0[int(_1050)][_1052];
    float _1056 = _901 * _964;
    float _1058 = fma(_755, _956, _1056);
    float _1060 = fma(_697, _974, _1058);
    float _1062 = _1060 + _982;
    int _1064 = _945 + 80;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    float _1082 = _901 * _1000;
    float _1084 = 1.0 / _1062;
    float _1086 = fma(_755, _992, _1082);
    int _1088 = _945 + 88;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c15)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    float _1106 = _901 * _1018;
    float _1108 = fma(_755, _1010, _1106);
    float _1110 = fma(_697, _1028, _1086);
    float _1112 = _1110 + _1036;
    float _1114 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1116 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1118 = fma(_697, _1046, _1108);
    float _1120 = floor(_1114);
    float _1122 = _1112 * _1084;
    float _1124 = _1118 + _1054;
    bool _1126 = _1122 >= 0.0;
    float _1128 = _1124 * _1084;
    float _1130 = floor(_1116);
    bool _1132 = _1122 <= 1.0;
    bool _1134 = _1132 && _1126;
    bool _1136 = _1128 >= 0.0;
    bool _1138 = _1136 && _1134;
    bool _1140 = _1128 <= 1.0;
    bool _1142 = _1140 && _1138;
    float _1144 = _901 * _1080;
    float _1146 = -_1130;
    float _1148 = _1116 + _1146;
    float _1150 = fma(_755, _1072, _1144);
    float _1152 = fma(_697, _1096, _1150);
    float _1154 = -_1120;
    float _1156 = _1114 + _1154;
    float _1158 = _1110;
    if (_1142)
    {
        float _1160 = float(_943);
        _1158 = _1160;
    }
    float _1162 = _1158;
    float _1164 = _1152 + _1104;
    float _1166 = _1144;
    if (_1142)
    {
        float _1168 = rint(_1162);
        float _1170 = precise::max(_1168, 0.0);
        uint _1172 = uint(_1170);
        uint _1174 = clamp(_1172, 0u, 65535u);
        _1166 = as_type<float>(_1174);
    }
    float _1176 = _1166;
    float2 _3783 = float2(_1156, _1148);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3783, float2(0.0), isnan(_3783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3783, float2(0.0), isnan(_3783)), level(0.0)).x;
    float _1180 = _1164 * _1084;
    float _1182 = _1128;
    if (_1142)
    {
        float3 _3801 = float3(_1122, _1128, float(as_type<int>(_1176)));
        float3 _3805 = select(_3801, float3(0.0), isnan(_3801));
        float _1184 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3805.xy, uint(rint(_3805.z)), _1180, level(0.0));
        _1182 = _1184;
    }
    float _1186 = _1182;
    float _1188 = in.m_74.x;
    float _1190 = in.m_74.y;
    bool _1192 = _705 != 0.0;
    bool _1194 = isnan(_705);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    float _1202 = _843;
    if (_799)
    {
        float _1204 = _843 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = in.m_74.z;
    bool _1212 = _717 == 0.0;
    bool _1214 = !_1200;
    bool _1216 = _1212 && _1214;
    bool _1218 = _665 == 0.0;
    bool _1220 = _1218 && _1216;
    float _1222 = _649 * _1190;
    float _1224 = _677 * _1190;
    float _1226 = fma(_677, _1188, _1222);
    float _1228 = _1210;
    float _1230 = _1226;
    if (!_1220)
    {
        float _1232 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1210);
        _1228 = _1232;
    }
    float _1234 = _1228;
    float _1236 = -_1224;
    float _1238 = fma(_649, _1188, _1236);
    float _1240 = _1238;
    if (!_1220)
    {
        float _1242 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1226);
        _1230 = _1242;
    }
    float _1244 = _1230;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1252 = _501 * _1244;
    if (_799)
    {
        float _1254 = _1208 + (-1.0);
        _603 = _1254;
    }
    float _1256 = _603;
    float _1258 = _531 * _1244;
    float _1260 = _503 * _1244;
    if (!_1220)
    {
        float _1262 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1238);
        _1240 = _1262;
    }
    float _1264 = _1240;
    if (_799)
    {
        float _1266 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _605 = _1266;
    }
    float _1268 = _605;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1272 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_799)
    {
        float _1276 = fma(_797, _1208, _1268);
        _813 = _1276;
    }
    float _1278 = _813;
    float _1280 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = fma(_727, _1264, _1258);
    float _1284 = _901 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1286 = fma(_887, 100.0, _1278);
    float _1288 = fma(_731, _1264, _1252);
    out.m_76.x = _1272;
    out.m_76.y = _1274;
    out.m_76.z = _1280;
    out.m_76.w = _1270;
    float _1290 = fma(_729, _1264, _1260);
    float _1292 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1284);
    float _1294 = _901 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1296 = abs(_927);
    float _1298 = log2(_1296);
    float _1300 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1292);
    float _1304 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1294);
    float _1306 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1308 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1310 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1306);
    float _1312 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1308);
    float _1314 = fma(_781, _1234, _1282);
    float _1316 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1318 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1320 = fma(_753, _1234, _1288);
    float _1322 = fma(_745, _1234, _1290);
    float _1324 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1316);
    float _1326 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1318);
    float _1328 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1310);
    float _1332 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1324);
    float _1334 = _1302 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1336 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1304);
    float _1338 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1326);
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1342 = trunc(_1334);
    int _1344 = int(_1342);
    float _1346 = _1336 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1348 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1350 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1356 = trunc(_1346);
    int _1358 = int(_1356);
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1352);
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1354);
    float _1370 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1372 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1374 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = exp2(_1364);
    float _1378 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1380 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1370);
    float _1382 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1372);
    int _1384 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1386 = _1344 + _1384;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1392 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    int _1394 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1396 = _1358 + _1394;
    int _1398 = _1396 + 1;
    float _1400 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1380);
    float _1402 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    bool _1404 = _1388 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1406 = _1388 | _1398;
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _1400;
    out.gl_Position.w = _1402;
    float _1408 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    bool _1412 = _1406 < 0;
    bool _1414 = _1412 || _1404;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1286 + _1416;
    bool _1420 = _927 <= 8000.0;
    bool _1422 = isnan(_927);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(8000.0);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = fma(_1410, -2.0, 3.0);
    bool _1434 = _1398 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1436 = _1434 || _1414;
    float _1438 = _1410 * _1410;
    float _1440 = _1438 * _1432;
    float _1442 = -_1440;
    float _1444 = _1442 + 1.0;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1440);
    float _1448 = _1444;
    float _1450 = as_type<float>(_1388);
    if (_1436)
    {
        _1448 = 1.0;
    }
    float _1452 = _1448;
    float _1454 = _1452;
    if (!_1436)
    {
        int _1456 = _1398 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1458 = _1456 + _1388;
        float _1460 = floor(_1346);
        int _1462 = _1458 << 2;
        uint _1464 = uint(int(uint(_1458) >> uint(2)));
        int _1466 = 12 & _1462;
        int _1468 = int(_1464) << 4;
        int _1470 = _1468 + _1466;
        float _1472 = floor(_1334);
        float _1474 = -_1460;
        float _1476 = _1346 + _1474;
        int _1478 = _1470 + 400;
        uint _1480 = uint(int(uint(_1478) >> uint(2)));
        uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
        int _1484 = int(_1480) & 3;
        float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
        float _1488 = -_1472;
        float _1490 = _1334 + _1488;
        float _1492 = rint(_1486);
        float _1494 = precise::max(_1492, 0.0);
        uint _1496 = uint(_1494);
        uint _1498 = clamp(_1496, 0u, 65535u);
        float3 _4390 = float3(_1490, _1476, float(int(_1498)));
        float3 _4392 = select(_4390, float3(0.0), isnan(_4390));
        float _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4392.xy, uint(rint(_4392.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4392.xy, uint(rint(_4392.z)), level(0.0)).x;
        int _1502 = _1458 << 4;
        int _1504 = _1502 + 2048;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
        int _1510 = int(_1506) & 3;
        float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
        int _1514 = int(_1506) + 1;
        uint _1516 = uint(int(uint(_1514) >> uint(2)));
        int _1518 = _1514 & 3;
        float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
        int _1522 = _1504 + 8;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
        int _1528 = int(_1524) & 3;
        float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
        int _1532 = int(_1524) + 1;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        int _1536 = _1532 & 3;
        float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
        float _1540 = _901 * _1520;
        float _1542 = fma(_755, _1512, _1540);
        float _1544 = fma(_697, _1530, _1542);
        float _1546 = _1544 + _1538;
        float _1548 = precise::clamp(_1546, 0.0, 1.0);
        float _1550 = -_1548;
        float _1552 = _1550 + _1500;
        float _1554 = fma(_1552, 500.0, 1.5);
        float _1556 = exp2(_1554);
        float _1558 = 0.0 + _1556;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1450 = _1486;
        _1454 = _1560;
    }
    float _1562 = _1450;
    float _1564 = _1454;
    float _1566 = _1430 * _1446;
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1570 = _869 + _1568;
    float _1572 = in.m_66.w;
    float _1574 = _1418 * _1418;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1578 = -_1178;
    float _1580 = _1578 + 1.0;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _873 + _1582;
    float _1586 = _1562;
    float _1588 = _1576;
    float _1590 = _1566;
    if (!_1142)
    {
        _1586 = 1.0;
    }
    float _1592 = _1586;
    float _1594 = fma(_1570, _1570, _1574);
    float _1596 = _1592;
    if (_1142)
    {
        bool _1598 = _1186 >= _1180;
        bool _1600 = isnan(_1186);
        bool _1602 = _1598 || _1600;
        bool _1604 = isnan(_1180);
        bool _1606 = _1602 || _1604;
        float _1608 = float(_1606);
        _1596 = _1608;
    }
    float _1610 = _1596;
    float _1612 = _1580 * _1576;
    float _1614 = precise::clamp(_1612, 0.0, 1.0);
    float _1616 = fma(_1584, _1584, _1594);
    out.m_78.x = _1320;
    out.m_78.y = _1314;
    out.m_78.z = _1322;
    float _1618 = _1610 * _1564;
    float _1620 = -_1614;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1624 = sqrt(_1616);
    out.m_80.x = _869;
    out.m_80.y = _1286;
    out.m_80.z = _873;
    float _1626 = -_1618;
    float _1628 = fma(_1626, _1622, 1.0);
    float _1630 = precise::clamp(_1628, 0.0, 1.0);
    float _1632 = _1630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.w = _1572;
    out.m_84.x = _1632;
    bool _1634 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1636 = isnan(_1624);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1642 = _1638 || _1640;
    float _1644 = _1614;
    float _1646 = _1610;
    float _1648 = _1618;
    float _1650 = _1630;
    if (!_1642)
    {
        _1644 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    float _1656 = _1652;
    if (!_1642)
    {
        _1588 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1658 = _1588;
    float _1660 = _1658;
    float _1662 = _1658;
    if (!_1642)
    {
        _1590 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1664 = _1590;
    float _1666 = _1664;
    float _1668 = _1664;
    if (!_1642)
    {
        _1646 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1670 = _1646;
    float _1672 = _1670;
    float _1674 = _1670;
    if (!_1642)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1676 = _1648;
    float _1678 = _1676;
    float _1680 = _1676;
    if (!_1642)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1682 = _1650;
    bool _1684 = !_1642;
    float _1686 = _1682;
    float _1688 = _1682;
    if (!_1684)
    {
        bool _1690 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1692 = isnan(_1624);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1702 = _1624 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1706 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1712 = 1.0 / _1706;
            float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1730 = _1702 * _1712;
            float _1732 = precise::clamp(_1730, 0.0, 1.0);
            float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1738 = fma(_1732, _1710, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1740 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1742 = fma(_1732, _1716, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1744 = fma(_1732, _1720, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1746 = fma(_1732, _1724, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1748 = fma(_1732, _1728, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1662 = _1738;
            _1680 = _1746;
            _1656 = _1742;
            _1674 = _1744;
            _1668 = _1740;
            _1688 = _1748;
            _1750 = true;
        }
        else
        {
            bool _1752 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1754 = isnan(_1624);
            bool _1756 = _1752 || _1754;
            bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1760 = _1756 || _1758;
            if (!_1760)
            {
                _1654 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1762 = _1654;
            _1656 = _1762;
            if (!_1760)
            {
                _1660 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1764 = _1660;
            _1662 = _1764;
            if (!_1760)
            {
                _1666 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1766 = _1666;
            _1668 = _1766;
            if (!_1760)
            {
                _1672 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1768 = _1672;
            _1674 = _1768;
            if (!_1760)
            {
                _1678 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1770 = _1678;
            _1680 = _1770;
            if (!_1760)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1772 = _1686;
            bool _1774 = !_1760;
            _1688 = _1772;
            if (!_1774)
            {
                bool _1776 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1778 = isnan(_1624);
                bool _1780 = _1776 || _1778;
                bool _1782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1784 = _1780 || _1782;
                if (!_1784)
                {
                    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1788 = _1624 + _1786;
                    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1792 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1790;
                    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1798 = 1.0 / _1792;
                    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1816 = _1788 * _1798;
                    float _1818 = precise::clamp(_1816, 0.0, 1.0);
                    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1824 = fma(_1818, _1796, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1826 = fma(_1818, _1822, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1828 = fma(_1818, _1802, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1830 = fma(_1818, _1806, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1832 = fma(_1818, _1810, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1834 = fma(_1818, _1814, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1662 = _1824;
                    _1680 = _1832;
                    _1656 = _1828;
                    _1674 = _1830;
                    _1668 = _1826;
                    _1688 = _1834;
                    _1750 = true;
                }
                else
                {
                    _1662 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1680 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1656 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1674 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1668 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1750 = false;
    float _1836 = _1662;
    float _1838 = _1680;
    float _1840 = _1656;
    float _1842 = _1674;
    float _1844 = _1668;
    float _1846 = _1688;
    float _1848 = fma(_1314, -0.5, 0.5);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = -_1836;
    float _1854 = _1852 + _1838;
    float _1856 = -_1840;
    float _1858 = _1856 + _1842;
    float _1860 = -_1844;
    float _1862 = _1860 + _1846;
    float _1864 = rsqrt(_1616);
    float _1866 = fma(_1850, _1854, _1836);
    float _1868 = fma(_1850, _1858, _1840);
    float _1870 = fma(_1850, _1862, _1844);
    bool _1872 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1874 = _1866 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _1876 = fma(_1868, 0.298911988735198974609375, _1874);
    out.m_86.x = 0.0;
    float _1878 = fma(_1870, 0.114477999508380889892578125, _1876);
    float _1880 = _1584 * _1864;
    float _1882 = -_1878;
    float _1884 = _1868 + _1882;
    float _1886 = -_1878;
    float _1888 = _1866 + _1886;
    float _1890 = -_1878;
    float _1892 = _1870 + _1890;
    float _1894 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1896 = fma(_1884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    float _1898 = fma(_1888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    float _1900 = fma(_1892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    out.m_88.x = 0.0;
    float _1902 = _1570 * _1864;
    float _1904 = _1418 * _1864;
    out.m_84.w = _1894;
    out.m_90.x = _1896;
    out.m_90.y = _1898;
    out.m_90.z = _1900;
    if (!_1872)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1906 = -_1286;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1910 = -_869;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1914 = -_873;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1918 = _1908 * _1908;
    float _1920 = fma(_1912, _1912, _1918);
    float _1922 = fma(_1916, _1916, _1920);
    float _1924 = rsqrt(_1922);
    float _1926 = _1908 * _1924;
    float _1928 = _1912 * _1924;
    float _1930 = _1916 * _1924;
    float _1932 = sqrt(_1922);
    float _1934 = -_1904;
    float _1936 = _1934 + _1926;
    float _1938 = -_1902;
    float _1940 = _1938 + _1928;
    float _1942 = -_1880;
    float _1944 = _1942 + _1930;
    float _1946 = _1936 * _1936;
    float _1948 = fma(_1940, _1940, _1946);
    float _1950 = fma(_1944, _1944, _1948);
    float _1952 = -_1932;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1956 = rsqrt(_1950);
    float _1958 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = abs(_1960);
    float _1964 = log2(_1962);
    float _1966 = _1936 * _1956;
    float _1968 = _1940 * _1956;
    float _1970 = _1944 * _1956;
    float _1972 = _1314 * _1966;
    float _1974 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1314 * _1926;
    float _1980 = fma(_1320, _1968, _1972);
    float _1982 = _1976 * _1976;
    float _1984 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1986 = fma(_1320, _1928, _1978);
    float _1988 = fma(_1322, _1970, _1980);
    float _1990 = precise::clamp(_1988, 0.0, 1.0);
    float _1992 = _1982 + (-1.0);
    float _1994 = fma(_1322, _1930, _1986);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = _1990 * _1990;
    float _2000 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2002 = exp2(_1984);
    float _2004 = fma(_1998, _1992, 1.0);
    float _2006 = -_1926;
    float _2008 = -_2000;
    float _2010 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2008);
    float _2012 = _2004 * _2004;
    float _2014 = -_1930;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2010);
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2020 = _2016 + _2018;
    float _2022 = 1.0 / _2012;
    float _2024 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2026 = precise::clamp(_2024, 0.0, 1.0);
    float _2028 = _2002 * _2026;
    float _2030 = _1996 * _2028;
    float _2032 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2034 = _1982 * _2022;
    float _2036 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2038 = _2030 * _2034;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2044 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2032;
    out.m_86.y = _2036;
    out.m_86.z = _2040;
    out.m_88.x = _2042;
    out.m_88.y = _2044;
    out.m_88.z = _2046;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1750 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_49.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_52.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_125);
        out.gl_Position.z = _2103;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_54.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_139)
    {
        float _145 = float(_109);
        _119 = _145;
    }
    float _147 = _119;
    bool _149 = _143 >= _147;
    bool _151 = !_139;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_52.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    float _163 = as_type<float>(_161);
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_161);
        out.gl_Position.z = _2174;
    }
    if (_153)
    {
        return out;
    }
    float _165 = in.m_56.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = in.m_56.y;
    float _171 = in.m_58.z;
    float _173 = in.m_58.y;
    float _175 = in.m_60.z;
    float _177 = in.m_60.y;
    float _179 = _165 * _165;
    float _181 = in.m_56.x;
    float _183 = _169 * _169;
    float _185 = in.m_58.x;
    float _187 = fma(_171, _171, _179);
    float _189 = in.m_60.x;
    float _191 = fma(_173, _173, _183);
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _191);
    float _197 = sqrt(_193);
    float _199 = in.m_62.x;
    float _201 = in.m_62.y;
    float _203 = in.m_62.z;
    float _205 = sqrt(_195);
    bool _207 = _197 > 0.0;
    bool _209 = _205 > 0.0;
    float _211 = _169 * _201;
    float _213 = _173 * _201;
    float _215 = _177 * _201;
    float _217 = _193;
    float _219 = _213;
    float _221 = _195;
    if (_207)
    {
        float _223 = rsqrt(_193);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = fma(_199, _181, _211);
    float _229 = fma(_199, _185, _213);
    float _231 = fma(_199, _189, _215);
    float _233 = _231;
    if (!_207)
    {
        _219 = 0.0;
    }
    float _235 = _219;
    float _237 = fma(_165, _203, _227);
    float _239 = fma(_171, _203, _229);
    float _241 = fma(_175, _203, _231);
    float _243 = 0.0;
    float _245 = _235;
    if (_209)
    {
        float _247 = rsqrt(_195);
        _243 = _247;
    }
    float _249 = _243;
    if (!_209)
    {
        _163 = 0.0;
    }
    float _251 = _163;
    float _253 = 0.0;
    float _255 = _251;
    if (!_209)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_209)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _225;
    float _267 = _263;
    if (_207)
    {
        float _269 = _225 * 0.001000000047497451305389404296875;
        _233 = _269;
    }
    float _271 = _233;
    if (!_207)
    {
        _221 = 0.0;
    }
    float _273 = _221;
    float _275 = _273;
    if (!_207)
    {
        _265 = 0.0;
    }
    float _277 = _265;
    float _279 = _277;
    if (_207)
    {
        float _281 = _165 * _271;
        _245 = _281;
    }
    float _283 = _245;
    if (_207)
    {
        float _285 = _171 * _271;
        _275 = _285;
    }
    float _287 = _275;
    if (_207)
    {
        float _289 = _175 * _271;
        _279 = _289;
    }
    float _291 = _279;
    if (_209)
    {
        float _293 = _249 * _169;
        _255 = _293;
    }
    float _295 = _255;
    float _297 = _295;
    if (_209)
    {
        float _299 = _249 * _173;
        _261 = _299;
    }
    float _301 = _261;
    float _303 = _301;
    if (_209)
    {
        float _305 = _249 * _177;
        _267 = _305;
    }
    float _307 = _267;
    bool _309 = !_167;
    float _311 = _307;
    float _329;
    if (!_309)
    {
        float _313 = in.m_64.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        float _333 = float(_109);
        float _335 = 1.0 / _333;
        float _337 = _143 * _335;
        _329 = _337;
    }
    _331 = false;
    float _339 = _329;
    float _341 = in.m_49.x;
    float _343 = in.m_49.y;
    float _345 = in.m_49.z;
    float _347 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
    float _349 = in.m_66.x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    float _363 = 1.0 / _353;
    float _365 = in.m_64.x;
    float _367 = 1.0 / _357;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _339 + _369;
    float _373 = _173 * _343;
    float _375 = _177 * _343;
    float _377 = 1.0 / _361;
    float _379 = fma(_185, _341, _373);
    float _381 = fma(_189, _341, _375);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _339 + _383;
    float _387 = _237 * _237;
    float _389 = fma(_171, _345, _379);
    float _391 = fma(_175, _345, _381);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _339 + _393;
    float _397 = _385 * _363;
    float _399 = fma(_239, _239, _387);
    bool _401 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_339);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = abs(_349);
    float _415 = log2(_413);
    float _417 = _395 * _367;
    float _419 = _241 * _347;
    float _421 = fma(_241, _241, _399);
    float _423 = _239 * _347;
    float _425 = _371 * _377;
    float _427 = _419 * _419;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    float _433 = rsqrt(_421);
    float _435 = fma(_423, _423, _427);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _441;
    float _445 = fma(_431, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _447 = fma(_439, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _449 = sqrt(_435);
    float _451 = _415 * 0.5;
    bool _453 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_339);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = fma(_443, _397, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _467 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _469 = isnan(_339);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _483 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _485 = isnan(_339);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -_463;
    float _497 = _495 + 1.0;
    float _499 = exp2(_451);
    float _501 = _239 * _433;
    float _503 = _241 * _433;
    float _505 = _477 * _497;
    float _507 = -_477;
    float _509 = _507 + 1.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_481, _417, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _521 = _449 * 200.0;
    float _523 = fma(_513, _417, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _525 = fma(_517, _417, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _527 = in.m_60.w;
    float _529 = fma(_143, 0.20000000298023223876953125, _521);
    float _531 = _237 * _433;
    float _533 = _411 * _509;
    float _535 = -_411;
    float _537 = _535 + 1.0;
    float _539 = fma(_499, 0.942477881908416748046875, _529);
    float _541 = _531 * _295;
    float _543 = _493 * _537;
    float _545 = fma(_365, 6.283185482025146484375, _539);
    float _547 = fma(_501, _301, _541);
    float _549 = -_493;
    float _551 = _549 + 1.0;
    float _553 = _445 * _543;
    float _555 = _545 * 0.15915493667125701904296875;
    float _557 = fma(_503, _307, _547);
    float _559 = _447 * _543;
    float _561 = _465 * _543;
    float _563 = _555 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].y, _553);
    float _569 = abs(_557);
    bool _571 = _569 > 0.99989998340606689453125;
    float _573 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _575;
    float _579 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _581 = fma(_525, _533, _567);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _583;
    float _587 = in.m_68.x;
    float _589 = in.m_68.y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _591;
    float _595 = fma(_577, _425, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _597 = fma(_585, _425, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _599 = fma(_519, _533, _573);
    float _601 = _343;
    float _603 = _501;
    float _605 = _503;
    if (_571)
    {
        float _607 = _301 + _287;
        _303 = _607;
    }
    float _609 = _303;
    float _611 = _565 * 0.349065840244293212890625;
    if (_571)
    {
        float _613 = _295 + _283;
        _297 = _613;
    }
    float _615 = _297;
    if (_571)
    {
        float _617 = _307 + _291;
        _311 = _617;
    }
    float _619 = _311;
    float _621 = -_609;
    float _623 = _503 * _621;
    float _625 = fma(_593, _425, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _627 = _611 * 0.15915493667125701904296875;
    float _629 = in.m_70.x;
    float _631 = in.m_70.y;
    float _633 = in.m_70.z;
    float _635 = -_619;
    float _637 = _531 * _635;
    float _639 = fma(_523, _533, _579);
    float _641 = -_619;
    float _643 = -_623;
    float _645 = fma(_501, _641, _643);
    float _647 = _627 * 6.283185482025146484375;
    float _649 = cos(_647);
    float _651 = -_615;
    float _653 = -_637;
    float _655 = fma(_503, _651, _653);
    float _657 = -_615;
    float _659 = _501 * _657;
    float _661 = _645 * _645;
    float _663 = fma(_595, _505, _599);
    float _665 = in.m_68.z;
    float _667 = -_609;
    float _669 = -_659;
    float _671 = fma(_531, _667, _669);
    float _673 = fma(_655, _655, _661);
    float _675 = _627 * 6.283185482025146484375;
    float _677 = sin(_675);
    float _679 = fma(_597, _505, _581);
    float _681 = fma(_625, _505, _639);
    float _683 = fma(_671, _671, _673);
    float _685 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _663);
    float _687 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _679);
    float _689 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].z, _681);
    float _691 = rsqrt(_683);
    float _693 = _649 * _589;
    float _695 = in.m_58.w;
    float _697 = _391 + _527;
    float _699 = _687 * _631;
    float _701 = _685 * _629;
    float _703 = _689 * _633;
    float _705 = fma(_677, _587, _693);
    float _707 = _677 * _589;
    float _709 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _715 = -_707;
    float _717 = fma(_649, _587, _715);
    float _719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _665);
    float _721 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _723 = _709 * _713;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _717);
    float _727 = _645 * _691;
    float _729 = _671 * _691;
    float _731 = _655 * _691;
    float _733 = _711 * _725;
    float _735 = _501 * _727;
    float _737 = _723 * _503;
    float _739 = _531 * _729;
    float _741 = _721 * _719;
    float _743 = -_735;
    float _745 = fma(_531, _731, _743);
    float _747 = _723 * _501;
    float _749 = fma(_733, _729, _737);
    float _751 = -_739;
    float _753 = fma(_503, _727, _751);
    float _755 = _389 + _695;
    float _757 = fma(_733, _731, _747);
    float _759 = fma(_741, _745, _749);
    float _761 = _723 * _531;
    float _763 = _503 * _731;
    float _765 = fma(_741, _753, _757);
    float _767 = _697 + _759;
    float _769 = fma(_733, _727, _761);
    float _771 = in.m_72.y;
    float _773 = _755 + _765;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _777 = _767 + _775;
    float _779 = -_763;
    float _781 = fma(_501, _729, _779);
    float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _785 = _773 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_741, _781, _769);
    float _791 = fma(_785, _785, _787);
    float _793 = sqrt(_791);
    float _795 = _343 + _771;
    float _797 = _795 + _789;
    bool _799 = _793 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _801 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _803 = _793 + _801;
    float _805 = _561;
    float _807 = _769;
    float _809 = _733;
    float _811 = _721;
    float _813 = _797;
    if (_799)
    {
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _805 = _815;
    }
    float _817 = _805;
    if (_799)
    {
        float _819 = _797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _819;
    }
    float _821 = _601;
    if (!_799)
    {
        _807 = _767;
    }
    float _823 = _807;
    float _825 = _823;
    if (_799)
    {
        float _827 = rsqrt(_791);
        _809 = _827;
    }
    float _829 = _809;
    float _831 = _817;
    float _833 = _829;
    if (_799)
    {
        float _835 = _803 * _817;
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _837;
    if (_799)
    {
        float _841 = _837 * 0.15915493667125701904296875;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = _803;
    if (_799)
    {
        float _847 = _843 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = _851;
    if (_799)
    {
        float _855 = fma(_851, _821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _811 = _855;
    }
    float _857 = _811;
    if (!_799)
    {
        _853 = _773;
    }
    float _859 = _853;
    float _861 = _859;
    if (_799)
    {
        float _863 = _829 * _857;
        _833 = _863;
    }
    float _865 = _833;
    if (_799)
    {
        float _867 = fma(_785, _865, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _861 = _867;
    }
    float _869 = _861;
    if (_799)
    {
        float _871 = fma(_777, _865, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _825 = _871;
    }
    float _873 = _825;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _877 = _869 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _881 = _873 + _879;
    float _883 = fma(_877, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3290 = float2(_883, _885);
    float _887 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3290, float2(0.0), isnan(_3290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3290, float2(0.0), isnan(_3290)), level(0.0)).x;
    float _889 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _891 = fma(_887, 100.0, _795);
    float _893 = _891 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _897 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _901 = _891 + _889;
    float _903 = _897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _905 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].x, _899);
    float _907 = 1.0 / _903;
    float _909 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _905);
    float _911 = _909 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _913 = _911 + _903;
    float _915 = _913 * _907;
    float _917 = _915 * 0.5;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _921 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _919);
    float _923 = 1.0 / _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _927 = _923 * _925;
    bool _929 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _931 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _933 = !_929;
    int _935 = _933 ? 0 : 1;
    int _937 = 2;
    if (!_929)
    {
        _937 = 1;
    }
    int _939 = _937;
    int _941 = _939;
    if (!_931)
    {
        _941 = _935;
    }
    int _943 = _941;
    int _945 = _943 << 6;
    int _947 = _945 + 96;
    uint _950 = uint(int(uint(_947) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c15)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c15)._m0[int(_960)][_962];
    int _966 = _945 + 104;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.vp_c15)._m0[int(_970)][_972];
    int _976 = int(_968) + 1;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    int _980 = _976 & 3;
    float _982 = (*spvDescriptorSet0.vp_c15)._m0[int(_978)][_980];
    int _984 = _945 + 48;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
    int _1002 = _945 + 64;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.vp_c15)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.vp_c15)._m0[int(_1014)][_1016];
    int _1020 = _945 + 56;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    uint _1024 = uint(int(uint(int(_1022)) >> uint(2)));
    int _1026 = int(_1022) & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    int _1030 = int(_1022) + 1;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    int _1034 = _1030 & 3;
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[int(_1032)][_1034];
    int _1038 = _945 + 72;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
    int _1044 = int(_1040) & 3;
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[int(_1042)][_1044];
    int _1048 = int(_1040) + 1;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    int _1052 = _1048 & 3;
    float _1054 = (*spvDescriptorSet0.vp_c15)._m0[int(_1050)][_1052];
    float _1056 = _901 * _964;
    float _1058 = fma(_755, _956, _1056);
    float _1060 = fma(_697, _974, _1058);
    float _1062 = _1060 + _982;
    int _1064 = _945 + 80;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    float _1082 = _901 * _1000;
    float _1084 = 1.0 / _1062;
    float _1086 = fma(_755, _992, _1082);
    int _1088 = _945 + 88;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c15)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    float _1106 = _901 * _1018;
    float _1108 = fma(_755, _1010, _1106);
    float _1110 = fma(_697, _1028, _1086);
    float _1112 = _1110 + _1036;
    float _1114 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1116 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1118 = fma(_697, _1046, _1108);
    float _1120 = floor(_1114);
    float _1122 = _1112 * _1084;
    float _1124 = _1118 + _1054;
    bool _1126 = _1122 >= 0.0;
    float _1128 = _1124 * _1084;
    float _1130 = floor(_1116);
    bool _1132 = _1122 <= 1.0;
    bool _1134 = _1132 && _1126;
    bool _1136 = _1128 >= 0.0;
    bool _1138 = _1136 && _1134;
    bool _1140 = _1128 <= 1.0;
    bool _1142 = _1140 && _1138;
    float _1144 = _901 * _1080;
    float _1146 = -_1130;
    float _1148 = _1116 + _1146;
    float _1150 = fma(_755, _1072, _1144);
    float _1152 = fma(_697, _1096, _1150);
    float _1154 = -_1120;
    float _1156 = _1114 + _1154;
    float _1158 = _1110;
    if (_1142)
    {
        float _1160 = float(_943);
        _1158 = _1160;
    }
    float _1162 = _1158;
    float _1164 = _1152 + _1104;
    float _1166 = _1144;
    if (_1142)
    {
        float _1168 = rint(_1162);
        float _1170 = precise::max(_1168, 0.0);
        uint _1172 = uint(_1170);
        uint _1174 = clamp(_1172, 0u, 65535u);
        _1166 = as_type<float>(_1174);
    }
    float _1176 = _1166;
    float2 _3783 = float2(_1156, _1148);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3783, float2(0.0), isnan(_3783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3783, float2(0.0), isnan(_3783)), level(0.0)).x;
    float _1180 = _1164 * _1084;
    float _1182 = _1128;
    if (_1142)
    {
        float3 _3801 = float3(_1122, _1128, float(as_type<int>(_1176)));
        float3 _3805 = select(_3801, float3(0.0), isnan(_3801));
        float _1184 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3805.xy, uint(rint(_3805.z)), _1180, level(0.0));
        _1182 = _1184;
    }
    float _1186 = _1182;
    float _1188 = in.m_74.x;
    float _1190 = in.m_74.y;
    bool _1192 = _705 != 0.0;
    bool _1194 = isnan(_705);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    float _1202 = _843;
    if (_799)
    {
        float _1204 = _843 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = in.m_74.z;
    bool _1212 = _717 == 0.0;
    bool _1214 = !_1200;
    bool _1216 = _1212 && _1214;
    bool _1218 = _665 == 0.0;
    bool _1220 = _1218 && _1216;
    float _1222 = _649 * _1190;
    float _1224 = _677 * _1190;
    float _1226 = fma(_677, _1188, _1222);
    float _1228 = _1210;
    float _1230 = _1226;
    if (!_1220)
    {
        float _1232 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1210);
        _1228 = _1232;
    }
    float _1234 = _1228;
    float _1236 = -_1224;
    float _1238 = fma(_649, _1188, _1236);
    float _1240 = _1238;
    if (!_1220)
    {
        float _1242 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1226);
        _1230 = _1242;
    }
    float _1244 = _1230;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1252 = _501 * _1244;
    if (_799)
    {
        float _1254 = _1208 + (-1.0);
        _603 = _1254;
    }
    float _1256 = _603;
    float _1258 = _531 * _1244;
    float _1260 = _503 * _1244;
    if (!_1220)
    {
        float _1262 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1238);
        _1240 = _1262;
    }
    float _1264 = _1240;
    if (_799)
    {
        float _1266 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _605 = _1266;
    }
    float _1268 = _605;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1272 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_799)
    {
        float _1276 = fma(_797, _1208, _1268);
        _813 = _1276;
    }
    float _1278 = _813;
    float _1280 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = fma(_727, _1264, _1258);
    float _1284 = _901 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1286 = fma(_887, 100.0, _1278);
    float _1288 = fma(_731, _1264, _1252);
    out.m_76.x = _1272;
    out.m_76.y = _1274;
    out.m_76.z = _1280;
    out.m_76.w = _1270;
    float _1290 = fma(_729, _1264, _1260);
    float _1292 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1284);
    float _1294 = _901 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1296 = abs(_927);
    float _1298 = log2(_1296);
    float _1300 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1292);
    float _1304 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1294);
    float _1306 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1308 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1310 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1306);
    float _1312 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1308);
    float _1314 = fma(_781, _1234, _1282);
    float _1316 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1318 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1320 = fma(_753, _1234, _1288);
    float _1322 = fma(_745, _1234, _1290);
    float _1324 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1316);
    float _1326 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1318);
    float _1328 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1310);
    float _1332 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1324);
    float _1334 = _1302 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1336 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1304);
    float _1338 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1326);
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1342 = trunc(_1334);
    int _1344 = int(_1342);
    float _1346 = _1336 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1348 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1350 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1356 = trunc(_1346);
    int _1358 = int(_1356);
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1352);
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1354);
    float _1370 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1372 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1374 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = exp2(_1364);
    float _1378 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1380 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1370);
    float _1382 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1372);
    int _1384 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1386 = _1344 + _1384;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1392 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    int _1394 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1396 = _1358 + _1394;
    int _1398 = _1396 + 1;
    float _1400 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1380);
    float _1402 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    bool _1404 = _1388 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1406 = _1388 | _1398;
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _1400;
    out.gl_Position.w = _1402;
    float _1408 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    bool _1412 = _1406 < 0;
    bool _1414 = _1412 || _1404;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1286 + _1416;
    bool _1420 = _927 <= 8000.0;
    bool _1422 = isnan(_927);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(8000.0);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = fma(_1410, -2.0, 3.0);
    bool _1434 = _1398 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1436 = _1434 || _1414;
    float _1438 = _1410 * _1410;
    float _1440 = _1438 * _1432;
    float _1442 = -_1440;
    float _1444 = _1442 + 1.0;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1440);
    float _1448 = _1444;
    float _1450 = as_type<float>(_1388);
    if (_1436)
    {
        _1448 = 1.0;
    }
    float _1452 = _1448;
    float _1454 = _1452;
    if (!_1436)
    {
        int _1456 = _1398 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1458 = _1456 + _1388;
        float _1460 = floor(_1346);
        int _1462 = _1458 << 2;
        uint _1464 = uint(int(uint(_1458) >> uint(2)));
        int _1466 = 12 & _1462;
        int _1468 = int(_1464) << 4;
        int _1470 = _1468 + _1466;
        float _1472 = floor(_1334);
        float _1474 = -_1460;
        float _1476 = _1346 + _1474;
        int _1478 = _1470 + 400;
        uint _1480 = uint(int(uint(_1478) >> uint(2)));
        uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
        int _1484 = int(_1480) & 3;
        float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
        float _1488 = -_1472;
        float _1490 = _1334 + _1488;
        float _1492 = rint(_1486);
        float _1494 = precise::max(_1492, 0.0);
        uint _1496 = uint(_1494);
        uint _1498 = clamp(_1496, 0u, 65535u);
        float3 _4390 = float3(_1490, _1476, float(int(_1498)));
        float3 _4392 = select(_4390, float3(0.0), isnan(_4390));
        float _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4392.xy, uint(rint(_4392.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4392.xy, uint(rint(_4392.z)), level(0.0)).x;
        int _1502 = _1458 << 4;
        int _1504 = _1502 + 2048;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
        int _1510 = int(_1506) & 3;
        float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
        int _1514 = int(_1506) + 1;
        uint _1516 = uint(int(uint(_1514) >> uint(2)));
        int _1518 = _1514 & 3;
        float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
        int _1522 = _1504 + 8;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
        int _1528 = int(_1524) & 3;
        float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
        int _1532 = int(_1524) + 1;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        int _1536 = _1532 & 3;
        float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
        float _1540 = _901 * _1520;
        float _1542 = fma(_755, _1512, _1540);
        float _1544 = fma(_697, _1530, _1542);
        float _1546 = _1544 + _1538;
        float _1548 = precise::clamp(_1546, 0.0, 1.0);
        float _1550 = -_1548;
        float _1552 = _1550 + _1500;
        float _1554 = fma(_1552, 500.0, 1.5);
        float _1556 = exp2(_1554);
        float _1558 = 0.0 + _1556;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1450 = _1486;
        _1454 = _1560;
    }
    float _1562 = _1450;
    float _1564 = _1454;
    float _1566 = _1430 * _1446;
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1570 = _869 + _1568;
    float _1572 = in.m_66.w;
    float _1574 = _1418 * _1418;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1578 = -_1178;
    float _1580 = _1578 + 1.0;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _873 + _1582;
    float _1586 = _1562;
    float _1588 = _1576;
    float _1590 = _1566;
    if (!_1142)
    {
        _1586 = 1.0;
    }
    float _1592 = _1586;
    float _1594 = fma(_1570, _1570, _1574);
    float _1596 = _1592;
    if (_1142)
    {
        bool _1598 = _1186 >= _1180;
        bool _1600 = isnan(_1186);
        bool _1602 = _1598 || _1600;
        bool _1604 = isnan(_1180);
        bool _1606 = _1602 || _1604;
        float _1608 = float(_1606);
        _1596 = _1608;
    }
    float _1610 = _1596;
    float _1612 = _1580 * _1576;
    float _1614 = precise::clamp(_1612, 0.0, 1.0);
    float _1616 = fma(_1584, _1584, _1594);
    out.m_78.x = _1320;
    out.m_78.y = _1314;
    out.m_78.z = _1322;
    float _1618 = _1610 * _1564;
    float _1620 = -_1614;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1624 = sqrt(_1616);
    out.m_80.x = _869;
    out.m_80.y = _1286;
    out.m_80.z = _873;
    float _1626 = -_1618;
    float _1628 = fma(_1626, _1622, 1.0);
    float _1630 = precise::clamp(_1628, 0.0, 1.0);
    float _1632 = _1630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.w = _1572;
    out.m_84.x = _1632;
    bool _1634 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1636 = isnan(_1624);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1642 = _1638 || _1640;
    float _1644 = _1614;
    float _1646 = _1610;
    float _1648 = _1618;
    float _1650 = _1630;
    if (!_1642)
    {
        _1644 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    float _1656 = _1652;
    if (!_1642)
    {
        _1588 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1658 = _1588;
    float _1660 = _1658;
    float _1662 = _1658;
    if (!_1642)
    {
        _1590 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1664 = _1590;
    float _1666 = _1664;
    float _1668 = _1664;
    if (!_1642)
    {
        _1646 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1670 = _1646;
    float _1672 = _1670;
    float _1674 = _1670;
    if (!_1642)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1676 = _1648;
    float _1678 = _1676;
    float _1680 = _1676;
    if (!_1642)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1682 = _1650;
    bool _1684 = !_1642;
    float _1686 = _1682;
    float _1688 = _1682;
    if (!_1684)
    {
        bool _1690 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1692 = isnan(_1624);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1702 = _1624 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1706 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1712 = 1.0 / _1706;
            float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1730 = _1702 * _1712;
            float _1732 = precise::clamp(_1730, 0.0, 1.0);
            float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1738 = fma(_1732, _1710, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1740 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1742 = fma(_1732, _1716, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1744 = fma(_1732, _1720, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1746 = fma(_1732, _1724, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1748 = fma(_1732, _1728, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1662 = _1738;
            _1680 = _1746;
            _1656 = _1742;
            _1674 = _1744;
            _1668 = _1740;
            _1688 = _1748;
            _1750 = true;
        }
        else
        {
            bool _1752 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1754 = isnan(_1624);
            bool _1756 = _1752 || _1754;
            bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1760 = _1756 || _1758;
            if (!_1760)
            {
                _1654 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1762 = _1654;
            _1656 = _1762;
            if (!_1760)
            {
                _1660 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1764 = _1660;
            _1662 = _1764;
            if (!_1760)
            {
                _1666 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1766 = _1666;
            _1668 = _1766;
            if (!_1760)
            {
                _1672 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1768 = _1672;
            _1674 = _1768;
            if (!_1760)
            {
                _1678 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1770 = _1678;
            _1680 = _1770;
            if (!_1760)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1772 = _1686;
            bool _1774 = !_1760;
            _1688 = _1772;
            if (!_1774)
            {
                bool _1776 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1778 = isnan(_1624);
                bool _1780 = _1776 || _1778;
                bool _1782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1784 = _1780 || _1782;
                if (!_1784)
                {
                    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1788 = _1624 + _1786;
                    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1792 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1790;
                    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1798 = 1.0 / _1792;
                    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1816 = _1788 * _1798;
                    float _1818 = precise::clamp(_1816, 0.0, 1.0);
                    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1824 = fma(_1818, _1796, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1826 = fma(_1818, _1822, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1828 = fma(_1818, _1802, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1830 = fma(_1818, _1806, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1832 = fma(_1818, _1810, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1834 = fma(_1818, _1814, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1662 = _1824;
                    _1680 = _1832;
                    _1656 = _1828;
                    _1674 = _1830;
                    _1668 = _1826;
                    _1688 = _1834;
                    _1750 = true;
                }
                else
                {
                    _1662 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1680 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1656 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1674 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1668 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1750 = false;
    float _1836 = _1662;
    float _1838 = _1680;
    float _1840 = _1656;
    float _1842 = _1674;
    float _1844 = _1668;
    float _1846 = _1688;
    float _1848 = fma(_1314, -0.5, 0.5);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = -_1836;
    float _1854 = _1852 + _1838;
    float _1856 = -_1840;
    float _1858 = _1856 + _1842;
    float _1860 = -_1844;
    float _1862 = _1860 + _1846;
    float _1864 = rsqrt(_1616);
    float _1866 = fma(_1850, _1854, _1836);
    float _1868 = fma(_1850, _1858, _1840);
    float _1870 = fma(_1850, _1862, _1844);
    bool _1872 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1874 = _1866 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _1876 = fma(_1868, 0.298911988735198974609375, _1874);
    out.m_86.x = 0.0;
    float _1878 = fma(_1870, 0.114477999508380889892578125, _1876);
    float _1880 = _1584 * _1864;
    float _1882 = -_1878;
    float _1884 = _1868 + _1882;
    float _1886 = -_1878;
    float _1888 = _1866 + _1886;
    float _1890 = -_1878;
    float _1892 = _1870 + _1890;
    float _1894 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1896 = fma(_1884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    float _1898 = fma(_1888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    float _1900 = fma(_1892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    out.m_88.x = 0.0;
    float _1902 = _1570 * _1864;
    float _1904 = _1418 * _1864;
    out.m_84.w = _1894;
    out.m_90.x = _1896;
    out.m_90.y = _1898;
    out.m_90.z = _1900;
    if (!_1872)
    {
        return out;
    }
    float _1906 = -_1286;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1910 = -_869;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1914 = -_873;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1918 = _1908 * _1908;
    float _1920 = fma(_1912, _1912, _1918);
    float _1922 = fma(_1916, _1916, _1920);
    float _1924 = rsqrt(_1922);
    float _1926 = _1908 * _1924;
    float _1928 = _1912 * _1924;
    float _1930 = _1916 * _1924;
    float _1932 = sqrt(_1922);
    float _1934 = -_1904;
    float _1936 = _1934 + _1926;
    float _1938 = -_1902;
    float _1940 = _1938 + _1928;
    float _1942 = -_1880;
    float _1944 = _1942 + _1930;
    float _1946 = _1936 * _1936;
    float _1948 = fma(_1940, _1940, _1946);
    float _1950 = fma(_1944, _1944, _1948);
    float _1952 = -_1932;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1956 = rsqrt(_1950);
    float _1958 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = abs(_1960);
    float _1964 = log2(_1962);
    float _1966 = _1936 * _1956;
    float _1968 = _1940 * _1956;
    float _1970 = _1944 * _1956;
    float _1972 = _1314 * _1966;
    float _1974 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1314 * _1926;
    float _1980 = fma(_1320, _1968, _1972);
    float _1982 = _1976 * _1976;
    float _1984 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1986 = fma(_1320, _1928, _1978);
    float _1988 = fma(_1322, _1970, _1980);
    float _1990 = precise::clamp(_1988, 0.0, 1.0);
    float _1992 = _1982 + (-1.0);
    float _1994 = fma(_1322, _1930, _1986);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = _1990 * _1990;
    float _2000 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2002 = exp2(_1984);
    float _2004 = fma(_1998, _1992, 1.0);
    float _2006 = -_1926;
    float _2008 = -_2000;
    float _2010 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2008);
    float _2012 = _2004 * _2004;
    float _2014 = -_1930;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2010);
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2020 = _2016 + _2018;
    float _2022 = 1.0 / _2012;
    float _2024 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2026 = precise::clamp(_2024, 0.0, 1.0);
    float _2028 = _2002 * _2026;
    float _2030 = _1996 * _2028;
    float _2032 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2034 = _1982 * _2022;
    float _2036 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2038 = _2030 * _2034;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2044 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2032;
    out.m_86.y = _2036;
    out.m_86.z = _2040;
    out.m_88.x = _2042;
    out.m_88.y = _2044;
    out.m_88.z = _2046;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1750 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_49.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_52.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_125);
        out.gl_Position.z = _2103;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_54.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_139)
    {
        float _145 = float(_109);
        _119 = _145;
    }
    float _147 = _119;
    bool _149 = _143 >= _147;
    bool _151 = !_139;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_52.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    float _163 = as_type<float>(_161);
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_161);
        out.gl_Position.z = _2174;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_56.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = in.m_56.y;
    float _171 = in.m_58.z;
    float _173 = in.m_58.y;
    float _175 = in.m_60.z;
    float _177 = in.m_60.y;
    float _179 = _165 * _165;
    float _181 = in.m_56.x;
    float _183 = _169 * _169;
    float _185 = in.m_58.x;
    float _187 = fma(_171, _171, _179);
    float _189 = in.m_60.x;
    float _191 = fma(_173, _173, _183);
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _191);
    float _197 = sqrt(_193);
    float _199 = in.m_62.x;
    float _201 = in.m_62.y;
    float _203 = in.m_62.z;
    float _205 = sqrt(_195);
    bool _207 = _197 > 0.0;
    bool _209 = _205 > 0.0;
    float _211 = _169 * _201;
    float _213 = _173 * _201;
    float _215 = _177 * _201;
    float _217 = _193;
    float _219 = _213;
    float _221 = _195;
    if (_207)
    {
        float _223 = rsqrt(_193);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = fma(_199, _181, _211);
    float _229 = fma(_199, _185, _213);
    float _231 = fma(_199, _189, _215);
    float _233 = _231;
    if (!_207)
    {
        _219 = 0.0;
    }
    float _235 = _219;
    float _237 = fma(_165, _203, _227);
    float _239 = fma(_171, _203, _229);
    float _241 = fma(_175, _203, _231);
    float _243 = 0.0;
    float _245 = _235;
    if (_209)
    {
        float _247 = rsqrt(_195);
        _243 = _247;
    }
    float _249 = _243;
    if (!_209)
    {
        _163 = 0.0;
    }
    float _251 = _163;
    float _253 = 0.0;
    float _255 = _251;
    if (!_209)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_209)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _225;
    float _267 = _263;
    if (_207)
    {
        float _269 = _225 * 0.001000000047497451305389404296875;
        _233 = _269;
    }
    float _271 = _233;
    if (!_207)
    {
        _221 = 0.0;
    }
    float _273 = _221;
    float _275 = _273;
    if (!_207)
    {
        _265 = 0.0;
    }
    float _277 = _265;
    float _279 = _277;
    if (_207)
    {
        float _281 = _165 * _271;
        _245 = _281;
    }
    float _283 = _245;
    if (_207)
    {
        float _285 = _171 * _271;
        _275 = _285;
    }
    float _287 = _275;
    if (_207)
    {
        float _289 = _175 * _271;
        _279 = _289;
    }
    float _291 = _279;
    if (_209)
    {
        float _293 = _249 * _169;
        _255 = _293;
    }
    float _295 = _255;
    float _297 = _295;
    if (_209)
    {
        float _299 = _249 * _173;
        _261 = _299;
    }
    float _301 = _261;
    float _303 = _301;
    if (_209)
    {
        float _305 = _249 * _177;
        _267 = _305;
    }
    float _307 = _267;
    bool _309 = !_167;
    float _311 = _307;
    float _329;
    if (!_309)
    {
        float _313 = in.m_64.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        float _333 = float(_109);
        float _335 = 1.0 / _333;
        float _337 = _143 * _335;
        _329 = _337;
    }
    _331 = false;
    float _339 = _329;
    float _341 = in.m_49.x;
    float _343 = in.m_49.y;
    float _345 = in.m_49.z;
    float _347 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
    float _349 = in.m_66.x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    float _363 = 1.0 / _353;
    float _365 = in.m_64.x;
    float _367 = 1.0 / _357;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _339 + _369;
    float _373 = _173 * _343;
    float _375 = _177 * _343;
    float _377 = 1.0 / _361;
    float _379 = fma(_185, _341, _373);
    float _381 = fma(_189, _341, _375);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _339 + _383;
    float _387 = _237 * _237;
    float _389 = fma(_171, _345, _379);
    float _391 = fma(_175, _345, _381);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _339 + _393;
    float _397 = _385 * _363;
    float _399 = fma(_239, _239, _387);
    bool _401 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_339);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = abs(_349);
    float _415 = log2(_413);
    float _417 = _395 * _367;
    float _419 = _241 * _347;
    float _421 = fma(_241, _241, _399);
    float _423 = _239 * _347;
    float _425 = _371 * _377;
    float _427 = _419 * _419;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    float _433 = rsqrt(_421);
    float _435 = fma(_423, _423, _427);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _441;
    float _445 = fma(_431, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _447 = fma(_439, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _449 = sqrt(_435);
    float _451 = _415 * 0.5;
    bool _453 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _455 = isnan(_339);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = fma(_443, _397, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _467 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _469 = isnan(_339);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _483 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _485 = isnan(_339);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -_463;
    float _497 = _495 + 1.0;
    float _499 = exp2(_451);
    float _501 = _239 * _433;
    float _503 = _241 * _433;
    float _505 = _477 * _497;
    float _507 = -_477;
    float _509 = _507 + 1.0;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_481, _417, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _521 = _449 * 200.0;
    float _523 = fma(_513, _417, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _525 = fma(_517, _417, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _527 = in.m_60.w;
    float _529 = fma(_143, 0.20000000298023223876953125, _521);
    float _531 = _237 * _433;
    float _533 = _411 * _509;
    float _535 = -_411;
    float _537 = _535 + 1.0;
    float _539 = fma(_499, 0.942477881908416748046875, _529);
    float _541 = _531 * _295;
    float _543 = _493 * _537;
    float _545 = fma(_365, 6.283185482025146484375, _539);
    float _547 = fma(_501, _301, _541);
    float _549 = -_493;
    float _551 = _549 + 1.0;
    float _553 = _445 * _543;
    float _555 = _545 * 0.15915493667125701904296875;
    float _557 = fma(_503, _307, _547);
    float _559 = _447 * _543;
    float _561 = _465 * _543;
    float _563 = _555 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].y, _553);
    float _569 = abs(_557);
    bool _571 = _569 > 0.99989998340606689453125;
    float _573 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _575;
    float _579 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].z, _561);
    float _581 = fma(_525, _533, _567);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _583;
    float _587 = in.m_68.x;
    float _589 = in.m_68.y;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _591;
    float _595 = fma(_577, _425, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _597 = fma(_585, _425, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _599 = fma(_519, _533, _573);
    float _601 = _343;
    float _603 = _501;
    float _605 = _503;
    if (_571)
    {
        float _607 = _301 + _287;
        _303 = _607;
    }
    float _609 = _303;
    float _611 = _565 * 0.349065840244293212890625;
    if (_571)
    {
        float _613 = _295 + _283;
        _297 = _613;
    }
    float _615 = _297;
    if (_571)
    {
        float _617 = _307 + _291;
        _311 = _617;
    }
    float _619 = _311;
    float _621 = -_609;
    float _623 = _503 * _621;
    float _625 = fma(_593, _425, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _627 = _611 * 0.15915493667125701904296875;
    float _629 = in.m_70.x;
    float _631 = in.m_70.y;
    float _633 = in.m_70.z;
    float _635 = -_619;
    float _637 = _531 * _635;
    float _639 = fma(_523, _533, _579);
    float _641 = -_619;
    float _643 = -_623;
    float _645 = fma(_501, _641, _643);
    float _647 = _627 * 6.283185482025146484375;
    float _649 = cos(_647);
    float _651 = -_615;
    float _653 = -_637;
    float _655 = fma(_503, _651, _653);
    float _657 = -_615;
    float _659 = _501 * _657;
    float _661 = _645 * _645;
    float _663 = fma(_595, _505, _599);
    float _665 = in.m_68.z;
    float _667 = -_609;
    float _669 = -_659;
    float _671 = fma(_531, _667, _669);
    float _673 = fma(_655, _655, _661);
    float _675 = _627 * 6.283185482025146484375;
    float _677 = sin(_675);
    float _679 = fma(_597, _505, _581);
    float _681 = fma(_625, _505, _639);
    float _683 = fma(_671, _671, _673);
    float _685 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].x, _663);
    float _687 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].y, _679);
    float _689 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[146].z, _681);
    float _691 = rsqrt(_683);
    float _693 = _649 * _589;
    float _695 = in.m_58.w;
    float _697 = _391 + _527;
    float _699 = _687 * _631;
    float _701 = _685 * _629;
    float _703 = _689 * _633;
    float _705 = fma(_677, _587, _693);
    float _707 = _677 * _589;
    float _709 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _715 = -_707;
    float _717 = fma(_649, _587, _715);
    float _719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _665);
    float _721 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _723 = _709 * _713;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _717);
    float _727 = _645 * _691;
    float _729 = _671 * _691;
    float _731 = _655 * _691;
    float _733 = _711 * _725;
    float _735 = _501 * _727;
    float _737 = _723 * _503;
    float _739 = _531 * _729;
    float _741 = _721 * _719;
    float _743 = -_735;
    float _745 = fma(_531, _731, _743);
    float _747 = _723 * _501;
    float _749 = fma(_733, _729, _737);
    float _751 = -_739;
    float _753 = fma(_503, _727, _751);
    float _755 = _389 + _695;
    float _757 = fma(_733, _731, _747);
    float _759 = fma(_741, _745, _749);
    float _761 = _723 * _531;
    float _763 = _503 * _731;
    float _765 = fma(_741, _753, _757);
    float _767 = _697 + _759;
    float _769 = fma(_733, _727, _761);
    float _771 = in.m_72.y;
    float _773 = _755 + _765;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _777 = _767 + _775;
    float _779 = -_763;
    float _781 = fma(_501, _729, _779);
    float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _785 = _773 + _783;
    float _787 = _777 * _777;
    float _789 = fma(_741, _781, _769);
    float _791 = fma(_785, _785, _787);
    float _793 = sqrt(_791);
    float _795 = _343 + _771;
    float _797 = _795 + _789;
    bool _799 = _793 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _801 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _803 = _793 + _801;
    float _805 = _561;
    float _807 = _769;
    float _809 = _733;
    float _811 = _721;
    float _813 = _797;
    if (_799)
    {
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _805 = _815;
    }
    float _817 = _805;
    if (_799)
    {
        float _819 = _797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _819;
    }
    float _821 = _601;
    if (!_799)
    {
        _807 = _767;
    }
    float _823 = _807;
    float _825 = _823;
    if (_799)
    {
        float _827 = rsqrt(_791);
        _809 = _827;
    }
    float _829 = _809;
    float _831 = _817;
    float _833 = _829;
    if (_799)
    {
        float _835 = _803 * _817;
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _837;
    if (_799)
    {
        float _841 = _837 * 0.15915493667125701904296875;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = _803;
    if (_799)
    {
        float _847 = _843 * 6.283185482025146484375;
        float _849 = sin(_847);
        _845 = _849;
    }
    float _851 = _845;
    float _853 = _851;
    if (_799)
    {
        float _855 = fma(_851, _821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _811 = _855;
    }
    float _857 = _811;
    if (!_799)
    {
        _853 = _773;
    }
    float _859 = _853;
    float _861 = _859;
    if (_799)
    {
        float _863 = _829 * _857;
        _833 = _863;
    }
    float _865 = _833;
    if (_799)
    {
        float _867 = fma(_785, _865, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _861 = _867;
    }
    float _869 = _861;
    if (_799)
    {
        float _871 = fma(_777, _865, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _825 = _871;
    }
    float _873 = _825;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _877 = _869 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _881 = _873 + _879;
    float _883 = fma(_877, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _885 = fma(_881, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3290 = float2(_883, _885);
    float _887 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3290, float2(0.0), isnan(_3290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3290, float2(0.0), isnan(_3290)), level(0.0)).x;
    float _889 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _891 = fma(_887, 100.0, _795);
    float _893 = _891 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _897 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _901 = _891 + _889;
    float _903 = _897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _905 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].x, _899);
    float _907 = 1.0 / _903;
    float _909 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _905);
    float _911 = _909 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _913 = _911 + _903;
    float _915 = _913 * _907;
    float _917 = _915 * 0.5;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _921 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _919);
    float _923 = 1.0 / _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _927 = _923 * _925;
    bool _929 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _931 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _933 = !_929;
    int _935 = _933 ? 0 : 1;
    int _937 = 2;
    if (!_929)
    {
        _937 = 1;
    }
    int _939 = _937;
    int _941 = _939;
    if (!_931)
    {
        _941 = _935;
    }
    int _943 = _941;
    int _945 = _943 << 6;
    int _947 = _945 + 96;
    uint _950 = uint(int(uint(_947) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c15)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c15)._m0[int(_960)][_962];
    int _966 = _945 + 104;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.vp_c15)._m0[int(_970)][_972];
    int _976 = int(_968) + 1;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    int _980 = _976 & 3;
    float _982 = (*spvDescriptorSet0.vp_c15)._m0[int(_978)][_980];
    int _984 = _945 + 48;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.vp_c15)._m0[int(_996)][_998];
    int _1002 = _945 + 64;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.vp_c15)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.vp_c15)._m0[int(_1014)][_1016];
    int _1020 = _945 + 56;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    uint _1024 = uint(int(uint(int(_1022)) >> uint(2)));
    int _1026 = int(_1022) & 3;
    float _1028 = (*spvDescriptorSet0.vp_c15)._m0[int(_1024)][_1026];
    int _1030 = int(_1022) + 1;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    int _1034 = _1030 & 3;
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[int(_1032)][_1034];
    int _1038 = _945 + 72;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
    int _1044 = int(_1040) & 3;
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[int(_1042)][_1044];
    int _1048 = int(_1040) + 1;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    int _1052 = _1048 & 3;
    float _1054 = (*spvDescriptorSet0.vp_c15)._m0[int(_1050)][_1052];
    float _1056 = _901 * _964;
    float _1058 = fma(_755, _956, _1056);
    float _1060 = fma(_697, _974, _1058);
    float _1062 = _1060 + _982;
    int _1064 = _945 + 80;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    float _1082 = _901 * _1000;
    float _1084 = 1.0 / _1062;
    float _1086 = fma(_755, _992, _1082);
    int _1088 = _945 + 88;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.vp_c15)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.vp_c15)._m0[int(_1100)][_1102];
    float _1106 = _901 * _1018;
    float _1108 = fma(_755, _1010, _1106);
    float _1110 = fma(_697, _1028, _1086);
    float _1112 = _1110 + _1036;
    float _1114 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1116 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1118 = fma(_697, _1046, _1108);
    float _1120 = floor(_1114);
    float _1122 = _1112 * _1084;
    float _1124 = _1118 + _1054;
    bool _1126 = _1122 >= 0.0;
    float _1128 = _1124 * _1084;
    float _1130 = floor(_1116);
    bool _1132 = _1122 <= 1.0;
    bool _1134 = _1132 && _1126;
    bool _1136 = _1128 >= 0.0;
    bool _1138 = _1136 && _1134;
    bool _1140 = _1128 <= 1.0;
    bool _1142 = _1140 && _1138;
    float _1144 = _901 * _1080;
    float _1146 = -_1130;
    float _1148 = _1116 + _1146;
    float _1150 = fma(_755, _1072, _1144);
    float _1152 = fma(_697, _1096, _1150);
    float _1154 = -_1120;
    float _1156 = _1114 + _1154;
    float _1158 = _1110;
    if (_1142)
    {
        float _1160 = float(_943);
        _1158 = _1160;
    }
    float _1162 = _1158;
    float _1164 = _1152 + _1104;
    float _1166 = _1144;
    if (_1142)
    {
        float _1168 = rint(_1162);
        float _1170 = precise::max(_1168, 0.0);
        uint _1172 = uint(_1170);
        uint _1174 = clamp(_1172, 0u, 65535u);
        _1166 = as_type<float>(_1174);
    }
    float _1176 = _1166;
    float2 _3783 = float2(_1156, _1148);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3783, float2(0.0), isnan(_3783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3783, float2(0.0), isnan(_3783)), level(0.0)).x;
    float _1180 = _1164 * _1084;
    float _1182 = _1128;
    if (_1142)
    {
        float3 _3801 = float3(_1122, _1128, float(as_type<int>(_1176)));
        float3 _3805 = select(_3801, float3(0.0), isnan(_3801));
        float _1184 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3805.xy, uint(rint(_3805.z)), _1180, level(0.0));
        _1182 = _1184;
    }
    float _1186 = _1182;
    float _1188 = in.m_74.x;
    float _1190 = in.m_74.y;
    bool _1192 = _705 != 0.0;
    bool _1194 = isnan(_705);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    float _1202 = _843;
    if (_799)
    {
        float _1204 = _843 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = in.m_74.z;
    bool _1212 = _717 == 0.0;
    bool _1214 = !_1200;
    bool _1216 = _1212 && _1214;
    bool _1218 = _665 == 0.0;
    bool _1220 = _1218 && _1216;
    float _1222 = _649 * _1190;
    float _1224 = _677 * _1190;
    float _1226 = fma(_677, _1188, _1222);
    float _1228 = _1210;
    float _1230 = _1226;
    if (!_1220)
    {
        float _1232 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1210);
        _1228 = _1232;
    }
    float _1234 = _1228;
    float _1236 = -_1224;
    float _1238 = fma(_649, _1188, _1236);
    float _1240 = _1238;
    if (!_1220)
    {
        float _1242 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1226);
        _1230 = _1242;
    }
    float _1244 = _1230;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1252 = _501 * _1244;
    if (_799)
    {
        float _1254 = _1208 + (-1.0);
        _603 = _1254;
    }
    float _1256 = _603;
    float _1258 = _531 * _1244;
    float _1260 = _503 * _1244;
    if (!_1220)
    {
        float _1262 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1238);
        _1240 = _1262;
    }
    float _1264 = _1240;
    if (_799)
    {
        float _1266 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _605 = _1266;
    }
    float _1268 = _605;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1272 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_799)
    {
        float _1276 = fma(_797, _1208, _1268);
        _813 = _1276;
    }
    float _1278 = _813;
    float _1280 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = fma(_727, _1264, _1258);
    float _1284 = _901 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1286 = fma(_887, 100.0, _1278);
    float _1288 = fma(_731, _1264, _1252);
    out.m_76.x = _1272;
    out.m_76.y = _1274;
    out.m_76.z = _1280;
    out.m_76.w = _1270;
    float _1290 = fma(_729, _1264, _1260);
    float _1292 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1284);
    float _1294 = _901 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1296 = abs(_927);
    float _1298 = log2(_1296);
    float _1300 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1292);
    float _1304 = fma(_755, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1294);
    float _1306 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1308 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1310 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1306);
    float _1312 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1308);
    float _1314 = fma(_781, _1234, _1282);
    float _1316 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1318 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1320 = fma(_753, _1234, _1288);
    float _1322 = fma(_745, _1234, _1290);
    float _1324 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1316);
    float _1326 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1318);
    float _1328 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1310);
    float _1332 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1324);
    float _1334 = _1302 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1336 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1304);
    float _1338 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1326);
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1342 = trunc(_1334);
    int _1344 = int(_1342);
    float _1346 = _1336 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1348 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1350 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1356 = trunc(_1346);
    int _1358 = int(_1356);
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1352);
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1354);
    float _1370 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1372 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1374 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = exp2(_1364);
    float _1378 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1380 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1370);
    float _1382 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1372);
    int _1384 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1386 = _1344 + _1384;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1392 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1378);
    int _1394 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1396 = _1358 + _1394;
    int _1398 = _1396 + 1;
    float _1400 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1380);
    float _1402 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    bool _1404 = _1388 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1406 = _1388 | _1398;
    out.gl_Position.x = _1390;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _1400;
    out.gl_Position.w = _1402;
    float _1408 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    bool _1412 = _1406 < 0;
    bool _1414 = _1412 || _1404;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1286 + _1416;
    bool _1420 = _927 <= 8000.0;
    bool _1422 = isnan(_927);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(8000.0);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = fma(_1410, -2.0, 3.0);
    bool _1434 = _1398 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1436 = _1434 || _1414;
    float _1438 = _1410 * _1410;
    float _1440 = _1438 * _1432;
    float _1442 = -_1440;
    float _1444 = _1442 + 1.0;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1440);
    float _1448 = _1444;
    float _1450 = as_type<float>(_1388);
    if (_1436)
    {
        _1448 = 1.0;
    }
    float _1452 = _1448;
    float _1454 = _1452;
    if (!_1436)
    {
        int _1456 = _1398 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1458 = _1456 + _1388;
        float _1460 = floor(_1346);
        int _1462 = _1458 << 2;
        uint _1464 = uint(int(uint(_1458) >> uint(2)));
        int _1466 = 12 & _1462;
        int _1468 = int(_1464) << 4;
        int _1470 = _1468 + _1466;
        float _1472 = floor(_1334);
        float _1474 = -_1460;
        float _1476 = _1346 + _1474;
        int _1478 = _1470 + 400;
        uint _1480 = uint(int(uint(_1478) >> uint(2)));
        uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
        int _1484 = int(_1480) & 3;
        float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
        float _1488 = -_1472;
        float _1490 = _1334 + _1488;
        float _1492 = rint(_1486);
        float _1494 = precise::max(_1492, 0.0);
        uint _1496 = uint(_1494);
        uint _1498 = clamp(_1496, 0u, 65535u);
        float3 _4390 = float3(_1490, _1476, float(int(_1498)));
        float3 _4392 = select(_4390, float3(0.0), isnan(_4390));
        float _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4392.xy, uint(rint(_4392.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4392.xy, uint(rint(_4392.z)), level(0.0)).x;
        int _1502 = _1458 << 4;
        int _1504 = _1502 + 2048;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
        int _1510 = int(_1506) & 3;
        float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
        int _1514 = int(_1506) + 1;
        uint _1516 = uint(int(uint(_1514) >> uint(2)));
        int _1518 = _1514 & 3;
        float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
        int _1522 = _1504 + 8;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
        int _1528 = int(_1524) & 3;
        float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
        int _1532 = int(_1524) + 1;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        int _1536 = _1532 & 3;
        float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
        float _1540 = _901 * _1520;
        float _1542 = fma(_755, _1512, _1540);
        float _1544 = fma(_697, _1530, _1542);
        float _1546 = _1544 + _1538;
        float _1548 = precise::clamp(_1546, 0.0, 1.0);
        float _1550 = -_1548;
        float _1552 = _1550 + _1500;
        float _1554 = fma(_1552, 500.0, 1.5);
        float _1556 = exp2(_1554);
        float _1558 = 0.0 + _1556;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1450 = _1486;
        _1454 = _1560;
    }
    float _1562 = _1450;
    float _1564 = _1454;
    float _1566 = _1430 * _1446;
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1570 = _869 + _1568;
    float _1572 = in.m_66.w;
    float _1574 = _1418 * _1418;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1578 = -_1178;
    float _1580 = _1578 + 1.0;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _873 + _1582;
    float _1586 = _1562;
    float _1588 = _1576;
    float _1590 = _1566;
    if (!_1142)
    {
        _1586 = 1.0;
    }
    float _1592 = _1586;
    float _1594 = fma(_1570, _1570, _1574);
    float _1596 = _1592;
    if (_1142)
    {
        bool _1598 = _1186 >= _1180;
        bool _1600 = isnan(_1186);
        bool _1602 = _1598 || _1600;
        bool _1604 = isnan(_1180);
        bool _1606 = _1602 || _1604;
        float _1608 = float(_1606);
        _1596 = _1608;
    }
    float _1610 = _1596;
    float _1612 = _1580 * _1576;
    float _1614 = precise::clamp(_1612, 0.0, 1.0);
    float _1616 = fma(_1584, _1584, _1594);
    out.m_78.x = _1320;
    out.m_78.y = _1314;
    out.m_78.z = _1322;
    float _1618 = _1610 * _1564;
    float _1620 = -_1614;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1624 = sqrt(_1616);
    out.m_80.x = _869;
    out.m_80.y = _1286;
    out.m_80.z = _873;
    float _1626 = -_1618;
    float _1628 = fma(_1626, _1622, 1.0);
    float _1630 = precise::clamp(_1628, 0.0, 1.0);
    float _1632 = _1630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.w = _1572;
    out.m_84.x = _1632;
    bool _1634 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1636 = isnan(_1624);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1642 = _1638 || _1640;
    float _1644 = _1614;
    float _1646 = _1610;
    float _1648 = _1618;
    float _1650 = _1630;
    if (!_1642)
    {
        _1644 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    float _1656 = _1652;
    if (!_1642)
    {
        _1588 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1658 = _1588;
    float _1660 = _1658;
    float _1662 = _1658;
    if (!_1642)
    {
        _1590 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1664 = _1590;
    float _1666 = _1664;
    float _1668 = _1664;
    if (!_1642)
    {
        _1646 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1670 = _1646;
    float _1672 = _1670;
    float _1674 = _1670;
    if (!_1642)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1676 = _1648;
    float _1678 = _1676;
    float _1680 = _1676;
    if (!_1642)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1682 = _1650;
    bool _1684 = !_1642;
    float _1686 = _1682;
    float _1688 = _1682;
    if (!_1684)
    {
        bool _1690 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1692 = isnan(_1624);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1702 = _1624 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1706 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1712 = 1.0 / _1706;
            float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1716 = _1714 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1730 = _1702 * _1712;
            float _1732 = precise::clamp(_1730, 0.0, 1.0);
            float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1738 = fma(_1732, _1710, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1740 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1742 = fma(_1732, _1716, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1744 = fma(_1732, _1720, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1746 = fma(_1732, _1724, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1748 = fma(_1732, _1728, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1662 = _1738;
            _1680 = _1746;
            _1656 = _1742;
            _1674 = _1744;
            _1668 = _1740;
            _1688 = _1748;
            _1750 = true;
        }
        else
        {
            bool _1752 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1754 = isnan(_1624);
            bool _1756 = _1752 || _1754;
            bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1760 = _1756 || _1758;
            if (!_1760)
            {
                _1654 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1762 = _1654;
            _1656 = _1762;
            if (!_1760)
            {
                _1660 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1764 = _1660;
            _1662 = _1764;
            if (!_1760)
            {
                _1666 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1766 = _1666;
            _1668 = _1766;
            if (!_1760)
            {
                _1672 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1768 = _1672;
            _1674 = _1768;
            if (!_1760)
            {
                _1678 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1770 = _1678;
            _1680 = _1770;
            if (!_1760)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1772 = _1686;
            bool _1774 = !_1760;
            _1688 = _1772;
            if (!_1774)
            {
                bool _1776 = _1624 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1778 = isnan(_1624);
                bool _1780 = _1776 || _1778;
                bool _1782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1784 = _1780 || _1782;
                if (!_1784)
                {
                    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1788 = _1624 + _1786;
                    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1792 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1790;
                    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1798 = 1.0 / _1792;
                    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1806 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1816 = _1788 * _1798;
                    float _1818 = precise::clamp(_1816, 0.0, 1.0);
                    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1824 = fma(_1818, _1796, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1826 = fma(_1818, _1822, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1828 = fma(_1818, _1802, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1830 = fma(_1818, _1806, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1832 = fma(_1818, _1810, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1834 = fma(_1818, _1814, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1662 = _1824;
                    _1680 = _1832;
                    _1656 = _1828;
                    _1674 = _1830;
                    _1668 = _1826;
                    _1688 = _1834;
                    _1750 = true;
                }
                else
                {
                    _1662 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1680 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1656 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1674 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1668 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1750 = false;
    float _1836 = _1662;
    float _1838 = _1680;
    float _1840 = _1656;
    float _1842 = _1674;
    float _1844 = _1668;
    float _1846 = _1688;
    float _1848 = fma(_1314, -0.5, 0.5);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = -_1836;
    float _1854 = _1852 + _1838;
    float _1856 = -_1840;
    float _1858 = _1856 + _1842;
    float _1860 = -_1844;
    float _1862 = _1860 + _1846;
    float _1864 = rsqrt(_1616);
    float _1866 = fma(_1850, _1854, _1836);
    float _1868 = fma(_1850, _1858, _1840);
    float _1870 = fma(_1850, _1862, _1844);
    bool _1872 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1874 = _1866 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _1876 = fma(_1868, 0.298911988735198974609375, _1874);
    out.m_86.x = 0.0;
    float _1878 = fma(_1870, 0.114477999508380889892578125, _1876);
    float _1880 = _1584 * _1864;
    float _1882 = -_1878;
    float _1884 = _1868 + _1882;
    float _1886 = -_1878;
    float _1888 = _1866 + _1886;
    float _1890 = -_1878;
    float _1892 = _1870 + _1890;
    float _1894 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1896 = fma(_1884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    float _1898 = fma(_1888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    float _1900 = fma(_1892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1878);
    out.m_88.x = 0.0;
    float _1902 = _1570 * _1864;
    float _1904 = _1418 * _1864;
    out.m_84.w = _1894;
    out.m_90.x = _1896;
    out.m_90.y = _1898;
    out.m_90.z = _1900;
    if (!_1872)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1906 = -_1286;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1910 = -_869;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1914 = -_873;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1918 = _1908 * _1908;
    float _1920 = fma(_1912, _1912, _1918);
    float _1922 = fma(_1916, _1916, _1920);
    float _1924 = rsqrt(_1922);
    float _1926 = _1908 * _1924;
    float _1928 = _1912 * _1924;
    float _1930 = _1916 * _1924;
    float _1932 = sqrt(_1922);
    float _1934 = -_1904;
    float _1936 = _1934 + _1926;
    float _1938 = -_1902;
    float _1940 = _1938 + _1928;
    float _1942 = -_1880;
    float _1944 = _1942 + _1930;
    float _1946 = _1936 * _1936;
    float _1948 = fma(_1940, _1940, _1946);
    float _1950 = fma(_1944, _1944, _1948);
    float _1952 = -_1932;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1956 = rsqrt(_1950);
    float _1958 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = abs(_1960);
    float _1964 = log2(_1962);
    float _1966 = _1936 * _1956;
    float _1968 = _1940 * _1956;
    float _1970 = _1944 * _1956;
    float _1972 = _1314 * _1966;
    float _1974 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1976 = precise::clamp(_1974, 0.0, 1.0);
    float _1978 = _1314 * _1926;
    float _1980 = fma(_1320, _1968, _1972);
    float _1982 = _1976 * _1976;
    float _1984 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1986 = fma(_1320, _1928, _1978);
    float _1988 = fma(_1322, _1970, _1980);
    float _1990 = precise::clamp(_1988, 0.0, 1.0);
    float _1992 = _1982 + (-1.0);
    float _1994 = fma(_1322, _1930, _1986);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = _1990 * _1990;
    float _2000 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2002 = exp2(_1984);
    float _2004 = fma(_1998, _1992, 1.0);
    float _2006 = -_1926;
    float _2008 = -_2000;
    float _2010 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2008);
    float _2012 = _2004 * _2004;
    float _2014 = -_1930;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2010);
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2020 = _2016 + _2018;
    float _2022 = 1.0 / _2012;
    float _2024 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2026 = precise::clamp(_2024, 0.0, 1.0);
    float _2028 = _2002 * _2026;
    float _2030 = _1996 * _2028;
    float _2032 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2034 = _1982 * _2022;
    float _2036 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2038 = _2030 * _2034;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2044 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2032;
    out.m_86.y = _2036;
    out.m_86.z = _2040;
    out.m_88.x = _2042;
    out.m_88.y = _2044;
    out.m_88.z = _2046;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

