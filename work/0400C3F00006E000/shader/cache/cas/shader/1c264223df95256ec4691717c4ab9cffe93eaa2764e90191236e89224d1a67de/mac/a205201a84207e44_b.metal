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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
    device _21* cp_s12 [[id(12)]];
    device _21* cp_s13 [[id(13)]];
    texture2d_array<float> cp_t_tcb_16 [[id(14)]];
    sampler cp_t_tcb_16Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    sampler cp_t_tcb_14Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _4679 = false;
    bool _3551 = false;
    bool _2859 = false;
    bool _2097 = false;
    bool _1189 = false;
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    float _77 = as_type<float>(gl_WorkGroupID.x);
    int _80 = as_type<int>(_77) << 5;
    int _82 = _80 + as_type<int>(_75);
    float _84 = trunc(_73);
    int _86 = int(_84);
    bool _90 = _82 >= _86;
    int _92 = 0;
    float _94 = as_type<float>(_86);
    if (_90)
    {
        _92 = 0;
    }
    int _96 = _92;
    int _98 = _96;
    int _100 = _96;
    float _102 = 0.0;
    if (!_90)
    {
        int _104 = _82 << 4;
        int _106 = _104 + 12;
        uint _109 = uint(int(uint(_106) >> uint(2)));
        float _111 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_109)]);
        float _113 = trunc(_111);
        int _115 = int(_113);
        bool _117 = _115 >= 1;
        int _119 = _117 ? (-1) : 0;
        _94 = as_type<float>(_106);
        _102 = as_type<float>(_115);
        if (!_117)
        {
            _98 = 0;
        }
        int _121 = _98;
        bool _123 = !_117;
        _100 = _121;
        if (!_123)
        {
            float _125 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _127 = uint(int(uint(_106) >> uint(2)));
            float _129 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_127)]);
            float _131 = float(_115);
            float _133 = -_129;
            float _135 = _125 + _133;
            bool _137 = _135 > _131;
            int _139 = as_type<int>(_125);
            _94 = _129;
            _102 = _131;
            if (!_137)
            {
                bool _141 = _125 >= _129;
                bool _143 = isnan(_125);
                bool _145 = _141 || _143;
                bool _147 = isnan(_129);
                bool _149 = _145 || _147;
                _119 = _149 ? (-1) : 0;
            }
            int _151 = _119;
            if (_137)
            {
                _139 = 0;
            }
            int _153 = _139;
            _100 = _153;
            if (!_137)
            {
                int _155 = ~_151;
                int _157 = (_155 != 0) ? 0 : 1;
                _100 = _157;
            }
        }
    }
    int _159 = _100;
    float _161 = _94;
    float _163 = _102;
    int _165 = _159 & 1;
    bool _167 = _165 != 0;
    if (!_167)
    {
        return;
    }
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _171 = _82 << 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_173)]);
    int _177 = _171 + 4;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_179)]);
    int _183 = _171 + 8;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_185)]);
    int _189 = as_type<int>(_169) & 512;
    bool _191 = _189 != 0;
    int _193 = _171 + 12;
    uint _195 = uint(int(uint(_171) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_195)]);
    int _199 = _171 + 4;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_201)]);
    int _205 = _171 + 8;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_207)]);
    uint _211 = uint(int(uint(_171) >> uint(2)));
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_211)]);
    int _215 = _171 + 4;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_217)]);
    int _221 = _171 + 8;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_223)]);
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = 0.0;
    if (_191)
    {
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _227 = _233;
        _229 = _235;
        _231 = _237;
    }
    float _239 = _227;
    float _241 = _229;
    float _243 = _231;
    float _245 = 0.0;
    float _247 = 0.0;
    float _249 = 0.0;
    if (_191)
    {
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _245 = _251;
        _247 = _253;
        _249 = _255;
    }
    float _257 = _245;
    float _259 = _247;
    float _261 = _249;
    float _263 = as_type<float>(_159);
    float _265 = _161;
    float _267 = _163;
    if (_191)
    {
        float _269 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _271 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _263 = _269;
        _265 = _271;
        _267 = _273;
    }
    float _275 = _263;
    float _277 = _265;
    float _279 = _267;
    uint _281 = uint(int(uint(_171) >> uint(2)));
    float _283 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_281)]);
    int _285 = _171 + 4;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    float _289 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_287)]);
    int _291 = _171 + 8;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    float _295 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_293)]);
    uint _297 = uint(int(uint(_193) >> uint(2)));
    float _299 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_297)]);
    uint _301 = uint(int(uint(_193) >> uint(2)));
    float _303 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_301)]);
    float _305 = _259;
    float _307 = _241;
    float _309 = _277;
    float _311 = _257;
    float _313 = _261;
    float _315 = _239;
    float _317 = _243;
    float _319 = _275;
    float _321 = _279;
    float _323 = _197;
    float _325 = _209;
    float _327 = _209;
    float _329 = _197;
    int _331 = as_type<int>(_213);
    int _333 = as_type<int>(_219);
    int _335 = as_type<int>(_225);
    int _337 = as_type<int>(_213);
    int _339 = as_type<int>(_219);
    int _341 = as_type<int>(_225);
    int _343 = as_type<int>(_213);
    int _345 = as_type<int>(_219);
    int _347 = as_type<int>(_225);
    if (!_191)
    {
        int _349 = _171 + 4;
        uint _351 = uint(int(uint(_171) >> uint(2)));
        float _353 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_351)]);
        int _355 = _171 + 8;
        uint _357 = uint(int(uint(_171) >> uint(2)));
        float _359 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_357)]);
        uint _361 = uint(int(uint(_349) >> uint(2)));
        float _363 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_361)]);
        uint _365 = uint(int(uint(_349) >> uint(2)));
        float _367 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_365)]);
        uint _369 = uint(int(uint(_355) >> uint(2)));
        float _371 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_369)]);
        uint _373 = uint(int(uint(_171) >> uint(2)));
        float _375 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_373)]);
        uint _377 = uint(int(uint(_355) >> uint(2)));
        float _379 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_377)]);
        uint _381 = uint(int(uint(_349) >> uint(2)));
        float _383 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_381)]);
        uint _385 = uint(int(uint(_355) >> uint(2)));
        float _387 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_385)]);
        float _389 = _353 * _353;
        float _391 = fma(_359, _359, _389);
        float _393 = _363 * _363;
        float _395 = fma(_367, _367, _393);
        float _397 = _371 * _371;
        float _399 = fma(_375, _375, _391);
        float _401 = fma(_379, _379, _397);
        float _403 = sqrt(_399);
        float _405 = fma(_383, _383, _395);
        float _407 = fma(_387, _387, _401);
        float _409 = sqrt(_405);
        float _411 = sqrt(_407);
        bool _413 = _403 > 0.0;
        bool _415 = _409 > 0.0;
        bool _417 = _411 > 0.0;
        float _419 = _409;
        float _421 = _411;
        float _423 = _401;
        float _425 = _353;
        float _427 = _403;
        float _429 = _359;
        float _431 = _395;
        float _433 = _363;
        float _435 = _383;
        float _437 = _375;
        if (_413)
        {
            float _439 = rsqrt(_399);
            _419 = _439;
        }
        float _441 = _419;
        float _443 = 0.0;
        if (_415)
        {
            float _445 = rsqrt(_405);
            _443 = _445;
        }
        float _447 = _443;
        float _449 = 0.0;
        if (_417)
        {
            float _451 = rsqrt(_407);
            _449 = _451;
        }
        float _453 = _449;
        if (!_413)
        {
            _421 = 0.0;
        }
        float _455 = _421;
        float _457 = _455;
        if (_413)
        {
            float _459 = _353 * _441;
            _457 = _459;
        }
        float _461 = _457;
        _311 = _461;
        if (!_413)
        {
            _423 = 0.0;
        }
        float _463 = _423;
        float _465 = _463;
        if (_413)
        {
            float _467 = _359 * _441;
            _465 = _467;
        }
        float _469 = _465;
        _315 = _469;
        if (!_413)
        {
            _425 = 0.0;
        }
        float _471 = _425;
        float _473 = _471;
        if (_413)
        {
            float _475 = _375 * _441;
            _473 = _475;
        }
        float _477 = _473;
        _319 = _477;
        if (!_415)
        {
            _427 = 0.0;
        }
        float _479 = _427;
        float _481 = _479;
        if (_415)
        {
            float _483 = _363 * _447;
            _481 = _483;
        }
        float _485 = _481;
        _305 = _485;
        if (!_415)
        {
            _429 = 0.0;
        }
        float _487 = _429;
        float _489 = _487;
        if (_415)
        {
            float _491 = _383 * _447;
            _489 = _491;
        }
        float _493 = _489;
        _309 = _493;
        if (!_415)
        {
            _431 = 0.0;
        }
        float _495 = _431;
        float _497 = _495;
        if (_415)
        {
            float _499 = _367 * _447;
            _497 = _499;
        }
        float _501 = _497;
        _307 = _501;
        if (!_417)
        {
            _433 = 0.0;
        }
        float _503 = _433;
        float _505 = _503;
        if (!_417)
        {
            _435 = 0.0;
        }
        float _507 = _435;
        float _509 = _507;
        if (_417)
        {
            float _511 = _371 * _453;
            _505 = _511;
        }
        float _513 = _505;
        _313 = _513;
        if (!_417)
        {
            _437 = 0.0;
        }
        float _515 = _437;
        _321 = _515;
        if (_417)
        {
            float _517 = _379 * _453;
            _509 = _517;
        }
        float _519 = _509;
        _317 = _519;
        if (_417)
        {
            float _521 = _387 * _453;
            _321 = _521;
        }
    }
    float _523 = _305;
    float _525 = _307;
    float _527 = _309;
    float _529 = _311;
    float _531 = _313;
    float _533 = _315;
    float _535 = _317;
    float _537 = _319;
    float _539 = _321;
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _545 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _547 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _549 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _551 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _553 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _555 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _557 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _559 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _561 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _563 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    float _565 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _567 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _569 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    bool _571 = _547 != 1.0;
    bool _573 = isnan(_547);
    bool _575 = _571 || _573;
    bool _577 = isnan(1.0);
    bool _579 = _575 || _577;
    float _581 = _579 ? _283 : 0.0;
    float _583 = _579 ? _289 : 0.3141500055789947509765625;
    float _585 = _579 ? _295 : 0.92653000354766845703125;
    float _587 = _549 * _581;
    float _589 = _551 * 0.00999999977648258209228515625;
    float _591 = _549 * _583;
    float _593 = _549 * _585;
    float _595 = _549 * _589;
    float _597 = _583;
    float _599 = _585;
    float _601 = _589;
    float _603 = _593;
    float _605 = _553;
    float _607 = _591;
    float _609 = _545;
    float _611 = _595;
    if (_579)
    {
        _597 = _587;
    }
    float _613 = _597;
    float _615 = _613;
    if (_579)
    {
        _599 = _591;
    }
    float _617 = _599;
    float _619 = _617;
    float _621 = _565;
    float _623 = _567;
    float _625 = _569;
    if (!_579)
    {
        float _627 = _553 * 0.00999999977648258209228515625;
        float _629 = _561 * _595;
        float _631 = fma(_289, 2.0, -1.0);
        float _633 = _549 * _627;
        float _635 = fma(_283, 2.0, -1.0);
        float _637 = fma(_295, 2.0, -1.0);
        float _639 = fma(_633, _631, _629);
        float _641 = fma(_633, _635, _629);
        float _643 = fma(_633, _637, _629);
        float _645 = _591 + _639;
        float _647 = _587 + _641;
        float _649 = _593 + _643;
        _601 = _633;
        _615 = _647;
        _619 = _645;
        _603 = _649;
    }
    float _651 = _601;
    float _653 = _615;
    float _655 = _619;
    float _657 = _603;
    float _659 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _661 = -_555;
    float _663 = _661 + 1.0;
    float _665 = -_559;
    float _667 = _665 + 1.0;
    float _669 = _543 * _557;
    float _671 = 0.0;
    float _673 = _653;
    float _675 = _655;
    float _677 = _657;
    if (_579)
    {
        _671 = 0.0;
    }
    float _679 = _671;
    float _681 = _679;
    if (!_579)
    {
        float _683 = _555 * _595;
        _681 = _683;
    }
    float _685 = _681;
    float _687 = fma(_663, _667, _559);
    float _689 = _541 * _557;
    float _691 = abs(_559);
    float _693 = log2(_691);
    float _695 = _669 * _523;
    float _697 = _545 * _557;
    bool _699 = _687 != 1.0;
    bool _701 = isnan(_687);
    bool _703 = _699 || _701;
    bool _705 = isnan(1.0);
    bool _707 = _703 || _705;
    float _709 = fma(_689, _525, _695);
    bool _711 = _685 != 0.0;
    bool _713 = isnan(_685);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    bool _721 = _563 != 1.0;
    bool _723 = isnan(_563);
    bool _725 = _721 || _723;
    bool _727 = isnan(1.0);
    bool _729 = _725 || _727;
    bool _731 = !_707;
    bool _733 = _729 || _731;
    float _735 = -_303;
    float _737 = _561 + _735;
    float _739 = fma(_697, _527, _709);
    float _741 = _555 * _739;
    float _743 = _555 * _693;
    float _745 = exp2(_743);
    if (!_733)
    {
        float _747 = -_687;
        float _749 = _747 + 1.0;
        _605 = _749;
    }
    float _751 = _605;
    float _753 = 0.0;
    if (_733)
    {
        _753 = _737;
    }
    float _755 = _753;
    float _757 = _651;
    float _759 = _755;
    if (!_733)
    {
        float _761 = abs(_687);
        float _763 = log2(_761);
        _757 = _763;
    }
    float _765 = _757;
    float _767 = 0.0;
    if (!_733)
    {
        float _769 = 1.0 / _751;
        _767 = _769;
    }
    float _771 = _767;
    float _773 = _771;
    if (!_733)
    {
        float _775 = _737 * _765;
        _607 = _775;
    }
    float _777 = _607;
    float _779 = _669 * _529;
    float _781 = _669 * _531;
    float _783 = fma(_689, _533, _779);
    float _785 = _777;
    if (!_733)
    {
        float _787 = exp2(_777);
        _785 = _787;
    }
    float _789 = _785;
    float _791 = fma(_689, _535, _781);
    float _793 = fma(_203, _745, _741);
    float _795 = fma(_697, _537, _783);
    float _797 = fma(_697, _539, _791);
    float _799 = _299 * _555;
    float _801 = _555 * _795;
    float _803 = _555 * _797;
    float _805 = fma(_197, _799, _175);
    float _807 = fma(_203, _799, _181);
    float _809 = fma(_197, _745, _801);
    float _811 = fma(_209, _799, _187);
    float _813 = fma(_209, _745, _803);
    float _815 = _789;
    float _817 = _797;
    float _819 = _797;
    if (!_733)
    {
        float _821 = -_789;
        float _823 = _821 + 1.0;
        _815 = _823;
    }
    float _825 = _815;
    if (!_733)
    {
        float _827 = _825 * _771;
        _759 = _827;
    }
    float _829 = _759;
    float _831 = _829 + _653;
    float _833 = _555 + _831;
    float _835 = _833 + _685;
    bool _837 = _659 != 1.0;
    bool _839 = isnan(_659);
    bool _841 = _837 || _839;
    bool _843 = isnan(1.0);
    bool _845 = _841 || _843;
    float _847 = _833;
    float _849 = _833;
    float _851 = _831;
    float _929;
    float _941;
    float _943;
    float _945;
    float _1085;
    float _1117;
    float _1143;
    float _1155;
    float _1163;
    float _1165;
    float _1169;
    float _1173;
    float _1177;
    float _1181;
    float _1185;
    float _1187;
    if (!_719)
    {
        if (_845)
        {
            _847 = 0.60000002384185791015625;
        }
        float _853 = _847;
        float _855 = 0.0;
        if (!_845)
        {
            float _857 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _855 = _857;
        }
        float _859 = _855;
        if (_845)
        {
            _323 = 0.4199999868869781494140625;
        }
        float _861 = _323;
        if (_845)
        {
            _325 = 0.23000000417232513427734375;
        }
        float _863 = _325;
        float _865 = 0.0;
        if (!_845)
        {
            float _867 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _865 = _867;
        }
        float _869 = _865;
        float _871 = _853;
        if (!_845)
        {
            float _873 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _871 = _873;
        }
        float _875 = _871;
        float _877 = _861;
        if (!_845)
        {
            float _879 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _877 = _879;
        }
        float _881 = _877;
        if (_845)
        {
            _817 = 0.1500000059604644775390625;
        }
        float _883 = _817;
        float _885 = _863;
        if (!_845)
        {
            float _887 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _885 = _887;
        }
        float _889 = _885;
        float _891 = _883;
        if (!_845)
        {
            float _893 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _891 = _893;
        }
        float _895 = _891;
        float _897 = 0.0;
        if (!_845)
        {
            float _899 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _897 = _899;
        }
        float _901 = _897;
        float _903 = 0.0;
        if (!_845)
        {
            float _905 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _903 = _905;
        }
        float _907 = _903;
        if (_845)
        {
            _673 = 0.60000002384185791015625;
        }
        float _909 = _673;
        float _911 = _549 * _875;
        float _913 = _909;
        float _915 = _875;
        if (!_845)
        {
            _913 = _875;
        }
        float _917 = _913;
        float _919 = _917;
        if (_845)
        {
            _915 = 0.4199999868869781494140625;
        }
        float _921 = _915;
        float _923 = _549 * _881;
        float _925 = 1.0 / _911;
        float _927 = _921;
        _929 = _859;
        if (!_845)
        {
            _927 = _881;
        }
        float _931 = _927;
        float _933 = _549 * _889;
        float _935 = _549 * _917;
        float _937 = 1.0 / _923;
        float _939 = _931;
        _941 = _869;
        _943 = _901;
        _945 = _907;
        if (_845)
        {
            _919 = 0.23000000417232513427734375;
        }
        float _947 = _919;
        float _949 = _549 * _895;
        float _951 = _947;
        if (!_845)
        {
            _951 = _889;
        }
        float _953 = _951;
        float _955 = _835 * 6.283184051513671875;
        float _957 = _549 * _931;
        float _959 = 1.0 / _933;
        float _961 = _925 * _955;
        if (_845)
        {
            _939 = 0.1500000059604644775390625;
        }
        float _963 = _939;
        float _965 = _963;
        if (!_845)
        {
            _965 = _895;
        }
        float _967 = _965;
        float _969 = 1.0 / _957;
        float _971 = _549 * _953;
        float _973 = _961 * 0.15915493667125701904296875;
        float _975 = 1.0 / _949;
        float _977 = _937 * _955;
        float _979 = 1.0 / _935;
        float _981 = _549 * _967;
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _959 * _955;
        float _987 = 1.0 / _971;
        float _989 = _985 * 0.15915493667125701904296875;
        float _991 = _831 * _969;
        float _993 = _975 * _955;
        float _995 = 1.0 / _981;
        float _997 = _991 * 6.283184051513671875;
        float _999 = _993 * 0.15915493667125701904296875;
        float _1001 = _831 * _979;
        float _1003 = _997 * 0.15915493667125701904296875;
        float _1005 = _1001 * 6.283184051513671875;
        float _1007 = _831 * _987;
        float _1009 = _983 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        float _1013 = _1005 * 0.15915493667125701904296875;
        float _1015 = _1007 * 6.283184051513671875;
        float _1017 = _831 * _995;
        float _1019 = _1003 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1015 * 0.15915493667125701904296875;
        float _1025 = _1017 * 6.283184051513671875;
        float _1027 = _973 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = _1025 * 0.15915493667125701904296875;
        float _1033 = _987;
        float _1035 = _1007;
        float _1037 = _1015;
        float _1039 = _1025;
        if (_845)
        {
            _1033 = 3.0;
        }
        float _1041 = _1033;
        float _1043 = _1041;
        if (_845)
        {
            _1035 = 3.0;
        }
        float _1045 = _1035;
        float _1047 = _1013 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045;
        if (!_845)
        {
            _1043 = _859;
        }
        float _1053 = _1043;
        float _1055 = _1053;
        if (!_845)
        {
            _1051 = _859;
        }
        float _1057 = _1051;
        float _1059 = _1057;
        if (_845)
        {
            _1037 = 4.0;
        }
        float _1061 = _1037;
        float _1063 = _989 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061;
        if (!_845)
        {
            _1067 = _869;
        }
        float _1069 = _1067;
        float _1071 = _1011 * _1053;
        float _1073 = _1021 * _1057;
        float _1075 = _1023 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1069;
        float _1081 = _1071;
        float _1083 = _1011;
        _1085 = _1021;
        if (_845)
        {
            _1059 = 4.0;
        }
        float _1087 = _1059;
        float _1089 = _1087;
        if (!_845)
        {
            _1089 = _869;
        }
        float _1091 = _1089;
        float _1093 = _999 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = fma(_1029, _1069, _1071);
        float _1099 = _1029;
        float _1101 = _1097;
        if (_845)
        {
            _1055 = 2.0;
        }
        float _1103 = _1055;
        float _1105 = _1031 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        float _1109 = _1103;
        if (_845)
        {
            _1079 = 2.0;
        }
        float _1111 = _1079;
        float _1113 = fma(_1049, _1091, _1073);
        float _1115 = _1111;
        _1117 = _1049;
        if (!_845)
        {
            _1109 = _901;
        }
        float _1119 = _1109;
        if (!_845)
        {
            _1115 = _901;
        }
        float _1121 = _1115;
        float _1123 = _1121;
        if (_845)
        {
            _1081 = 1.5;
        }
        float _1125 = _1081;
        float _1127 = _1125;
        if (_845)
        {
            _1039 = 1.5;
        }
        float _1129 = _1039;
        float _1131 = fma(_1065, _1119, _1097);
        float _1133 = _1129;
        float _1135 = _1131;
        if (!_845)
        {
            _1127 = _907;
        }
        float _1137 = _1127;
        float _1139 = fma(_1077, _1121, _1113);
        float _1141 = _1137;
        _1143 = _1139;
        if (!_845)
        {
            _1133 = _907;
        }
        float _1145 = _1133;
        float _1147 = fma(_1095, _1137, _1131);
        float _1149 = fma(_1107, _1145, _1139);
        float _1151 = _1149;
        if (_845)
        {
            _1135 = 1.5;
        }
        float _1153 = _1135;
        _1155 = _1153;
        if (_845)
        {
            _1141 = 2.0;
        }
        float _1157 = _1141;
        float _1159 = -_1149;
        float _1161 = _1147 + _1159;
        _1163 = _1157;
        _1165 = _1161;
        if (_845)
        {
            _1151 = 3.0;
        }
        float _1167 = _1151;
        _1169 = _1167;
        if (_845)
        {
            _1123 = 4.0;
        }
        float _1171 = _1123;
        _1173 = _1171;
        if (_845)
        {
            _1099 = 0.1500000059604644775390625;
        }
        float _1175 = _1099;
        _1177 = _1175;
        if (_845)
        {
            _1083 = 0.23000000417232513427734375;
        }
        float _1179 = _1083;
        _1181 = _1179;
        if (_845)
        {
            _1101 = 0.4199999868869781494140625;
        }
        float _1183 = _1101;
        _1185 = _1183;
        _1187 = 0.0;
        _1189 = true;
    }
    else
    {
        if (_845)
        {
            _327 = 0.4199999868869781494140625;
        }
        float _1191 = _327;
        float _1193 = 0.0;
        if (!_845)
        {
            float _1195 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1193 = _1195;
        }
        float _1197 = _1193;
        if (_845)
        {
            _819 = 0.60000002384185791015625;
        }
        float _1199 = _819;
        if (_845)
        {
            _609 = 0.23000000417232513427734375;
        }
        float _1201 = _609;
        float _1203 = 0.0;
        if (!_845)
        {
            float _1205 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1203 = _1205;
        }
        float _1207 = _1203;
        float _1209 = _1191;
        if (!_845)
        {
            float _1211 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1209 = _1211;
        }
        float _1213 = _1209;
        if (_845)
        {
            _611 = 0.1500000059604644775390625;
        }
        float _1215 = _611;
        float _1217 = _1199;
        if (!_845)
        {
            float _1219 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1217 = _1219;
        }
        float _1221 = _1217;
        float _1223 = _1201;
        if (!_845)
        {
            float _1225 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1223 = _1225;
        }
        float _1227 = _1223;
        float _1229 = _1215;
        if (!_845)
        {
            float _1231 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1229 = _1231;
        }
        float _1233 = _1229;
        float _1235 = 0.0;
        if (!_845)
        {
            float _1237 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1235 = _1237;
        }
        float _1239 = _1235;
        float _1241 = 0.0;
        if (!_845)
        {
            float _1243 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1241 = _1243;
        }
        float _1245 = _1241;
        if (_845)
        {
            _849 = 0.4199999868869781494140625;
        }
        float _1247 = _849;
        float _1249 = _1247;
        if (_845)
        {
            _329 = 0.4199999868869781494140625;
        }
        float _1251 = _329;
        float _1253 = _653 * 6.283184051513671875;
        float _1255 = _1251;
        float _1257 = _1213;
        if (!_845)
        {
            _1249 = _1213;
        }
        float _1259 = _1249;
        float _1261 = _549 * _1213;
        float _1263 = _1259;
        if (!_845)
        {
            _1255 = _1213;
        }
        float _1265 = _1255;
        float _1267 = _549 * _1259;
        float _1269 = _1265;
        if (_845)
        {
            _1263 = 0.4199999868869781494140625;
        }
        float _1271 = _1263;
        float _1273 = _1271;
        if (!_845)
        {
            _1273 = _1213;
        }
        float _1275 = _1273;
        float _1277 = 1.0 / _1261;
        float _1279 = _1275;
        if (_845)
        {
            _1257 = 0.60000002384185791015625;
        }
        float _1281 = _1257;
        float _1283 = _549 * _1221;
        float _1285 = _549 * _1275;
        float _1287 = _1281;
        _929 = _1197;
        if (_845)
        {
            _1279 = 0.60000002384185791015625;
        }
        float _1289 = _1279;
        float _1291 = _549 * _1227;
        float _1293 = _1289;
        if (!_845)
        {
            _1287 = _1221;
        }
        float _1295 = _1287;
        float _1297 = _549 * _1265;
        float _1299 = _1295;
        if (_845)
        {
            _1269 = 0.60000002384185791015625;
        }
        float _1301 = _1269;
        float _1303 = _1301;
        if (!_845)
        {
            _1303 = _1221;
        }
        float _1305 = _1303;
        float _1307 = _1305;
        if (!_845)
        {
            _1293 = _1221;
        }
        float _1309 = _1293;
        float _1311 = 1.0 / _1283;
        float _1313 = _549 * _1233;
        float _1315 = 1.0 / _1291;
        float _1317 = _549 * _1295;
        float _1319 = _1309;
        _941 = _1207;
        _943 = _1239;
        _945 = _1245;
        if (_845)
        {
            _1299 = 0.23000000417232513427734375;
        }
        float _1321 = _1299;
        float _1323 = _1321;
        if (!_845)
        {
            _1323 = _1227;
        }
        float _1325 = _1323;
        float _1327 = 1.0 / _1267;
        float _1329 = _549 * _1305;
        float _1331 = _1325;
        if (_845)
        {
            _1307 = 0.23000000417232513427734375;
        }
        float _1333 = _1307;
        float _1335 = _1333;
        if (!_845)
        {
            _1335 = _1227;
        }
        float _1337 = _1335;
        float _1339 = _549 * _1309;
        float _1341 = _1337;
        if (_845)
        {
            _1319 = 0.23000000417232513427734375;
        }
        float _1343 = _1319;
        float _1345 = _1343;
        if (!_845)
        {
            _1345 = _1227;
        }
        float _1347 = _1345;
        float _1349 = 1.0 / _1313;
        float _1351 = 1.0 / _1297;
        float _1353 = _549 * _1337;
        float _1355 = _1347;
        if (_845)
        {
            _1341 = 0.1500000059604644775390625;
        }
        float _1357 = _1341;
        float _1359 = _1357;
        if (!_845)
        {
            _1359 = _1233;
        }
        float _1361 = _1359;
        float _1363 = 1.0 / _1285;
        float _1365 = _549 * _1325;
        if (_845)
        {
            _1331 = 0.1500000059604644775390625;
        }
        float _1367 = _1331;
        float _1369 = _1367;
        if (!_845)
        {
            _1369 = _1233;
        }
        float _1371 = _1369;
        float _1373 = _549 * _1347;
        if (_845)
        {
            _1355 = 0.1500000059604644775390625;
        }
        float _1375 = _1355;
        float _1377 = _1375;
        if (!_845)
        {
            _1377 = _1233;
        }
        float _1379 = _1377;
        float _1381 = _835 * 6.283184051513671875;
        float _1383 = 1.0 / _1317;
        float _1385 = _549 * _1379;
        float _1387 = 1.0 / _1365;
        float _1389 = _1277 * _1381;
        float _1391 = _1389 * 0.15915493667125701904296875;
        float _1393 = _1311 * _1381;
        float _1395 = 1.0 / _1339;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = _1315 * _1381;
        float _1401 = 1.0 / _1353;
        float _1403 = 1.0 / _1329;
        float _1405 = _653 + _685;
        float _1407 = _549 * _1371;
        float _1409 = _1399 * 0.15915493667125701904296875;
        float _1411 = _1349 * _1381;
        float _1413 = _1405 * 6.283184051513671875;
        float _1415 = 1.0 / _1385;
        float _1417 = _1351 * _1413;
        float _1419 = _831 * _1327;
        float _1421 = _1417 * 0.15915493667125701904296875;
        float _1423 = _1363 * _1253;
        float _1425 = _1391 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = _1419 * 6.283184051513671875;
        float _1431 = _1423 * 0.15915493667125701904296875;
        float _1433 = _1403 * _1413;
        float _1435 = _549 * _1361;
        float _1437 = 1.0 / _1373;
        float _1439 = _1433 * 0.15915493667125701904296875;
        float _1441 = _1395 * _1253;
        float _1443 = _1429 * 0.15915493667125701904296875;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1441 * 0.15915493667125701904296875;
        float _1451 = _1441;
        if (_845)
        {
            _1451 = 3.0;
        }
        float _1453 = _1451;
        float _1455 = _1453;
        if (!_845)
        {
            _1455 = _1197;
        }
        float _1457 = _1455;
        float _1459 = _1421 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = _1401 * _1413;
        float _1465 = 1.0 / _1435;
        float _1467 = _1443 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1427 * _1457;
        float _1473 = _1457;
        float _1475 = _1463;
        float _1477 = _1427;
        if (_845)
        {
            _1473 = 3.0;
        }
        float _1479 = _1473;
        float _1481 = _1463 * 0.15915493667125701904296875;
        float _1483 = _1479;
        if (!_845)
        {
            _1483 = _1197;
        }
        float _1485 = _1483;
        if (_845)
        {
            _1475 = 3.0;
        }
        float _1487 = _1475;
        float _1489 = _1439 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1487;
        if (_845)
        {
            _1477 = 3.0;
        }
        float _1495 = _1477;
        float _1497 = _1437 * _1253;
        float _1499 = _1495;
        if (!_845)
        {
            _1493 = _1197;
        }
        float _1501 = _1493;
        float _1503 = _1447 * _1485;
        float _1505 = _1501;
        _773 = _1447;
        if (!_845)
        {
            _1499 = _1197;
        }
        float _1507 = _1499;
        float _1509 = 1.0 / _1407;
        float _1511 = _831 * _1383;
        float _1513 = _1497 * 0.15915493667125701904296875;
        float _1515 = _1461 * _1501;
        float _1517 = _1397 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        float _1521 = _1465 * _1413;
        float _1523 = _1469 * _1507;
        float _1525 = _1511 * 6.283184051513671875;
        float _1527 = _1507;
        float _1529 = _1511;
        if (_845)
        {
            _1505 = 4.0;
        }
        float _1531 = _1505;
        float _1533 = _1531;
        if (!_845)
        {
            _1533 = _1207;
        }
        float _1535 = _1533;
        float _1537 = _1521 * 0.15915493667125701904296875;
        float _1539 = _831 * _1387;
        float _1541 = _1449 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        if (_845)
        {
            _1527 = 4.0;
        }
        float _1545 = _1527;
        float _1547 = _1525 * 0.15915493667125701904296875;
        float _1549 = _1545;
        if (!_845)
        {
            _1549 = _1207;
        }
        float _1551 = _1549;
        float _1553 = fma(_1491, _1535, _1515);
        float _1555 = _831 * _1509;
        float _1557 = _1539 * 6.283184051513671875;
        float _1559 = _1547 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = fma(_1519, _1551, _1471);
        float _1565 = _1557 * 0.15915493667125701904296875;
        float _1567 = _1555 * 6.283184051513671875;
        float _1569 = _1415 * _1253;
        float _1571 = _1509;
        float _1573 = _1557;
        float _1575 = _1567;
        _1185 = _1563;
        if (_845)
        {
            _1529 = 4.0;
        }
        float _1577 = _1529;
        float _1579 = _1411 * 0.15915493667125701904296875;
        float _1581 = _1577;
        if (!_845)
        {
            _1581 = _1207;
        }
        float _1583 = _1581;
        float _1585 = _1409 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = _1567 * 0.15915493667125701904296875;
        float _1591 = _1569 * 0.15915493667125701904296875;
        float _1593 = _1481 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = fma(_1543, _1583, _1503);
        float _1599 = _1583;
        if (_845)
        {
            _1571 = 4.0;
        }
        float _1601 = _1571;
        float _1603 = _1513 * 6.283185482025146484375;
        float _1605 = sin(_1603);
        float _1607 = _1601;
        if (!_845)
        {
            _1607 = _1207;
        }
        float _1609 = _1607;
        float _1611 = _1565 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = _1609;
        if (_845)
        {
            _1599 = 2.0;
        }
        float _1617 = _1599;
        float _1619 = _1617;
        if (_845)
        {
            _851 = 2.0;
        }
        float _1621 = _851;
        float _1623 = _1621;
        if (_845)
        {
            _1573 = 2.0;
        }
        float _1625 = _1573;
        float _1627 = _1579 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = _1625;
        if (!_845)
        {
            _1619 = _1239;
        }
        float _1633 = _1619;
        float _1635 = fma(_1561, _1609, _1523);
        float _1637 = _1633;
        _1117 = _1561;
        if (!_845)
        {
            _1623 = _1239;
        }
        float _1639 = _1623;
        float _1641 = _1537 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = _1639;
        if (!_845)
        {
            _1631 = _1239;
        }
        float _1647 = _1631;
        float _1649 = _1591 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = _1647;
        if (_845)
        {
            _1615 = 2.0;
        }
        float _1655 = _1615;
        float _1657 = _1589 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1655;
        if (!_845)
        {
            _1661 = _1239;
        }
        float _1663 = _1661;
        float _1665 = fma(_1587, _1633, _1563);
        float _1667 = fma(_1595, _1639, _1553);
        float _1669 = fma(_1605, _1647, _1597);
        float _1671 = _1629;
        _1085 = _1667;
        _1187 = _1605;
        if (_845)
        {
            _1575 = 1.5;
        }
        float _1673 = _1575;
        float _1675 = _1673;
        if (_845)
        {
            _1637 = 1.5;
        }
        float _1677 = _1637;
        float _1679 = _1677;
        if (_845)
        {
            _1645 = 1.5;
        }
        float _1681 = _1645;
        float _1683 = _1681;
        if (_845)
        {
            _1653 = 1.5;
        }
        float _1685 = _1653;
        float _1687 = fma(_1613, _1663, _1635);
        float _1689 = _1685;
        float _1691 = _1613;
        if (!_845)
        {
            _1675 = _1245;
        }
        float _1693 = _1675;
        if (!_845)
        {
            _1683 = _1245;
        }
        float _1695 = _1683;
        if (!_845)
        {
            _1689 = _1245;
        }
        float _1697 = _1689;
        if (!_845)
        {
            _1679 = _1245;
        }
        float _1699 = _1679;
        float _1701 = fma(_1629, _1693, _1665);
        float _1703 = fma(_1643, _1695, _1667);
        float _1705 = fma(_1651, _1697, _1669);
        float _1707 = fma(_1659, _1699, _1687);
        float _1709 = -_1703;
        float _1711 = _1709 + _1705;
        float _1713 = -_1707;
        float _1715 = _1701 + _1713;
        float _1717 = _1707;
        float _1719 = _1699;
        float _1721 = _1703;
        float _1723 = _1715;
        _1143 = _1651;
        if (_845)
        {
            _1717 = 1.5;
        }
        float _1725 = _1717;
        _1155 = _1725;
        if (_845)
        {
            _1719 = 2.0;
        }
        float _1727 = _1719;
        float _1729 = _1715 + _1711;
        _1163 = _1727;
        _1165 = _1729;
        if (_845)
        {
            _1721 = 3.0;
        }
        float _1731 = _1721;
        _1169 = _1731;
        if (_845)
        {
            _1671 = 4.0;
        }
        float _1733 = _1671;
        _1173 = _1733;
        if (_845)
        {
            _1723 = 0.1500000059604644775390625;
        }
        float _1735 = _1723;
        _1177 = _1735;
        if (_845)
        {
            _1691 = 0.23000000417232513427734375;
        }
        float _1737 = _1691;
        _1181 = _1737;
        if (_845)
        {
            _1185 = 0.4199999868869781494140625;
        }
    }
    _1189 = false;
    float _1739 = _1185;
    float _1741 = _1181;
    float _1743 = _1117;
    float _1745 = _1177;
    float _1747 = _1085;
    float _1749 = _1143;
    float _1751 = _1169;
    float _1753 = _929;
    float _1755 = _1173;
    float _1757 = _941;
    float _1759 = _1163;
    float _1761 = _943;
    float _1763 = _1155;
    float _1765 = _945;
    float _1767 = _773;
    float _1769 = _1187;
    float _1771 = _1165;
    float _1773 = _829 + _655;
    float _1775 = _555 + _1773;
    float _1777 = _1775 + _685;
    float _1779 = _1743;
    float _1781 = _1747;
    float _1783 = _1749;
    float _1785 = _1775;
    float _1787 = _1773;
    float _1789 = _1747;
    float _1791 = _1749;
    float _1793 = _1767;
    float _1795 = _1769;
    float _1797 = _1775;
    float _1799 = _1743;
    float _1801 = _1773;
    float _1803 = _1769;
    float _1805 = _1739;
    float _1807 = _1741;
    float _1809 = _1745;
    float _1811 = _1759;
    float _1813 = _1751;
    float _1815 = _1755;
    float _1817 = _1763;
    float _1819 = _1739;
    float _1821 = _1741;
    float _1823 = _1745;
    float _1825 = _1763;
    float _1827 = _1765;
    float _1829 = _1759;
    float _1831 = _1751;
    float _1833 = _1755;
    float _1835 = _1771;
    float _2041;
    float _2057;
    float _2091;
    float _2093;
    float _2095;
    if (!_719)
    {
        if (_845)
        {
            _675 = _1739;
        }
        float _1837 = _675;
        if (_845)
        {
            _1779 = 0.60000002384185791015625;
        }
        float _1839 = _1779;
        float _1841 = _1837;
        if (!_845)
        {
            float _1843 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1841 = _1843;
        }
        float _1845 = _1841;
        if (_845)
        {
            _1781 = _1741;
        }
        float _1847 = _1781;
        float _1849 = _1839;
        if (!_845)
        {
            float _1851 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1849 = _1851;
        }
        float _1853 = _1849;
        if (_845)
        {
            _1783 = _1745;
        }
        float _1855 = _1783;
        float _1857 = _1847;
        if (!_845)
        {
            float _1859 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1857 = _1859;
        }
        float _1861 = _1857;
        float _1863 = _1855;
        if (!_845)
        {
            float _1865 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1863 = _1865;
        }
        float _1867 = _1863;
        if (_845)
        {
            _1785 = _1739;
        }
        float _1869 = _1785;
        float _1871 = _549 * _1845;
        float _1873 = _1869;
        float _1875 = _1845;
        if (!_845)
        {
            _1873 = _1845;
        }
        float _1877 = _1873;
        float _1879 = _1877;
        if (_845)
        {
            _1875 = 0.60000002384185791015625;
        }
        float _1881 = _1875;
        float _1883 = _549 * _1853;
        float _1885 = _1881;
        if (!_845)
        {
            _1885 = _1853;
        }
        float _1887 = _1885;
        float _1889 = 1.0 / _1871;
        float _1891 = _549 * _1877;
        float _1893 = _549 * _1861;
        float _1895 = _1887;
        if (_845)
        {
            _1879 = _1741;
        }
        float _1897 = _1879;
        float _1899 = _1897;
        if (!_845)
        {
            _1899 = _1861;
        }
        float _1901 = _1899;
        float _1903 = _549 * _1867;
        float _1905 = 1.0 / _1883;
        float _1907 = _549 * _1901;
        float _1909 = 1.0 / _1893;
        float _1911 = _549 * _1887;
        if (_845)
        {
            _1895 = _1745;
        }
        float _1913 = _1895;
        float _1915 = _1913;
        if (!_845)
        {
            _1915 = _1867;
        }
        float _1917 = _1915;
        float _1919 = _1777 * 6.283184051513671875;
        float _1921 = 1.0 / _1903;
        float _1923 = _549 * _1917;
        float _1925 = _1889 * _1919;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1905 * _1919;
        float _1931 = 1.0 / _1891;
        float _1933 = _1929 * 0.15915493667125701904296875;
        float _1935 = _1909 * _1919;
        float _1937 = 1.0 / _1911;
        float _1939 = _1935 * 0.15915493667125701904296875;
        float _1941 = _1921 * _1919;
        float _1943 = 1.0 / _1907;
        float _1945 = _1773 * _1931;
        float _1947 = _1945 * 6.283184051513671875;
        float _1949 = 1.0 / _1923;
        float _1951 = _1947 * 0.15915493667125701904296875;
        float _1953 = _1927 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = _1941 * 0.15915493667125701904296875;
        float _1959 = _1773 * _1937;
        float _1961 = _1959 * 6.283184051513671875;
        float _1963 = _1773 * _1943;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1773 * _1949;
        float _1971 = _1961 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283184051513671875;
        float _1975 = _1961;
        float _1977 = _1963;
        if (_845)
        {
            _1975 = _1751;
        }
        float _1979 = _1975;
        float _1981 = _1979;
        if (_845)
        {
            _1977 = _1751;
        }
        float _1983 = _1977;
        float _1985 = _1973 * 0.15915493667125701904296875;
        float _1987 = _1933 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = _1969 * 6.283184051513671875;
        float _1993 = _1983;
        if (!_845)
        {
            _1981 = _1753;
        }
        float _1995 = _1981;
        float _1997 = _1995;
        if (!_845)
        {
            _1993 = _1753;
        }
        float _1999 = _1993;
        float _2001 = _1991 * 0.15915493667125701904296875;
        float _2003 = _1999;
        if (_845)
        {
            _1787 = _1755;
        }
        float _2005 = _1787;
        float _2007 = _1955 * _1995;
        float _2009 = _1971 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = _2005;
        float _2015 = _1955;
        if (!_845)
        {
            _2013 = _1757;
        }
        float _2017 = _2013;
        float _2019 = _1967 * _1999;
        float _2021 = _2017;
        if (_845)
        {
            _2003 = _1755;
        }
        float _2023 = _2003;
        float _2025 = _2023;
        if (!_845)
        {
            _2025 = _1757;
        }
        float _2027 = _2025;
        if (_845)
        {
            _2015 = _1759;
        }
        float _2029 = _2015;
        float _2031 = _1939 * 6.283185482025146484375;
        float _2033 = sin(_2031);
        float _2035 = fma(_1989, _2017, _2007);
        float _2037 = _2029;
        float _2039 = _1989;
        _2041 = _2035;
        if (_845)
        {
            _2021 = _1759;
        }
        float _2043 = _2021;
        float _2045 = _2043;
        if (!_845)
        {
            _2037 = _1761;
        }
        float _2047 = _2037;
        if (!_845)
        {
            _2045 = _1761;
        }
        float _2049 = _2045;
        float _2051 = _1985 * 6.283185482025146484375;
        float _2053 = sin(_2051);
        float _2055 = fma(_2011, _2027, _2019);
        _2057 = _2055;
        if (_845)
        {
            _2039 = _1763;
        }
        float _2059 = _2039;
        float _2061 = _2059;
        if (_845)
        {
            _1997 = _1763;
        }
        float _2063 = _1997;
        float _2065 = _2063;
        if (!_845)
        {
            _2061 = _1765;
        }
        float _2067 = _2061;
        float _2069 = _1957 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        if (!_845)
        {
            _2065 = _1765;
        }
        float _2073 = _2065;
        float _2075 = fma(_2033, _2047, _2035);
        float _2077 = _2001 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = fma(_2053, _2049, _2055);
        float _2083 = fma(_2071, _2067, _2075);
        float _2085 = fma(_2079, _2073, _2081);
        float _2087 = -_2085;
        float _2089 = _2083 + _2087;
        _2091 = _2071;
        _2093 = _2085;
        _2095 = _2089;
        _2097 = true;
    }
    else
    {
        if (_845)
        {
            _1789 = _1739;
        }
        float _2099 = _1789;
        if (_845)
        {
            _1791 = 0.60000002384185791015625;
        }
        float _2101 = _1791;
        float _2103 = _2099;
        if (!_845)
        {
            float _2105 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2103 = _2105;
        }
        float _2107 = _2103;
        if (_845)
        {
            _1793 = _1741;
        }
        float _2109 = _1793;
        float _2111 = _2101;
        if (!_845)
        {
            float _2113 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2111 = _2113;
        }
        float _2115 = _2111;
        float _2117 = _2109;
        if (!_845)
        {
            float _2119 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2117 = _2119;
        }
        float _2121 = _2117;
        if (_845)
        {
            _1795 = _1745;
        }
        float _2123 = _1795;
        float _2125 = _2123;
        if (!_845)
        {
            float _2127 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2125 = _2127;
        }
        float _2129 = _2125;
        if (_845)
        {
            _1797 = _1739;
        }
        float _2131 = _1797;
        float _2133 = _655 * 6.283184051513671875;
        float _2135 = _2131;
        if (_845)
        {
            _1799 = _1739;
        }
        float _2137 = _1799;
        float _2139 = _2137;
        float _2141 = _2107;
        if (!_845)
        {
            _2135 = _2107;
        }
        float _2143 = _2135;
        float _2145 = _549 * _2107;
        float _2147 = _2143;
        if (!_845)
        {
            _2139 = _2107;
        }
        float _2149 = _2139;
        float _2151 = _549 * _2115;
        float _2153 = _549 * _2143;
        float _2155 = _2149;
        if (_845)
        {
            _2147 = _1739;
        }
        float _2157 = _2147;
        float _2159 = 1.0 / _2145;
        float _2161 = _2157;
        if (!_845)
        {
            _2161 = _2107;
        }
        float _2163 = _2161;
        float _2165 = _549 * _2121;
        float _2167 = _2163;
        if (_845)
        {
            _2141 = 0.60000002384185791015625;
        }
        float _2169 = _2141;
        float _2171 = _2169;
        if (!_845)
        {
            _2171 = _2115;
        }
        float _2173 = _2171;
        float _2175 = _549 * _2163;
        float _2177 = _2173;
        if (_845)
        {
            _2167 = 0.60000002384185791015625;
        }
        float _2179 = _2167;
        float _2181 = 1.0 / _2151;
        float _2183 = _2179;
        if (!_845)
        {
            _2183 = _2115;
        }
        float _2185 = _2183;
        float _2187 = _549 * _2129;
        float _2189 = 1.0 / _2165;
        float _2191 = _549 * _2149;
        float _2193 = _2185;
        if (_845)
        {
            _2155 = 0.60000002384185791015625;
        }
        float _2195 = _2155;
        float _2197 = _2195;
        if (!_845)
        {
            _2197 = _2115;
        }
        float _2199 = _2197;
        float _2201 = _549 * _2185;
        float _2203 = _2199;
        if (_845)
        {
            _2193 = _1741;
        }
        float _2205 = _2193;
        float _2207 = _2205;
        if (!_845)
        {
            _2207 = _2121;
        }
        float _2209 = _2207;
        float _2211 = _549 * _2173;
        float _2213 = _2209;
        if (_845)
        {
            _2177 = _1741;
        }
        float _2215 = _2177;
        float _2217 = _549 * _2199;
        float _2219 = _2215;
        if (!_845)
        {
            _2219 = _2121;
        }
        float _2221 = _2219;
        float _2223 = 1.0 / _2191;
        float _2225 = _2221;
        if (_845)
        {
            _2203 = _1741;
        }
        float _2227 = _2203;
        float _2229 = _2227;
        if (!_845)
        {
            _2229 = _2121;
        }
        float _2231 = _2229;
        float _2233 = _549 * _2209;
        float _2235 = _2231;
        if (_845)
        {
            _2213 = _1745;
        }
        float _2237 = _2213;
        float _2239 = _2237;
        if (!_845)
        {
            _2239 = _2129;
        }
        float _2241 = _2239;
        float _2243 = 1.0 / _2187;
        float _2245 = _549 * _2221;
        if (_845)
        {
            _2225 = _1745;
        }
        float _2247 = _2225;
        float _2249 = _2247;
        if (!_845)
        {
            _2249 = _2129;
        }
        float _2251 = _2249;
        float _2253 = 1.0 / _2153;
        float _2255 = _549 * _2231;
        if (_845)
        {
            _2235 = _1745;
        }
        float _2257 = _2235;
        float _2259 = _2257;
        if (!_845)
        {
            _2259 = _2129;
        }
        float _2261 = _2259;
        float _2263 = _1777 * 6.283184051513671875;
        float _2265 = 1.0 / _2175;
        float _2267 = _549 * _2261;
        float _2269 = 1.0 / _2217;
        float _2271 = 1.0 / _2201;
        float _2273 = _549 * _2251;
        float _2275 = _655 + _685;
        float _2277 = _2265 * _2133;
        float _2279 = 1.0 / _2255;
        float _2281 = _549 * _2241;
        float _2283 = _2159 * _2263;
        float _2285 = _2275 * 6.283184051513671875;
        float _2287 = _2223 * _2285;
        float _2289 = 1.0 / _2281;
        float _2291 = _2283 * 0.15915493667125701904296875;
        float _2293 = _2181 * _2263;
        float _2295 = _2277 * 0.15915493667125701904296875;
        float _2297 = _2269 * _2285;
        float _2299 = _2293 * 0.15915493667125701904296875;
        float _2301 = _2189 * _2263;
        float _2303 = 1.0 / _2233;
        float _2305 = _2287 * 0.15915493667125701904296875;
        float _2307 = _1773 * _2253;
        float _2309 = _2307 * 6.283184051513671875;
        float _2311 = 1.0 / _2267;
        float _2313 = _2309 * 0.15915493667125701904296875;
        float _2315 = _2279 * _2285;
        float _2317 = _2291 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        float _2321 = _2301 * 0.15915493667125701904296875;
        float _2323 = _2243 * _2263;
        float _2325 = _2297 * 0.15915493667125701904296875;
        float _2327 = _2271 * _2133;
        float _2329 = _2315 * 0.15915493667125701904296875;
        float _2331 = _2315;
        float _2333 = _2327;
        if (_845)
        {
            _2331 = _1751;
        }
        float _2335 = _2331;
        float _2337 = _2303 * _2133;
        float _2339 = 1.0 / _2211;
        float _2341 = _2327 * 0.15915493667125701904296875;
        float _2343 = _2335;
        if (_845)
        {
            _2333 = _1751;
        }
        float _2345 = _2333;
        float _2347 = _2337 * 0.15915493667125701904296875;
        float _2349 = _2345;
        if (!_845)
        {
            _2349 = _1753;
        }
        float _2351 = _2349;
        float _2353 = _2311 * _2285;
        float _2355 = _2351;
        if (!_845)
        {
            _2343 = _1753;
        }
        float _2357 = _2343;
        float _2359 = _2323 * 0.15915493667125701904296875;
        float _2361 = _2305 * 6.283185482025146484375;
        float _2363 = sin(_2361);
        float _2365 = _2353 * 0.15915493667125701904296875;
        float _2367 = _2295 * 6.283185482025146484375;
        float _2369 = sin(_2367);
        float _2371 = _2319 * _2351;
        float _2373 = _2319;
        float _2375 = _2357;
        if (_845)
        {
            _2355 = _1751;
        }
        float _2377 = _2355;
        float _2379 = _1773 * _2339;
        float _2381 = _2377;
        float _2383 = _2379;
        if (_845)
        {
            _2373 = _1751;
        }
        float _2385 = _2373;
        float _2387 = _2385;
        if (!_845)
        {
            _2381 = _1753;
        }
        float _2389 = _2381;
        float _2391 = _2313 * 6.283185482025146484375;
        float _2393 = sin(_2391);
        float _2395 = _2389;
        if (!_845)
        {
            _2387 = _1753;
        }
        float _2397 = _2387;
        float _2399 = _2363 * _2357;
        if (_845)
        {
            _2375 = _1755;
        }
        float _2401 = _2375;
        float _2403 = _2401;
        if (!_845)
        {
            _2403 = _1757;
        }
        float _2405 = _2403;
        float _2407 = 1.0 / _2245;
        float _2409 = _2369 * _2389;
        if (_845)
        {
            _2395 = _1755;
        }
        float _2411 = _2395;
        float _2413 = _2411;
        if (!_845)
        {
            _2413 = _1757;
        }
        float _2415 = _2413;
        float _2417 = _2341 * 6.283185482025146484375;
        float _2419 = sin(_2417);
        float _2421 = _2393 * _2397;
        float _2423 = _2379 * 6.283184051513671875;
        if (_845)
        {
            _2383 = _1755;
        }
        float _2425 = _2383;
        float _2427 = _2425;
        if (!_845)
        {
            _2427 = _1757;
        }
        float _2429 = _2427;
        float _2431 = _2423 * 0.15915493667125701904296875;
        float _2433 = _2289 * _2133;
        float _2435 = _2325 * 6.283185482025146484375;
        float _2437 = sin(_2435);
        float _2439 = _1773 * _2407;
        float _2441 = _2433 * 0.15915493667125701904296875;
        float _2443 = 1.0 / _2273;
        float _2445 = fma(_2419, _2415, _2409);
        float _2447 = _2439 * 6.283184051513671875;
        float _2449 = _2439;
        float _2451 = _2447;
        if (_845)
        {
            _2449 = _1755;
        }
        float _2453 = _2449;
        float _2455 = _2453;
        if (!_845)
        {
            _2455 = _1757;
        }
        float _2457 = _2455;
        float _2459 = _2299 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        float _2463 = fma(_2437, _2429, _2399);
        float _2465 = _2321 * 6.283185482025146484375;
        float _2467 = sin(_2465);
        float _2469 = _1773 * _2443;
        float _2471 = _2443;
        float _2473 = _2457;
        if (_845)
        {
            _2471 = _1759;
        }
        float _2475 = _2471;
        float _2477 = _2475;
        if (!_845)
        {
            _2477 = _1761;
        }
        float _2479 = _2477;
        float _2481 = _2469 * 6.283184051513671875;
        float _2483 = _2481;
        float _2485 = _2479;
        if (_845)
        {
            _1801 = _1759;
        }
        float _2487 = _1801;
        float _2489 = _2431 * 6.283185482025146484375;
        float _2491 = sin(_2489);
        float _2493 = fma(_2461, _2405, _2371);
        float _2495 = _2447 * 0.15915493667125701904296875;
        float _2497 = _2481 * 0.15915493667125701904296875;
        float _2499 = _2487;
        _2057 = _2497;
        if (_845)
        {
            _2451 = _1759;
        }
        float _2501 = _2451;
        float _2503 = _2501;
        if (!_845)
        {
            _2499 = _1761;
        }
        float _2505 = _2499;
        float _2507 = _2329 * 6.283185482025146484375;
        float _2509 = sin(_2507);
        float _2511 = fma(_2467, _2479, _2493);
        float _2513 = _2505;
        if (!_845)
        {
            _2503 = _1761;
        }
        float _2515 = _2503;
        float _2517 = _2515;
        if (_845)
        {
            _2483 = _1763;
        }
        float _2519 = _2483;
        float _2521 = _2519;
        if (_845)
        {
            _2485 = _1763;
        }
        float _2523 = _2485;
        float _2525 = _2347 * 6.283185482025146484375;
        float _2527 = sin(_2525);
        float _2529 = fma(_2491, _2457, _2421);
        float _2531 = _2523;
        _2093 = _2491;
        if (_845)
        {
            _2473 = _1759;
        }
        float _2533 = _2473;
        float _2535 = _2533;
        if (!_845)
        {
            _2535 = _1761;
        }
        float _2537 = _2535;
        if (!_845)
        {
            _2521 = _1765;
        }
        float _2539 = _2521;
        float _2541 = _2495 * 6.283185482025146484375;
        float _2543 = sin(_2541);
        float _2545 = fma(_2509, _2505, _2463);
        if (_845)
        {
            _2513 = _1763;
        }
        float _2547 = _2513;
        float _2549 = _2547;
        if (!_845)
        {
            _2549 = _1765;
        }
        float _2551 = _2549;
        if (!_845)
        {
            _2531 = _1765;
        }
        float _2553 = _2531;
        float _2555 = _2359 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = fma(_2527, _2515, _2445);
        if (_845)
        {
            _2517 = _1763;
        }
        float _2561 = _2517;
        float _2563 = _2561;
        if (!_845)
        {
            _2563 = _1765;
        }
        float _2565 = _2563;
        float _2567 = _2365 * 6.283185482025146484375;
        float _2569 = sin(_2567);
        float _2571 = fma(_2543, _2537, _2529);
        float _2573 = _2441 * 6.283185482025146484375;
        float _2575 = sin(_2573);
        float _2577 = fma(_2557, _2539, _2511);
        float _2579 = _2497 * 6.283185482025146484375;
        float _2581 = sin(_2579);
        float _2583 = fma(_2569, _2551, _2545);
        float _2585 = fma(_2575, _2565, _2559);
        float _2587 = -_2583;
        float _2589 = _2587 + _2585;
        float _2591 = fma(_2581, _2553, _2571);
        float _2593 = -_2591;
        float _2595 = _2577 + _2593;
        float _2597 = _2595 + _2589;
        _2041 = _2595;
        _2091 = _2543;
        _1803 = _2583;
        _2095 = _2597;
    }
    _2097 = false;
    float _2599 = _2041;
    float _2601 = _2091;
    float _2603 = _2057;
    float _2605 = _2093;
    float _2607 = _1803;
    float _2609 = _2095;
    float _2611 = _829 + _657;
    float _2613 = _555 + _2611;
    float _2615 = _2613 + _685;
    float _2617 = _2613;
    float _2619 = _2599;
    float _2621 = _2601;
    float _2623 = _2603;
    float _2625 = _2601;
    float _2627 = _2605;
    float _2629 = _2607;
    float _2631 = _2613;
    float _2633 = _2599;
    int _2635 = as_type<int>(_2603);
    float _2637 = _2609;
    float _2851;
    float _2853;
    float _2855;
    float _2857;
    if (!_719)
    {
        if (_845)
        {
            _677 = _1739;
        }
        float _2639 = _677;
        if (_845)
        {
            _2617 = 0.60000002384185791015625;
        }
        float _2641 = _2617;
        if (_845)
        {
            _2619 = _1741;
        }
        float _2643 = _2619;
        float _2645 = _2639;
        if (!_845)
        {
            float _2647 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2645 = _2647;
        }
        float _2649 = _2645;
        float _2651 = _2641;
        if (!_845)
        {
            float _2653 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2651 = _2653;
        }
        float _2655 = _2651;
        if (_845)
        {
            _2621 = _1745;
        }
        float _2657 = _2621;
        float _2659 = _2643;
        if (!_845)
        {
            float _2661 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2659 = _2661;
        }
        float _2663 = _2659;
        float _2665 = _2657;
        if (!_845)
        {
            float _2667 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2665 = _2667;
        }
        float _2669 = _2665;
        float _2671 = _549 * _2649;
        float _2673 = _2649;
        if (!_845)
        {
            _1805 = _2649;
        }
        float _2675 = _1805;
        if (_845)
        {
            _2673 = 0.60000002384185791015625;
        }
        float _2677 = _2673;
        float _2679 = _549 * _2655;
        float _2681 = 1.0 / _2671;
        float _2683 = _549 * _2675;
        float _2685 = _2677;
        if (!_845)
        {
            _2685 = _2655;
        }
        float _2687 = _2685;
        float _2689 = _549 * _2663;
        if (!_845)
        {
            _1807 = _2663;
        }
        float _2691 = _1807;
        float _2693 = _2615 * 6.283184051513671875;
        float _2695 = _549 * _2669;
        float _2697 = 1.0 / _2679;
        if (!_845)
        {
            _1809 = _2669;
        }
        float _2699 = _1809;
        float _2701 = _549 * _2687;
        float _2703 = _549 * _2691;
        float _2705 = _549 * _2699;
        float _2707 = 1.0 / _2689;
        float _2709 = _2681 * _2693;
        float _2711 = _2709 * 0.15915493667125701904296875;
        float _2713 = 1.0 / _2695;
        float _2715 = _2697 * _2693;
        float _2717 = _2715 * 0.15915493667125701904296875;
        float _2719 = 1.0 / _2683;
        float _2721 = _2707 * _2693;
        float _2723 = 1.0 / _2701;
        float _2725 = 1.0 / _2703;
        float _2727 = _2611 * _2719;
        float _2729 = _2727 * 6.283184051513671875;
        float _2731 = 1.0 / _2705;
        float _2733 = _2721 * 0.15915493667125701904296875;
        float _2735 = _2713 * _2693;
        float _2737 = _2729 * 0.15915493667125701904296875;
        float _2739 = _2735 * 0.15915493667125701904296875;
        float _2741 = _2611 * _2723;
        float _2743 = _2711 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        float _2747 = _2705;
        if (_845)
        {
            _2747 = _1759;
        }
        float _2749 = _2747;
        float _2751 = _2741 * 6.283184051513671875;
        float _2753 = _2611 * _2725;
        float _2755 = _2749;
        float _2757 = _2751;
        if (!_845)
        {
            _2755 = _1761;
        }
        float _2759 = _2755;
        if (!_845)
        {
            _1811 = _1761;
        }
        float _2761 = _1811;
        float _2763 = _2737 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2751 * 0.15915493667125701904296875;
        float _2769 = _2753 * 6.283184051513671875;
        float _2771 = _2611 * _2731;
        float _2773 = _2769;
        if (_845)
        {
            _2757 = _1751;
        }
        float _2775 = _2757;
        float _2777 = _2769 * 0.15915493667125701904296875;
        float _2779 = _2771 * 6.283184051513671875;
        float _2781 = _2717 * 6.283185482025146484375;
        float _2783 = sin(_2781);
        float _2785 = _2775;
        if (!_845)
        {
            _2785 = _1753;
        }
        float _2787 = _2785;
        float _2789 = _2779 * 0.15915493667125701904296875;
        if (!_845)
        {
            _1813 = _1753;
        }
        float _2791 = _1813;
        float _2793 = _2791;
        if (_845)
        {
            _2773 = _1755;
        }
        float _2795 = _2773;
        float _2797 = _2745 * _2787;
        float _2799 = _2767 * 6.283185482025146484375;
        float _2801 = sin(_2799);
        float _2803 = _2795;
        if (!_845)
        {
            _2803 = _1757;
        }
        float _2805 = _2803;
        float _2807 = _2765 * _2791;
        if (!_845)
        {
            _1815 = _1757;
        }
        float _2809 = _1815;
        if (_845)
        {
            _2793 = _1763;
        }
        float _2811 = _2793;
        float _2813 = _2811;
        if (!_845)
        {
            _2813 = _1765;
        }
        float _2815 = _2813;
        float _2817 = _2733 * 6.283185482025146484375;
        float _2819 = sin(_2817);
        float _2821 = fma(_2783, _2805, _2797);
        if (!_845)
        {
            _1817 = _1765;
        }
        float _2823 = _1817;
        float _2825 = _2777 * 6.283185482025146484375;
        float _2827 = sin(_2825);
        float _2829 = fma(_2801, _2809, _2807);
        float _2831 = _2739 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        float _2835 = fma(_2819, _2759, _2821);
        float _2837 = _2789 * 6.283185482025146484375;
        float _2839 = sin(_2837);
        float _2841 = fma(_2827, _2761, _2829);
        float _2843 = fma(_2833, _2815, _2835);
        float _2845 = fma(_2839, _2823, _2841);
        float _2847 = -_2845;
        float _2849 = _2843 + _2847;
        _2851 = _2849;
        _2853 = _2827;
        _2855 = _2819;
        _2857 = _2833;
        _2859 = true;
    }
    else
    {
        if (_845)
        {
            _2623 = _1739;
        }
        float _2861 = _2623;
        if (_845)
        {
            _2625 = 0.60000002384185791015625;
        }
        float _2863 = _2625;
        float _2865 = _2861;
        if (!_845)
        {
            float _2867 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2865 = _2867;
        }
        float _2869 = _2865;
        if (_845)
        {
            _2627 = _1741;
        }
        float _2871 = _2627;
        if (_845)
        {
            _2629 = _1745;
        }
        float _2873 = _2629;
        float _2875 = _2863;
        if (!_845)
        {
            float _2877 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2875 = _2877;
        }
        float _2879 = _2875;
        float _2881 = _2871;
        if (!_845)
        {
            float _2883 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2881 = _2883;
        }
        float _2885 = _2881;
        float _2887 = _2873;
        if (!_845)
        {
            float _2889 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2887 = _2889;
        }
        float _2891 = _2887;
        if (_845)
        {
            _2631 = _1739;
        }
        float _2893 = _2631;
        float _2895 = _657 + _685;
        float _2897 = _2893;
        if (_845)
        {
            _2633 = _1739;
        }
        float _2899 = _2633;
        float _2901 = _2615 * 6.283184051513671875;
        float _2903 = _2899;
        if (!_845)
        {
            _2897 = _2869;
        }
        float _2905 = _2897;
        float _2907 = _549 * _2869;
        float _2909 = _2905;
        if (!_845)
        {
            _2903 = _2869;
        }
        float _2911 = _2903;
        float _2913 = _549 * _2879;
        float _2915 = _549 * _2905;
        float _2917 = _2911;
        if (_845)
        {
            _2909 = 0.60000002384185791015625;
        }
        float _2919 = _2909;
        float _2921 = _549 * _2911;
        float _2923 = _2919;
        if (!_845)
        {
            _2923 = _2879;
        }
        float _2925 = _2923;
        float _2927 = 1.0 / _2913;
        float _2929 = _2925;
        if (!_845)
        {
            _1819 = _2869;
        }
        float _2931 = _1819;
        float _2933 = _549 * _2885;
        if (_845)
        {
            _2917 = 0.60000002384185791015625;
        }
        float _2935 = _2917;
        float _2937 = _549 * _2891;
        float _2939 = _2935;
        if (!_845)
        {
            _2939 = _2879;
        }
        float _2941 = _2939;
        float _2943 = _549 * _2931;
        float _2945 = 1.0 / _2915;
        float _2947 = _549 * _2925;
        float _2949 = _2941;
        if (_845)
        {
            _2929 = 0.60000002384185791015625;
        }
        float _2951 = _2929;
        float _2953 = _2951;
        if (!_845)
        {
            _2953 = _2879;
        }
        float _2955 = _2953;
        float _2957 = 1.0 / _2933;
        float _2959 = 1.0 / _2937;
        float _2961 = _549 * _2941;
        float _2963 = _2955;
        if (_845)
        {
            _2949 = _1741;
        }
        float _2965 = _2949;
        float _2967 = _2965;
        if (!_845)
        {
            _2967 = _2885;
        }
        float _2969 = _2967;
        float _2971 = 1.0 / _2943;
        float _2973 = _549 * _2955;
        if (_845)
        {
            _2963 = _1741;
        }
        float _2975 = _2963;
        float _2977 = _2975;
        if (!_845)
        {
            _1821 = _2885;
        }
        float _2979 = _1821;
        float _2981 = _2979;
        if (!_845)
        {
            _2977 = _2885;
        }
        float _2983 = _2977;
        float _2985 = _2895 * 6.283184051513671875;
        float _2987 = 1.0 / _2907;
        float _2989 = _549 * _2979;
        float _2991 = _2983;
        if (_845)
        {
            _2981 = _1745;
        }
        float _2993 = _2981;
        float _2995 = _549 * _2969;
        float _2997 = _2993;
        if (!_845)
        {
            _2997 = _2891;
        }
        float _2999 = _2997;
        float _3001 = _549 * _2983;
        float _3003 = _2945 * _2985;
        if (_845)
        {
            _2991 = _1745;
        }
        float _3005 = _2991;
        float _3007 = 1.0 / _2921;
        float _3009 = _657 * 6.283184051513671875;
        float _3011 = _3005;
        float _3013 = _3009;
        if (!_845)
        {
            _3011 = _2891;
        }
        float _3015 = _3011;
        float _3017 = _3003 * 0.15915493667125701904296875;
        if (!_845)
        {
            _1823 = _2891;
        }
        float _3019 = _1823;
        float _3021 = _2971 * _3009;
        float _3023 = 1.0 / _2961;
        float _3025 = _3021 * 0.15915493667125701904296875;
        float _3027 = 1.0 / _2973;
        float _3029 = _549 * _3015;
        float _3031 = _2611 * _3007;
        float _3033 = _3031 * 6.283184051513671875;
        float _3035 = 1.0 / _3001;
        float _3037 = _549 * _2999;
        float _3039 = _3023 * _2985;
        float _3041 = _3033 * 0.15915493667125701904296875;
        float _3043 = _3023;
        float _3045 = _3041;
        if (_845)
        {
            _3043 = _1763;
        }
        float _3047 = _3043;
        float _3049 = _3047;
        if (!_845)
        {
            _3049 = _1765;
        }
        float _3051 = _3049;
        float _3053 = 1.0 / _3037;
        float _3055 = _549 * _3019;
        float _3057 = _2987 * _2901;
        float _3059 = _3057 * 0.15915493667125701904296875;
        float _3061 = _2927 * _2901;
        float _3063 = 1.0 / _3055;
        float _3065 = _3039 * 0.15915493667125701904296875;
        float _3067 = _3027 * _3009;
        float _3069 = _3061 * 0.15915493667125701904296875;
        float _3071 = _2957 * _2901;
        float _3073 = _3067 * 0.15915493667125701904296875;
        float _3075 = _3035 * _2985;
        float _3077 = 1.0 / _2947;
        float _3079 = _3071 * 0.15915493667125701904296875;
        float _3081 = _2959 * _2901;
        float _3083 = _3075 * 0.15915493667125701904296875;
        float _3085 = _3053 * _2985;
        float _3087 = _3035;
        float _3089 = _3053;
        if (_845)
        {
            _3087 = _1763;
        }
        float _3091 = _3087;
        float _3093 = _3081 * 0.15915493667125701904296875;
        float _3095 = _3091;
        if (_845)
        {
            _3089 = _1763;
        }
        float _3097 = _3089;
        float _3099 = 1.0 / _2989;
        float _3101 = _3085 * 0.15915493667125701904296875;
        float _3103 = _3063 * _3009;
        float _3105 = _3097;
        float _3107 = _3063;
        float _3109 = _3099;
        if (!_845)
        {
            _3095 = _1765;
        }
        float _3111 = _3095;
        _2635 = as_type<int>(_3111);
        if (!_845)
        {
            _3105 = _1765;
        }
        float _3113 = _3105;
        float _3115 = _3103 * 0.15915493667125701904296875;
        if (!_845)
        {
            _1825 = _1765;
        }
        float _3117 = _1825;
        float _3119 = 1.0 / _2995;
        float _3121 = _2611 * _3077;
        float _3123 = _3077;
        if (_845)
        {
            _1827 = _1751;
        }
        float _3125 = _1827;
        float _3127 = _3125;
        if (_845)
        {
            _3123 = _1751;
        }
        float _3129 = _3123;
        float _3131 = _3121 * 6.283184051513671875;
        float _3133 = _3129;
        float _3135 = _3131;
        if (!_845)
        {
            _3127 = _1753;
        }
        float _3137 = _3127;
        float _3139 = 1.0 / _3029;
        float _3141 = _3131 * 0.15915493667125701904296875;
        if (!_845)
        {
            _3133 = _1753;
        }
        float _3143 = _3133;
        if (_845)
        {
            _3135 = _1755;
        }
        float _3145 = _3135;
        float _3147 = _3145;
        if (!_845)
        {
            _3147 = _1757;
        }
        float _3149 = _3147;
        float _3151 = _3017 * 6.283185482025146484375;
        float _3153 = sin(_3151);
        float _3155 = _2611 * _3119;
        if (_845)
        {
            _3107 = _1759;
        }
        float _3157 = _3107;
        float _3159 = _3157;
        if (!_845)
        {
            _3159 = _1761;
        }
        float _3161 = _3159;
        float _3163 = _3155 * 6.283184051513671875;
        float _3165 = _2611 * _3139;
        float _3167 = _3099 * _3009;
        float _3169 = _3059 * 6.283185482025146484375;
        float _3171 = sin(_3169);
        float _3173 = _3163;
        if (_845)
        {
            _3013 = _1759;
        }
        float _3175 = _3013;
        float _3177 = _3165 * 6.283184051513671875;
        float _3179 = _3167 * 0.15915493667125701904296875;
        float _3181 = _3175;
        float _3183 = _3179;
        if (_845)
        {
            _3109 = _1759;
        }
        float _3185 = _3109;
        float _3187 = _3177 * 0.15915493667125701904296875;
        float _3189 = _3185;
        if (!_845)
        {
            _3181 = _1761;
        }
        float _3191 = _3181;
        float _3193 = _3025 * 6.283185482025146484375;
        float _3195 = sin(_3193);
        if (!_845)
        {
            _3189 = _1761;
        }
        float _3197 = _3189;
        if (!_845)
        {
            _1829 = _1761;
        }
        float _3199 = _1829;
        float _3201 = _3041 * 6.283185482025146484375;
        float _3203 = sin(_3201);
        float _3205 = _3171 * _3137;
        float _3207 = _3179 * 6.283185482025146484375;
        float _3209 = sin(_3207);
        if (_845)
        {
            _3045 = _1755;
        }
        float _3211 = _3045;
        float _3213 = _3211;
        if (!_845)
        {
            _3213 = _1757;
        }
        float _3215 = _3213;
        float _3217 = _3069 * 6.283185482025146484375;
        float _3219 = sin(_3217);
        _2855 = _3215;
        if (_845)
        {
            _3183 = _1751;
        }
        float _3221 = _3183;
        float _3223 = _3203 * _3143;
        float _3225 = _3221;
        if (!_845)
        {
            _3225 = _1753;
        }
        float _3227 = _3225;
        if (!_845)
        {
            _1831 = _1753;
        }
        float _3229 = _1831;
        float _3231 = _3163 * 0.15915493667125701904296875;
        if (_845)
        {
            _3173 = _1755;
        }
        float _3233 = _3173;
        float _3235 = _3065 * 6.283185482025146484375;
        float _3237 = sin(_3235);
        float _3239 = _3233;
        if (!_845)
        {
            _3239 = _1757;
        }
        float _3241 = _3239;
        float _3243 = _3153 * _3227;
        if (!_845)
        {
            _1833 = _1757;
        }
        float _3245 = _1833;
        float _3247 = _3195 * _3229;
        float _3249 = _3073 * 6.283185482025146484375;
        float _3251 = sin(_3249);
        float _3253 = fma(_3219, _3241, _3205);
        float _3255 = _3141 * 6.283185482025146484375;
        float _3257 = sin(_3255);
        float _3259 = fma(_3237, _3149, _3243);
        float _3261 = _3079 * 6.283185482025146484375;
        float _3263 = sin(_3261);
        float _3265 = fma(_3251, _3245, _3247);
        float _3267 = fma(_3209, _3199, _3265);
        float _3269 = _3083 * 6.283185482025146484375;
        float _3271 = sin(_3269);
        float _3273 = fma(_3257, _3215, _3223);
        float _3275 = _3231 * 6.283185482025146484375;
        float _3277 = sin(_3275);
        float _3279 = fma(_3263, _3191, _3253);
        float _3281 = _3093 * 6.283185482025146484375;
        float _3283 = sin(_3281);
        float _3285 = fma(_3271, _3161, _3259);
        float _3287 = _3101 * 6.283185482025146484375;
        float _3289 = sin(_3287);
        float _3291 = fma(_3277, _3197, _3273);
        float _3293 = _3115 * 6.283185482025146484375;
        float _3295 = sin(_3293);
        float _3297 = fma(_3283, _3111, _3279);
        float _3299 = _3187 * 6.283185482025146484375;
        float _3301 = sin(_3299);
        float _3303 = fma(_3289, _3113, _3285);
        float _3305 = fma(_3295, _3117, _3267);
        float _3307 = -_3303;
        float _3309 = _3307 + _3305;
        float _3311 = fma(_3301, _3051, _3291);
        float _3313 = -_3311;
        float _3315 = _3297 + _3313;
        float _3317 = _3315 + _3309;
        _2851 = _3317;
        _2853 = _3315;
        _2857 = _3253;
    }
    _2859 = false;
    float _3319 = _2851;
    float _3321 = _2853;
    float _3323 = _2855;
    float _3325 = _2857;
    int _3327 = _2635;
    float _3329 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _3331 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _3333 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _3335 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _3337 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _3339 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _3341 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _3343 = uint(int(uint(_193) >> uint(2)));
    float _3345 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3343)]);
    float _3347 = fma(_565, _1771, _805);
    float _3349 = fma(_567, _2609, _807);
    float _3351 = fma(_569, _3319, _811);
    bool _3353 = _3329 > 0.0;
    bool _3355 = _3331 > 0.0;
    float _3357 = _3333 * _3331;
    float _3359 = _555 * _3335;
    float _3361 = _3321;
    float _3363 = _3333;
    float _3365 = _3323;
    bool _3367 = _3355;
    float _3369 = _3357;
    float _3371 = _3325;
    float _3373 = _3359;
    float _3375 = _3337;
    float _3377 = _3341;
    if (_3353)
    {
        float _3379 = 1.0 / _3329;
        _3361 = _3379;
    }
    float _3381 = _3361;
    float _3383 = _555 * _3339;
    float _3385 = _3383;
    if (_3355)
    {
        float _3387 = -_3357;
        float _3389 = fma(_283, _3387, _3333);
        _3363 = _3389;
    }
    float _3391 = _3363;
    float _3393 = _555 * _3337;
    float _3395 = _3381;
    float _3397 = _3391;
    if (_3353)
    {
        float _3399 = _737 * _3381;
        _3365 = _3399;
    }
    float _3401 = _3365;
    float _3403 = _3401;
    if (_3353)
    {
        float _3405 = precise::min(_3401, 1.0);
        _3395 = _3405;
    }
    float _3407 = _3395;
    float _3409 = _3407;
    if (_3353)
    {
        float _3411 = _3407 * _3391;
        _3397 = _3411;
    }
    float _3413 = _3397;
    float _3415 = _3393 * _3413;
    float _3417 = _3359 * _3413;
    float _3419 = _3383 * _3413;
    bool _3421 = !_191;
    float _3423 = _3413;
    float _3425 = _3417;
    float _3427 = _3419;
    float _3549;
    if (!_3421)
    {
        float _3429 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3431 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3433 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3435 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3437 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3439 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3441 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3443 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3445 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3447 = _3433 * _3435;
        float _3449 = _3433 * _3437;
        float _3451 = _3431 * _3435;
        float _3453 = -_3447;
        float _3455 = fma(_3429, _3439, _3453);
        float _3457 = -_3449;
        float _3459 = fma(_3431, _3439, _3457);
        float _3461 = -_3451;
        float _3463 = fma(_3429, _3437, _3461);
        float _3465 = _3443 * _3429;
        float _3467 = _3443 * _3455;
        float _3469 = _3445 * _3431;
        float _3471 = _3441 * _3437;
        float _3473 = -_3465;
        float _3475 = fma(_3441, _3431, _3473);
        float _3477 = -_3467;
        float _3479 = fma(_3441, _3459, _3477);
        float _3481 = _3443 * _3439;
        float _3483 = _3445 * _3435;
        float _3485 = _3441 * _3433;
        float _3487 = fma(_3445, _3463, _3479);
        float _3489 = -_3481;
        float _3491 = fma(_3445, _3437, _3489);
        float _3493 = -_3483;
        float _3495 = fma(_3441, _3439, _3493);
        float _3497 = -_3471;
        float _3499 = fma(_3443, _3435, _3497);
        float _3501 = 1.0 / _3487;
        float _3503 = -_3485;
        float _3505 = fma(_3445, _3429, _3503);
        float _3507 = -_3429;
        float _3509 = fma(_3507, _3439, _3447);
        float _3511 = -_3469;
        float _3513 = fma(_3443, _3433, _3511);
        float _3515 = _3491 * _3501;
        float _3517 = _3495 * _3501;
        float _3519 = _3499 * _3501;
        float _3521 = _3417 * _3501;
        float _3523 = _3415 * _3515;
        float _3525 = _3415 * _3517;
        float _3527 = _3509 * _3501;
        float _3529 = _3415 * _3519;
        float _3531 = _3513 * _3501;
        float _3533 = _3505 * _3501;
        float _3535 = fma(_3459, _3521, _3523);
        float _3537 = fma(_3417, _3527, _3525);
        float _3539 = _3475 * _3501;
        float _3541 = fma(_3463, _3521, _3529);
        float _3543 = fma(_3419, _3531, _3535);
        float _3545 = fma(_3419, _3533, _3537);
        float _3547 = fma(_3419, _3539, _3541);
        _621 = _3537;
        _623 = _3531;
        _625 = _3523;
        _1835 = _3535;
        _2637 = _3441;
        _3403 = _3443;
        _3369 = _3445;
        _3371 = _3533;
        _3373 = _3525;
        _3375 = _3437;
        _3385 = _3439;
        _3377 = _3517;
        _3549 = _3545;
        _3425 = _3543;
        _3427 = _3547;
        _3409 = _3513;
        _3551 = true;
    }
    else
    {
        int _3553 = as_type<int>(_169) & 1024;
        bool _3555 = _3553 != 0;
        if (_3555)
        {
            _3367 = true;
        }
        bool _3557 = _3367;
        bool _3559 = _3557;
        if (!_3555)
        {
            int _3561 = as_type<int>(_169) & 2048;
            bool _3563 = _3561 != 0;
            _3559 = _3563;
        }
        bool _3565 = _3559;
        if (!_3565)
        {
            _3423 = _3415;
        }
        float _3567 = _3423;
        bool _3569 = !_3565;
        _3549 = _3567;
        if (!_3569)
        {
            uint _3571 = uint(int(uint(_171) >> uint(2)));
            float _3573 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3571)]);
            int _3575 = _171 + 4;
            uint _3577 = uint(int(uint(_3575) >> uint(2)));
            float _3579 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3577)]);
            int _3581 = _171 + 8;
            uint _3583 = uint(int(uint(_3581) >> uint(2)));
            float _3585 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3583)]);
            uint _3587 = uint(int(uint(_171) >> uint(2)));
            float _3589 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3587)]);
            int _3591 = _171 + 4;
            uint _3593 = uint(int(uint(_3591) >> uint(2)));
            float _3595 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3593)]);
            int _3597 = _171 + 8;
            uint _3599 = uint(int(uint(_3597) >> uint(2)));
            float _3601 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3599)]);
            uint _3603 = uint(int(uint(_171) >> uint(2)));
            float _3605 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3603)]);
            int _3607 = _171 + 4;
            uint _3609 = uint(int(uint(_3607) >> uint(2)));
            float _3611 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3609)]);
            int _3613 = _171 + 8;
            uint _3615 = uint(int(uint(_3613) >> uint(2)));
            float _3617 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3615)]);
            float _3619 = _3585 * _3589;
            float _3621 = _3585 * _3595;
            float _3623 = _3579 * _3589;
            float _3625 = -_3619;
            float _3627 = fma(_3573, _3601, _3625);
            float _3629 = -_3621;
            float _3631 = fma(_3579, _3601, _3629);
            float _3633 = -_3623;
            float _3635 = fma(_3573, _3595, _3633);
            float _3637 = _3611 * _3573;
            float _3639 = _3611 * _3627;
            float _3641 = _3617 * _3579;
            float _3643 = _3605 * _3595;
            float _3645 = -_3637;
            float _3647 = fma(_3605, _3579, _3645);
            float _3649 = -_3639;
            float _3651 = fma(_3605, _3631, _3649);
            float _3653 = _3611 * _3601;
            float _3655 = _3617 * _3589;
            float _3657 = _3605 * _3585;
            float _3659 = fma(_3617, _3635, _3651);
            float _3661 = -_3653;
            float _3663 = fma(_3617, _3595, _3661);
            float _3665 = -_3655;
            float _3667 = fma(_3605, _3601, _3665);
            float _3669 = -_3643;
            float _3671 = fma(_3611, _3589, _3669);
            float _3673 = 1.0 / _3659;
            float _3675 = -_3657;
            float _3677 = fma(_3617, _3573, _3675);
            float _3679 = -_3573;
            float _3681 = fma(_3679, _3601, _3619);
            float _3683 = -_3641;
            float _3685 = fma(_3611, _3585, _3683);
            float _3687 = _3663 * _3673;
            float _3689 = _3667 * _3673;
            float _3691 = _3671 * _3673;
            float _3693 = _3417 * _3673;
            float _3695 = _3415 * _3687;
            float _3697 = _3415 * _3689;
            float _3699 = _3681 * _3673;
            float _3701 = _3415 * _3691;
            float _3703 = _3685 * _3673;
            float _3705 = _3677 * _3673;
            float _3707 = fma(_3631, _3693, _3695);
            float _3709 = fma(_3417, _3699, _3697);
            float _3711 = _3647 * _3673;
            float _3713 = fma(_3635, _3693, _3701);
            float _3715 = fma(_3419, _3703, _3707);
            float _3717 = fma(_3419, _3705, _3709);
            float _3719 = fma(_3419, _3711, _3713);
            _621 = _3709;
            _623 = _3703;
            _625 = _3695;
            _1835 = _3707;
            _2637 = _3605;
            _3403 = _3611;
            _3369 = _3617;
            _3371 = _3705;
            _3373 = _3697;
            _3375 = _3595;
            _3385 = _3601;
            _3377 = _3689;
            _3549 = _3717;
            _3425 = _3715;
            _3427 = _3719;
            _3409 = _3685;
        }
    }
    _3551 = false;
    float _3721 = _621;
    float _3723 = _623;
    float _3725 = _625;
    float _3727 = _1835;
    float _3729 = _2637;
    float _3731 = _3403;
    float _3733 = _3369;
    float _3735 = _3371;
    float _3737 = _3373;
    float _3739 = _3375;
    float _3741 = _3385;
    float _3743 = _3377;
    float _3745 = _3549;
    float _3747 = _3425;
    float _3749 = _3427;
    float _3751 = _3409;
    uint _3753 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3753)] = as_type<uint>(_3345);
    float _3755 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _3757 = as_type<int>(_3755) & 512;
    bool _3759 = _3757 != 0;
    int _3761 = as_type<int>(_3755) & 1024;
    bool _3763 = _3761 != 0;
    float _3765 = _3721;
    float _3767 = _3723;
    float _3769 = _3725;
    float _3771 = _3727;
    float _3773 = _3747;
    float _3775 = _3749;
    float _3777 = _3745;
    float _3779 = _3751;
    if (_3759)
    {
        float _3781 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3783 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3785 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3787 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3765 = _3781;
        _3767 = _3783;
        _3769 = _3785;
        _3771 = _3787;
    }
    float _3789 = _3765;
    float _3791 = _3767;
    float _3793 = _3769;
    float _3795 = _3771;
    float _3797 = _3729;
    float _3799 = _3731;
    float _3801 = _3733;
    float _3803 = _3735;
    if (_3759)
    {
        float _3805 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3807 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3809 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3811 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3797 = _3805;
        _3799 = _3807;
        _3801 = _3809;
        _3803 = _3811;
    }
    float _3813 = _3797;
    float _3815 = _3799;
    float _3817 = _3801;
    float _3819 = _3803;
    float _3821 = _3737;
    float _3823 = _3739;
    float _3825 = _3741;
    float _3827 = _3743;
    if (_3759)
    {
        float _3829 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3831 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3833 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3835 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3821 = _3829;
        _3823 = _3831;
        _3825 = _3833;
        _3827 = _3835;
    }
    float _3837 = _3821;
    float _3839 = _3823;
    float _3841 = _3825;
    float _3843 = _3827;
    float _3845 = _3349 + _3745;
    float _3847 = _3347 + _3747;
    float _3849 = _3351 + _3749;
    if (!_3759)
    {
        _3773 = 0.0;
    }
    float _3851 = _3773;
    float _3853 = _3851;
    if (!_3759)
    {
        _3775 = 0.0;
    }
    float _3855 = _3775;
    float _3857 = _3855;
    if (!_3759)
    {
        _3777 = 0.0;
    }
    float _3859 = _3777;
    int _3861 = as_type<int>(_3755) & 2048;
    bool _3863 = _3861 != 0;
    float _3865 = _3789;
    float _3867 = _3859;
    if (_3759)
    {
        float _3869 = _3845 * _3791;
        _3779 = _3869;
    }
    float _3871 = _3779;
    float _3873 = _3815;
    float _3875 = _3839;
    float _3877 = _3837;
    float _3879 = _3817;
    if (_3759)
    {
        float _3881 = _3845 * _3815;
        _3873 = _3881;
    }
    float _3883 = _3873;
    float _3885 = _3883;
    if (_3759)
    {
        float _3887 = fma(_3847, _3789, _3871);
        _3865 = _3887;
    }
    float _3889 = _3865;
    float _3891 = _3889;
    if (_3759)
    {
        float _3893 = _3845 * _3839;
        _3875 = _3893;
    }
    float _3895 = _3875;
    if (_3759)
    {
        float _3897 = fma(_3847, _3813, _3883);
        _3885 = _3897;
    }
    float _3899 = _3885;
    if (_3759)
    {
        float _3901 = fma(_3849, _3793, _3889);
        _3891 = _3901;
    }
    float _3903 = _3891;
    if (_3759)
    {
        float _3905 = fma(_3847, _3837, _3895);
        _3877 = _3905;
    }
    float _3907 = _3877;
    float _3909 = _3907;
    if (_3759)
    {
        float _3911 = fma(_3849, _3817, _3899);
        _3879 = _3911;
    }
    float _3913 = _3879;
    if (_3759)
    {
        float _3915 = _3795 + _3903;
        _3853 = _3915;
    }
    float _3917 = _3853;
    float _3919 = _3917;
    if (_3759)
    {
        float _3921 = fma(_3849, _3841, _3907);
        _3909 = _3921;
    }
    float _3923 = _3909;
    if (_3759)
    {
        float _3925 = _3819 + _3913;
        _3857 = _3925;
    }
    float _3927 = _3857;
    float _3929 = _3927;
    if (_3759)
    {
        float _3931 = _3843 + _3923;
        _3867 = _3931;
    }
    float _3933 = _3867;
    bool _3935 = !_3763;
    float _3937 = _3933;
    if (!_3935)
    {
        float _3939 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _3941 = uint(int(uint(_171) >> uint(2)));
        float _3943 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3941)]);
        int _3945 = _171 + 4;
        uint _3947 = uint(int(uint(_3945) >> uint(2)));
        float _3949 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3947)]);
        int _3951 = _171 + 8;
        uint _3953 = uint(int(uint(_3951) >> uint(2)));
        float _3955 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3953)]);
        uint _3957 = uint(int(uint(_171) >> uint(2)));
        float _3959 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3957)]);
        int _3961 = _171 + 4;
        uint _3963 = uint(int(uint(_3961) >> uint(2)));
        float _3965 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3963)]);
        int _3967 = _171 + 8;
        uint _3969 = uint(int(uint(_3967) >> uint(2)));
        float _3971 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3969)]);
        uint _3973 = uint(int(uint(_171) >> uint(2)));
        float _3975 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3973)]);
        int _3977 = _171 + 4;
        uint _3979 = uint(int(uint(_3977) >> uint(2)));
        float _3981 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3979)]);
        int _3983 = _171 + 8;
        uint _3985 = uint(int(uint(_3983) >> uint(2)));
        float _3987 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3985)]);
        float _3989 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _3991 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _3993 = _3845 * _3949;
        float _3995 = _3845 * _3965;
        float _3997 = _3845 * _3981;
        float _3999 = fma(_3847, _3943, _3993);
        float _4001 = fma(_3847, _3959, _3995);
        float _4003 = fma(_3847, _3975, _3997);
        float _4005 = fma(_3849, _3955, _3999);
        float _4007 = fma(_3849, _3971, _4001);
        float _4009 = fma(_3849, _3987, _4003);
        float _4011 = _3939 + _4005;
        float _4013 = _3989 + _4007;
        float _4015 = _3991 + _4009;
        _3929 = _4013;
        _3919 = _4011;
        _3937 = _4015;
    }
    float _4017 = _3929;
    float _4019 = _3919;
    float _4021 = _3937;
    bool _4023 = !_3863;
    float _4025 = _4017;
    float _4027 = _4019;
    float _4029 = _4021;
    if (!_4023)
    {
        uint _4031 = uint(int(uint(_171) >> uint(2)));
        float _4033 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4031)]);
        int _4035 = _171 + 4;
        uint _4037 = uint(int(uint(_4035) >> uint(2)));
        float _4039 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4037)]);
        int _4041 = _171 + 8;
        uint _4043 = uint(int(uint(_4041) >> uint(2)));
        float _4045 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4043)]);
        int _4047 = _171 + 12;
        uint _4049 = uint(int(uint(_4047) >> uint(2)));
        float _4051 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4049)]);
        uint _4053 = uint(int(uint(_171) >> uint(2)));
        float _4055 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4053)]);
        int _4057 = _171 + 4;
        uint _4059 = uint(int(uint(_4057) >> uint(2)));
        float _4061 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4059)]);
        int _4063 = _171 + 8;
        uint _4065 = uint(int(uint(_4063) >> uint(2)));
        float _4067 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4065)]);
        int _4069 = _171 + 12;
        uint _4071 = uint(int(uint(_4069) >> uint(2)));
        float _4073 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4071)]);
        uint _4075 = uint(int(uint(_171) >> uint(2)));
        float _4077 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4075)]);
        int _4079 = _171 + 4;
        uint _4081 = uint(int(uint(_4079) >> uint(2)));
        float _4083 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4081)]);
        int _4085 = _171 + 8;
        uint _4087 = uint(int(uint(_4085) >> uint(2)));
        float _4089 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4087)]);
        int _4091 = _171 + 12;
        uint _4093 = uint(int(uint(_4091) >> uint(2)));
        float _4095 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4093)]);
        float _4097 = _3845 * _4039;
        float _4099 = _3845 * _4061;
        float _4101 = fma(_3847, _4033, _4097);
        float _4103 = _3845 * _4083;
        float _4105 = fma(_3847, _4055, _4099);
        float _4107 = fma(_3847, _4077, _4103);
        float _4109 = fma(_3849, _4045, _4101);
        float _4111 = fma(_3849, _4067, _4105);
        float _4113 = fma(_3849, _4089, _4107);
        float _4115 = _4109 + _4051;
        float _4117 = _4111 + _4073;
        float _4119 = _4113 + _4095;
        _4025 = _4117;
        _4027 = _4115;
        _4029 = _4119;
    }
    float _4121 = _4025;
    float _4123 = _4027;
    float _4125 = _4029;
    float _4127 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _4129 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _4131 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _4133 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _4135 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _4137 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _4139 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _4141 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _4143 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _4145 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _4147 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _4149 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _4151 = _4129 * _4121;
    float _4153 = fma(_4127, _4123, _4151);
    float _4155 = fma(_4131, _4125, _4153);
    float _4157 = _4133 + _4155;
    float _4159 = -_4157;
    bool _4161 = _4135 >= _4159;
    bool _4163 = isnan(_4135);
    bool _4165 = _4161 || _4163;
    bool _4167 = isnan(_4159);
    bool _4169 = _4165 || _4167;
    float _4171 = -_4157;
    bool _4173 = _4137 >= _4171;
    bool _4175 = isnan(_4137);
    bool _4177 = _4173 || _4175;
    bool _4179 = isnan(_4171);
    bool _4181 = _4177 || _4179;
    int _4183 = _4169 ? 0 : 1;
    int _4185 = 2;
    float _4187 = _4123;
    if (_4169)
    {
        _4185 = 1;
    }
    int _4189 = _4185;
    int _4191 = _4189;
    if (_4181)
    {
        _4191 = _4183;
    }
    int _4193 = _4191;
    int _4195 = _4193 << 6;
    int _4197 = _4195 + 96;
    uint _4199 = uint(int(uint(_4197) >> uint(2)));
    float _4201 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4199)]);
    int _4203 = _4197 + 4;
    uint _4205 = uint(int(uint(_4203) >> uint(2)));
    float _4207 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4205)]);
    int _4209 = _4197 + 8;
    uint _4211 = uint(int(uint(_4209) >> uint(2)));
    float _4213 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4211)]);
    int _4215 = _4197 + 12;
    uint _4217 = uint(int(uint(_4215) >> uint(2)));
    float _4219 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4217)]);
    int _4221 = _4195 + 48;
    int _4223 = _4195 + 64;
    uint _4225 = uint(int(uint(_4221) >> uint(2)));
    float _4227 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4225)]);
    int _4229 = _4221 + 4;
    uint _4231 = uint(int(uint(_4229) >> uint(2)));
    float _4233 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4231)]);
    int _4235 = _4221 + 8;
    uint _4237 = uint(int(uint(_4235) >> uint(2)));
    float _4239 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4237)]);
    int _4241 = _4221 + 12;
    uint _4243 = uint(int(uint(_4241) >> uint(2)));
    float _4245 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4243)]);
    uint _4247 = uint(int(uint(_4223) >> uint(2)));
    float _4249 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4247)]);
    int _4251 = _4223 + 4;
    uint _4253 = uint(int(uint(_4251) >> uint(2)));
    float _4255 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4253)]);
    int _4257 = _4223 + 8;
    uint _4259 = uint(int(uint(_4257) >> uint(2)));
    float _4261 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4259)]);
    int _4263 = _4223 + 12;
    uint _4265 = uint(int(uint(_4263) >> uint(2)));
    float _4267 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4265)]);
    int _4269 = _4195 + 80;
    float _4271 = _4139 + 1.0;
    float _4273 = _4271 + _4121;
    uint _4275 = uint(int(uint(_4269) >> uint(2)));
    float _4277 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4275)]);
    int _4279 = _4269 + 4;
    uint _4281 = uint(int(uint(_4279) >> uint(2)));
    float _4283 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4281)]);
    int _4285 = _4269 + 8;
    uint _4287 = uint(int(uint(_4285) >> uint(2)));
    float _4289 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4287)]);
    int _4291 = _4269 + 12;
    uint _4293 = uint(int(uint(_4291) >> uint(2)));
    float _4295 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4293)]);
    float _4297 = _4273 * _4143;
    float _4299 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _4301 = fma(_4141, _4123, _4297);
    float _4303 = fma(_4145, _4125, _4301);
    float _4305 = _4147 + _4303;
    float _4307 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _4309 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _4311 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _4313 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _4315 = trunc(_4305);
    int _4317 = int(_4315);
    int _4319 = ~as_type<int>(_4149);
    int _4321 = _4317 + _4319;
    int _4323 = _4321 + 1;
    bool _4325 = _4323 >= 0;
    int _4327 = _3327;
    float _4329 = as_type<float>(_4193);
    if (_4325)
    {
        float _4331 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _4327 = as_type<int>(_4331);
    }
    int _4333 = _4327;
    float _4335 = _4273 * _4207;
    float _4337 = fma(_4201, _4123, _4335);
    float _4339 = fma(_4213, _4125, _4337);
    float _4341 = _4219 + _4339;
    float _4343 = _4273 * _4233;
    float _4345 = 1.0 / _4341;
    float _4347 = fma(_4227, _4123, _4343);
    float _4349 = _4273 * _4255;
    float _4351 = fma(_4239, _4125, _4347);
    float _4353 = fma(_4249, _4123, _4349);
    float _4355 = _4245 + _4351;
    float _4357 = fma(_4261, _4125, _4353);
    float _4359 = _4355 * _4345;
    float _4361 = _4267 + _4357;
    bool _4363 = _4359 >= 0.0;
    float _4365 = _4361 * _4345;
    bool _4367 = _4359 <= 1.0;
    bool _4369 = _4367 && _4363;
    bool _4371 = _4365 >= 0.0;
    bool _4373 = _4371 && _4369;
    bool _4375 = _4365 <= 1.0;
    bool _4377 = _4375 && _4373;
    float _4379 = _4273 * _4283;
    float _4381 = fma(_4277, _4123, _4379);
    if (_4377)
    {
        float _4383 = float(_4193);
        _4329 = _4383;
    }
    float _4385 = _4329;
    float _4387 = _4355;
    if (_4377)
    {
        float _4389 = rint(_4385);
        float _4391 = precise::max(_4389, 0.0);
        uint _4393 = uint(_4391);
        uint _4395 = clamp(_4393, 0u, 65535u);
        _4387 = as_type<float>(_4395);
    }
    float _4397 = _4387;
    float _4399 = fma(_4289, _4125, _4381);
    float _4401 = _4295 + _4399;
    float _4403 = _4401 * _4345;
    float _4405 = _4397;
    if (_4377)
    {
        float3 _11127 = float3(_4359, _4365, float(as_type<int>(_4397)));
        float3 _11131 = select(_11127, float3(0.0), isnan(_11127));
        float _4407 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _11131.xy, uint(rint(_11131.z)), _4403, level(0.0));
        _4405 = _4407;
    }
    float _4409 = _4405;
    float _4411 = _4273 * _4309;
    float _4413 = fma(_4307, _4123, _4411);
    float _4415 = fma(_4311, _4125, _4413);
    float _4417 = _4313 + _4415;
    float _4419 = trunc(_4417);
    int _4421 = int(_4419);
    bool _4423 = _4333 <= _4323;
    bool _4425 = !_4325;
    bool _4427 = _4423 || _4425;
    int _4429 = ~as_type<int>(_4299);
    int _4431 = _4421 + _4429;
    int _4433 = _4431 + 1;
    bool _4435 = _4433 < 0;
    bool _4437 = _4435 || _4427;
    int _4439 = as_type<int>(_4413);
    float _4441 = as_type<float>(_4421);
    if (!_4437)
    {
        float _4443 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _4439 = as_type<int>(_4443);
    }
    int _4445 = _4439;
    bool _4447 = _4445 <= _4433;
    bool _4449 = _4447 || _4437;
    if (_4449)
    {
        _4441 = 1.0;
    }
    float _4451 = _4441;
    float _4453 = _4451;
    if (!_4449)
    {
        float _4455 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _4457 = _4433 * as_type<int>(_4455);
        int _4459 = _4457 + _4323;
        int _4461 = _4459 << 2;
        uint _4463 = uint(int(uint(_4459) >> uint(2)));
        int _4465 = 12 & _4461;
        int _4467 = int(_4463) << 4;
        int _4469 = _4467 + _4465;
        int _4471 = _4469 + 400;
        uint _4473 = uint(int(uint(_4471) >> uint(2)));
        float _4475 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4473)]);
        float _4477 = floor(_4305);
        float _4479 = floor(_4417);
        float _4481 = -_4477;
        float _4483 = _4305 + _4481;
        float _4485 = -_4479;
        float _4487 = _4417 + _4485;
        float _4489 = rint(_4475);
        float _4491 = precise::max(_4489, 0.0);
        uint _4493 = uint(_4491);
        uint _4495 = clamp(_4493, 0u, 65535u);
        float3 _11266 = float3(_4483, _4487, float(int(_4495)));
        float3 _11268 = select(_11266, float3(0.0), isnan(_11266));
        float _4497 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _11268.xy, uint(rint(_11268.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _11268.xy, uint(rint(_11268.z)), level(0.0)).x;
        int _4499 = _4459 << 4;
        int _4501 = _4499 + 2048;
        uint _4503 = uint(int(uint(_4501) >> uint(2)));
        float _4505 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4503)]);
        int _4507 = _4501 + 4;
        uint _4509 = uint(int(uint(_4507) >> uint(2)));
        float _4511 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4509)]);
        int _4513 = _4501 + 8;
        uint _4515 = uint(int(uint(_4513) >> uint(2)));
        float _4517 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4515)]);
        int _4519 = _4501 + 12;
        uint _4521 = uint(int(uint(_4519) >> uint(2)));
        float _4523 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4521)]);
        float _4525 = _4273 * _4511;
        float _4527 = fma(_4505, _4123, _4525);
        float _4529 = fma(_4517, _4125, _4527);
        float _4531 = _4523 + _4529;
        float _4533 = precise::clamp(_4531, 0.0, 1.0);
        float _4535 = -_4533;
        float _4537 = _4535 + _4497;
        float _4539 = fma(_4537, 500.0, 1.5);
        float _4541 = exp2(_4539);
        float _4543 = 0.0 + _4541;
        float _4545 = precise::clamp(_4543, 0.0, 1.0);
        _4187 = 500.0;
        _4453 = _4545;
    }
    float _4547 = _4187;
    float _4549 = _4453;
    uint _4551 = uint(int(uint(_171) >> uint(2)));
    float _4553 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_4551)]);
    float _4555 = _4547;
    if (!_4377)
    {
        _4555 = 1.0;
    }
    float _4557 = _4555;
    bool _4559 = _737 > 0.001000000047497451305389404296875;
    bool _4561 = isnan(_737);
    bool _4563 = _4559 || _4561;
    bool _4565 = isnan(0.001000000047497451305389404296875);
    bool _4567 = _4563 || _4565;
    float _4569 = -_181;
    float _4571 = _4569 + _3845;
    float _4573 = _4557;
    if (_4377)
    {
        bool _4575 = _4409 >= _4403;
        bool _4577 = isnan(_4409);
        bool _4579 = _4575 || _4577;
        bool _4581 = isnan(_4403);
        bool _4583 = _4579 || _4581;
        float _4585 = float(_4583);
        _4573 = _4585;
    }
    float _4587 = _4573;
    float _4589 = -_187;
    float _4591 = _4589 + _3849;
    int _4593 = _171 + 4;
    int _4595 = _171 + 8;
    float _4597 = -_4587;
    float _4599 = fma(_4597, _4549, 1.0);
    float _4601 = -_4553;
    float _4603 = _4599 + _4601;
    float _4605 = _4599;
    if (_4567)
    {
        float _4607 = fma(_4603, 0.0500000007450580596923828125, _4553);
        _4605 = _4607;
    }
    float _4609 = _4605;
    float _4611 = -_175;
    float _4613 = _4611 + _3847;
    float _4615 = precise::max(0.0, _4609);
    float _4617 = precise::min(_4615, 0.999000012874603271484375);
    uint _4619 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_4619)] = as_type<uint>(_4617);
    uint _4621 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4621)] = as_type<uint>(_3345);
    uint _4623 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4623)] = as_type<uint>(_3847);
    uint _4625 = uint(int(uint(_4593) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4625)] = as_type<uint>(_3845);
    uint _4627 = uint(int(uint(_4595) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4627)] = as_type<uint>(_3849);
    uint _4629 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4629)] = as_type<uint>(_809);
    uint _4631 = uint(int(uint(_4593) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4631)] = as_type<uint>(_793);
    uint _4633 = uint(int(uint(_4595) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4633)] = as_type<uint>(_813);
    uint _4635 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4635)] = as_type<uint>(_4613);
    uint _4637 = uint(int(uint(_4593) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4637)] = as_type<uint>(_4571);
    uint _4639 = uint(int(uint(_4595) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4639)] = as_type<uint>(_4591);
    float _4641 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4643 = _4571 * _4571;
    float _4645 = _793 * _793;
    float _4647 = fma(_4613, _4613, _4643);
    float _4649 = fma(_809, _809, _4645);
    float _4651 = fma(_4591, _4591, _4647);
    float _4653 = fma(_813, _813, _4649);
    float _4655 = sqrt(_4653);
    float _4657 = sqrt(_4651);
    bool _4659 = _4657 >= 9.9999999747524270787835121154785e-07;
    bool _4661 = isnan(_4657);
    bool _4663 = _4659 || _4661;
    bool _4665 = isnan(9.9999999747524270787835121154785e-07);
    bool _4667 = _4663 || _4665;
    if (!_4667)
    {
        bool _4669 = _561 != _303;
        bool _4671 = isnan(_561);
        bool _4673 = _4669 || _4671;
        bool _4675 = isnan(_303);
        bool _4677 = _4673 || _4675;
        _4679 = _4677;
        if (!_4679)
        {
            float _4681 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _4683 = _4681 > 0.0;
            bool _4685 = !_4683;
            if (!_4685)
            {
                float _4687 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _4689 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _4691 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _4693 = _4689 * _523;
                float _4695 = _4689 * _529;
                float _4697 = _4689 * _531;
                float _4699 = fma(_4687, _525, _4693);
                float _4701 = fma(_4687, _533, _4695);
                float _4703 = fma(_4687, _535, _4697);
                float _4705 = fma(_4691, _527, _4699);
                float _4707 = fma(_4691, _537, _4701);
                float _4709 = fma(_4691, _539, _4703);
                float _4711 = _4705 * _4705;
                float _4713 = fma(_4707, _4707, _4711);
                float _4715 = fma(_4709, _4709, _4713);
                float _4717 = rsqrt(_4715);
                float _4719 = _4717 * 9.9999999747524270787835121154785e-07;
                float _4721 = _4707 * _4719;
                float _4723 = _4705 * _4719;
                float _4725 = _4709 * _4719;
                _343 = as_type<int>(_4721);
                _345 = as_type<int>(_4723);
                _347 = as_type<int>(_4725);
                _4679 = true;
            }
            else
            {
                bool _4727 = _4655 >= 9.9999999747524270787835121154785e-07;
                bool _4729 = isnan(_4655);
                bool _4731 = _4727 || _4729;
                bool _4733 = isnan(9.9999999747524270787835121154785e-07);
                bool _4735 = _4731 || _4733;
                if (!_4735)
                {
                    float _4737 = _3845 * _3845;
                    float _4739 = fma(_3847, _3847, _4737);
                    float _4741 = fma(_3849, _3849, _4739);
                    float _4743 = sqrt(_4741);
                    bool _4745 = _4743 >= 9.9999999747524270787835121154785e-07;
                    bool _4747 = isnan(_4743);
                    bool _4749 = _4745 || _4747;
                    bool _4751 = isnan(9.9999999747524270787835121154785e-07);
                    bool _4753 = _4749 || _4751;
                    float _4755 = _4743;
                    if (_4753)
                    {
                        float _4757 = rsqrt(_4741);
                        _4755 = _4757;
                    }
                    float _4759 = _4755;
                    if (!_4753)
                    {
                        _331 = 0;
                    }
                    int _4761 = _331;
                    int _4763 = _4761;
                    if (!_4753)
                    {
                        _333 = 897988541;
                    }
                    int _4765 = _333;
                    int _4767 = _4765;
                    if (!_4753)
                    {
                        _335 = 0;
                    }
                    int _4769 = _335;
                    float _4771 = _4759;
                    int _4773 = _4769;
                    if (_4753)
                    {
                        float _4775 = _4759 * 9.9999999747524270787835121154785e-07;
                        _4771 = _4775;
                    }
                    float _4777 = _4771;
                    if (_4753)
                    {
                        float _4779 = _3847 * _4777;
                        _4763 = as_type<int>(_4779);
                    }
                    int _4781 = _4763;
                    _343 = _4781;
                    if (_4753)
                    {
                        float _4783 = _3845 * _4777;
                        _4767 = as_type<int>(_4783);
                    }
                    int _4785 = _4767;
                    _345 = _4785;
                    if (_4753)
                    {
                        float _4787 = _3849 * _4777;
                        _4773 = as_type<int>(_4787);
                    }
                    int _4789 = _4773;
                    _347 = _4789;
                    _4679 = true;
                }
                else
                {
                    float _4791 = rsqrt(_4653);
                    float _4793 = _4791 * 9.9999999747524270787835121154785e-07;
                    float _4795 = _809 * _4793;
                    float _4797 = _793 * _4793;
                    float _4799 = _813 * _4793;
                    _343 = as_type<int>(_4795);
                    _345 = as_type<int>(_4797);
                    _347 = as_type<int>(_4799);
                    _4679 = true;
                }
            }
        }
    }
    else
    {
        float _4801 = _4655 * _4641;
        bool _4803 = _4801 >= 0.001000000047497451305389404296875;
        bool _4805 = isnan(_4801);
        bool _4807 = _4803 || _4805;
        bool _4809 = isnan(0.001000000047497451305389404296875);
        bool _4811 = _4807 || _4809;
        bool _4813 = _4801 > 0.0;
        bool _4815 = !_4811;
        bool _4817 = _4813 && _4815;
        bool _4819 = _4657 < 0.001000000047497451305389404296875;
        bool _4821 = _4819 && _4817;
        if (!_4821)
        {
            _337 = as_type<int>(_4613);
        }
        int _4823 = _337;
        int _4825 = _4823;
        if (_4821)
        {
            float _4827 = _809 * _4641;
            _4825 = as_type<int>(_4827);
        }
        int _4829 = _4825;
        _343 = _4829;
        if (!_4821)
        {
            _339 = as_type<int>(_4571);
        }
        int _4831 = _339;
        int _4833 = _4831;
        if (_4821)
        {
            float _4835 = _793 * _4641;
            _4833 = as_type<int>(_4835);
        }
        int _4837 = _4833;
        _345 = _4837;
        if (!_4821)
        {
            _341 = as_type<int>(_4591);
        }
        int _4839 = _341;
        _347 = _4839;
        if (_4821)
        {
            float _4841 = _813 * _4641;
            _347 = as_type<int>(_4841);
        }
    }
    _4679 = false;
    int _4843 = _343;
    int _4845 = _345;
    int _4847 = _347;
    uint _4849 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4849)] = uint(_4843);
    uint _4851 = uint(int(uint(_4593) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4851)] = uint(_4845);
    uint _4853 = uint(int(uint(_4595) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4853)] = uint(_4847);
}

