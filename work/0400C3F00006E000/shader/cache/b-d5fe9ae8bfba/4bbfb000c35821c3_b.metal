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
    texture2d_array<float> cp_t_tcb_16 [[id(13)]];
    sampler cp_t_tcb_16Smplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_14 [[id(15)]];
    sampler cp_t_tcb_14Smplr [[id(16)]];
    sampler cp_t_tcb_14Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1531 = false;
    float _71 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _73 = as_type<float>(gl_LocalInvocationID.x);
    float _75 = as_type<float>(gl_WorkGroupID.x);
    int _78 = as_type<int>(_75) << 5;
    int _80 = _78 + as_type<int>(_73);
    float _82 = trunc(_71);
    int _84 = int(_82);
    bool _88 = _80 >= _84;
    int _90 = 0;
    if (_88)
    {
        _90 = 0;
    }
    int _92 = _90;
    int _94 = _92;
    int _96 = _92;
    if (!_88)
    {
        int _98 = _80 << 4;
        int _100 = _98 + 12;
        uint _103 = uint(int(uint(_100) >> uint(2)));
        float _105 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_103)]);
        float _107 = trunc(_105);
        int _109 = int(_107);
        bool _111 = _109 >= 1;
        int _113 = _111 ? (-1) : 0;
        if (!_111)
        {
            _94 = 0;
        }
        int _115 = _94;
        bool _117 = !_111;
        _96 = _115;
        if (!_117)
        {
            float _119 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _121 = uint(int(uint(_100) >> uint(2)));
            float _123 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_121)]);
            float _125 = float(_109);
            float _127 = -_123;
            float _129 = _119 + _127;
            bool _131 = _129 > _125;
            int _133 = as_type<int>(_119);
            if (!_131)
            {
                bool _135 = _119 >= _123;
                bool _137 = isnan(_119);
                bool _139 = _135 || _137;
                bool _141 = isnan(_123);
                bool _143 = _139 || _141;
                _113 = _143 ? (-1) : 0;
            }
            int _145 = _113;
            if (_131)
            {
                _133 = 0;
            }
            int _147 = _133;
            _96 = _147;
            if (!_131)
            {
                int _149 = ~_145;
                int _151 = (_149 != 0) ? 0 : 1;
                _96 = _151;
            }
        }
    }
    int _153 = _96;
    int _155 = _153 & 1;
    bool _157 = _155 != 0;
    if (!_157)
    {
        return;
    }
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[50]);
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _163 = _80 << 4;
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    int _167 = _163 + 12;
    uint _169 = uint(int(uint(_163) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_169)]);
    int _173 = _163 + 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_175)]);
    int _179 = _163 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_181)]);
    uint _185 = uint(int(uint(_163) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_185)]);
    int _189 = _163 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_191)]);
    int _195 = _163 + 8;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_197)]);
    uint _201 = uint(int(uint(_167) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_201)]);
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _217 = trunc(_159);
    int _219 = int(_217);
    int _221 = as_type<int>(_161) & 512;
    bool _223 = _221 != 0;
    uint _225 = uint(int(uint(_167) >> uint(2)));
    float _227 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_225)]);
    bool _229 = _219 != 0;
    float _231 = 0.0;
    float _233 = 0.0;
    float _235 = 0.0;
    float _237 = 0.0;
    float _239 = _203;
    if (_223)
    {
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _243 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _245 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _231 = _241;
        _233 = _243;
        _235 = _245;
        _237 = _247;
    }
    float _249 = _231;
    float _251 = _233;
    float _253 = _235;
    float _255 = _237;
    bool _257 = _219 != 1;
    bool _259 = _219 != 2;
    float _261 = 0.0;
    float _263 = 0.0;
    float _265 = 0.0;
    float _267 = 0.0;
    if (_223)
    {
        float _269 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _271 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _261 = _269;
        _263 = _271;
        _265 = _273;
        _267 = _275;
    }
    float _277 = _261;
    float _279 = _263;
    float _281 = _265;
    float _283 = _267;
    uint _285 = uint(int(uint(_163) >> uint(2)));
    float _287 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_285)]);
    int _289 = _163 + 4;
    uint _291 = uint(int(uint(_289) >> uint(2)));
    float _293 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_291)]);
    int _295 = _163 + 8;
    uint _297 = uint(int(uint(_295) >> uint(2)));
    float _299 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_297)]);
    int _301 = _163 + 12;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    float _305 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_303)]);
    float _307 = 0.0;
    float _309 = 0.0;
    float _311 = 0.0;
    float _313 = 0.0;
    if (_223)
    {
        float _315 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _317 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _319 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _321 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _307 = _315;
        _309 = _317;
        _311 = _319;
        _313 = _321;
    }
    float _323 = _307;
    float _325 = _309;
    float _327 = _311;
    float _329 = _313;
    float _331 = _183 * _165;
    float _333 = fma(_203, _331, _199);
    float _335 = _177 * _165;
    float _337 = _171 * _165;
    float _339 = fma(_203, _335, _193);
    float _341 = fma(_203, _337, _187);
    float _343 = _305;
    float _345 = _337;
    float _347 = _339;
    float _349 = _333;
    int _351 = as_type<int>(_293);
    int _353 = as_type<int>(_287);
    int _355 = as_type<int>(_293);
    int _357 = as_type<int>(_299);
    int _359 = as_type<int>(_287);
    int _361 = as_type<int>(_293);
    int _363 = as_type<int>(_299);
    if (_229)
    {
        _343 = _333;
    }
    float _365 = _343;
    float _367 = _365;
    float _369 = _211;
    float _371 = _251;
    float _373 = _279;
    float _375 = _325;
    float _377 = _253;
    float _379 = _281;
    float _381 = _327;
    if (!_229)
    {
        float _383 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _385 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _387 = _203 * _383;
        float _389 = _165 * _387;
        bool _391 = _385 != 0.0;
        bool _393 = isnan(_385);
        bool _395 = _391 || _393;
        bool _397 = isnan(0.0);
        bool _399 = _395 || _397;
        float _401 = _389 * 0.15915493667125701904296875;
        float _403 = _401 * 6.283185482025146484375;
        float _405 = sin(_403);
        float _407 = _401 * 6.283185482025146484375;
        float _409 = cos(_407);
        float _411 = _333 * _405;
        float _413 = _339 * _405;
        float _415 = fma(_339, _409, _411);
        float _417 = -_413;
        float _419 = fma(_333, _409, _417);
        bool _421 = !_399;
        float _423 = _385;
        float _425 = _415;
        _345 = _409;
        _367 = _419;
        _369 = _411;
        _347 = _415;
        if (!_421)
        {
            float _427 = _419 * _419;
            float _429 = fma(_415, _415, _427);
            bool _431 = _429 > 0.0;
            float _433 = _413;
            _345 = _429;
            if (_431)
            {
                float _435 = rsqrt(_429);
                _433 = _435;
            }
            float _437 = _433;
            float _439 = _437;
            if (_431)
            {
                float _441 = _385 * _437;
                _423 = _441;
            }
            float _443 = _423;
            if (_431)
            {
                float _445 = _203 * _443;
                _439 = _445;
            }
            float _447 = _439;
            float _449 = _447;
            if (_431)
            {
                float _451 = _165 * _447;
                _449 = _451;
            }
            float _453 = _449;
            if (_431)
            {
                float _455 = fma(_415, _453, _415);
                _425 = _455;
            }
            float _457 = _425;
            _347 = _457;
            if (_431)
            {
                float _459 = fma(_419, _453, _419);
                _367 = _459;
            }
        }
    }
    float _461 = _345;
    float _463 = _367;
    float _465 = _369;
    float _467 = _347;
    float _469 = _461;
    float _471 = _463;
    float _473 = _465;
    float _475 = _463;
    float _477 = _467;
    if (_257)
    {
        _469 = _341;
    }
    float _479 = _469;
    float _481 = _479;
    if (!_257)
    {
        float _483 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _485 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _487 = _203 * _483;
        float _489 = _165 * _487;
        bool _491 = _485 != 0.0;
        bool _493 = isnan(_485);
        bool _495 = _491 || _493;
        bool _497 = isnan(0.0);
        bool _499 = _495 || _497;
        float _501 = _489 * 0.15915493667125701904296875;
        float _503 = _501 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 * 6.283185482025146484375;
        float _509 = cos(_507);
        float _511 = _505 * _463;
        float _513 = _505 * _341;
        float _515 = -_511;
        float _517 = fma(_509, _341, _515);
        float _519 = fma(_509, _463, _513);
        float _521 = _513;
        _473 = _501;
        _481 = _517;
        if (!_499)
        {
            _471 = _519;
        }
        float _523 = _471;
        bool _525 = !_499;
        _475 = _523;
        if (!_525)
        {
            float _527 = _517 * _517;
            float _529 = fma(_519, _519, _527);
            bool _531 = _529 > 0.0;
            float _533 = _527;
            _473 = _529;
            if (_531)
            {
                float _535 = rsqrt(_529);
                _533 = _535;
            }
            float _537 = _533;
            float _539 = _537;
            if (_531)
            {
                float _541 = _485 * _537;
                _539 = _541;
            }
            float _543 = _539;
            float _545 = _543;
            if (_531)
            {
                float _547 = _203 * _543;
                _521 = _547;
            }
            float _549 = _521;
            float _551 = _549;
            if (!_531)
            {
                _545 = _519;
            }
            float _553 = _545;
            float _555 = _553;
            if (_531)
            {
                float _557 = _165 * _549;
                _551 = _557;
            }
            float _559 = _551;
            if (_531)
            {
                float _561 = fma(_519, _559, _519);
                _555 = _561;
            }
            float _563 = _555;
            _475 = _563;
            if (_531)
            {
                float _565 = fma(_517, _559, _517);
                _481 = _565;
            }
        }
    }
    float _567 = _473;
    float _569 = _481;
    float _571 = _475;
    float _573 = _569;
    float _575 = _569;
    float _577 = _567;
    if (!_259)
    {
        float _579 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _581 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _583 = _203 * _579;
        float _585 = _165 * _583;
        bool _587 = _581 != 0.0;
        bool _589 = isnan(_581);
        bool _591 = _587 || _589;
        bool _593 = isnan(0.0);
        bool _595 = _591 || _593;
        float _597 = _585 * 0.15915493667125701904296875;
        float _599 = _597 * 6.283185482025146484375;
        float _601 = sin(_599);
        float _603 = _597 * 6.283185482025146484375;
        float _605 = cos(_603);
        float _607 = _601 * _467;
        float _609 = _601 * _569;
        float _611 = fma(_605, _569, _607);
        float _613 = -_609;
        float _615 = fma(_605, _467, _613);
        _477 = _615;
        _577 = _609;
        _349 = _597;
        if (!_595)
        {
            _573 = _611;
        }
        float _617 = _573;
        bool _619 = !_595;
        _575 = _617;
        if (!_619)
        {
            float _621 = _615 * _615;
            float _623 = fma(_611, _611, _621);
            bool _625 = _623 > 0.0;
            float _627 = _621;
            _577 = _623;
            if (_625)
            {
                float _629 = rsqrt(_623);
                _627 = _629;
            }
            float _631 = _627;
            float _633 = _631;
            if (_625)
            {
                float _635 = _581 * _631;
                _633 = _635;
            }
            float _637 = _633;
            float _639 = _637;
            if (_625)
            {
                float _641 = _203 * _637;
                _239 = _641;
            }
            float _643 = _239;
            float _645 = _643;
            if (!_625)
            {
                _639 = _611;
            }
            float _647 = _639;
            float _649 = _647;
            if (_625)
            {
                float _651 = _165 * _643;
                _645 = _651;
            }
            float _653 = _645;
            if (_625)
            {
                float _655 = fma(_611, _653, _611);
                _649 = _655;
            }
            float _657 = _649;
            _575 = _657;
            if (_625)
            {
                float _659 = fma(_615, _653, _615);
                _477 = _659;
            }
        }
    }
    float _661 = _477;
    float _663 = _575;
    float _665 = _577;
    float _667 = _349;
    int _669 = as_type<int>(_161) & 1024;
    bool _671 = _669 != 0;
    float _673 = _665;
    float _675 = _667;
    if (_223)
    {
        float _677 = _251 * _661;
        _371 = _677;
    }
    float _679 = _371;
    float _681 = _679;
    if (_223)
    {
        float _683 = _279 * _661;
        _373 = _683;
    }
    float _685 = _373;
    float _687 = _685;
    if (_223)
    {
        float _689 = _325 * _661;
        _375 = _689;
    }
    float _691 = _375;
    float _693 = _691;
    if (_223)
    {
        float _695 = fma(_249, _663, _679);
        _681 = _695;
    }
    float _697 = _681;
    if (_223)
    {
        float _699 = fma(_277, _663, _685);
        _687 = _699;
    }
    float _701 = _687;
    if (_223)
    {
        float _703 = fma(_323, _663, _691);
        _693 = _703;
    }
    float _705 = _693;
    uint _707 = uint(int(uint(_167) >> uint(2)));
    float _709 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_707)]);
    if (_223)
    {
        float _711 = fma(_253, _571, _697);
        _377 = _711;
    }
    float _713 = _377;
    if (_223)
    {
        float _715 = fma(_281, _571, _701);
        _379 = _715;
    }
    float _717 = _379;
    if (_223)
    {
        float _719 = fma(_327, _571, _705);
        _381 = _719;
    }
    float _721 = _381;
    if (!_223)
    {
        _673 = 0.0;
    }
    float _723 = _673;
    float _725 = _723;
    if (_223)
    {
        float _727 = _255 + _713;
        _725 = _727;
    }
    float _729 = _725;
    float _731 = 0.0;
    float _733 = _729;
    if (!_223)
    {
        _731 = 0.0;
    }
    float _735 = _731;
    float _737 = _735;
    if (_223)
    {
        float _739 = _283 + _717;
        _737 = _739;
    }
    float _741 = _737;
    float _743 = _741;
    if (!_223)
    {
        _675 = 0.0;
    }
    float _745 = _675;
    float _747 = _745;
    if (_223)
    {
        float _749 = _329 + _721;
        _747 = _749;
    }
    float _751 = _747;
    int _753 = as_type<int>(_161) & 2048;
    bool _755 = _753 != 0;
    bool _757 = !_671;
    float _759 = _751;
    if (!_757)
    {
        float _761 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _763 = uint(int(uint(_163) >> uint(2)));
        float _765 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_763)]);
        int _767 = _163 + 4;
        uint _769 = uint(int(uint(_767) >> uint(2)));
        float _771 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_769)]);
        int _773 = _163 + 8;
        uint _775 = uint(int(uint(_773) >> uint(2)));
        float _777 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_775)]);
        uint _779 = uint(int(uint(_163) >> uint(2)));
        float _781 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_779)]);
        int _783 = _163 + 4;
        uint _785 = uint(int(uint(_783) >> uint(2)));
        float _787 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_785)]);
        int _789 = _163 + 8;
        uint _791 = uint(int(uint(_789) >> uint(2)));
        float _793 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_791)]);
        uint _795 = uint(int(uint(_163) >> uint(2)));
        float _797 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_795)]);
        int _799 = _163 + 4;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        float _803 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_801)]);
        int _805 = _163 + 8;
        uint _807 = uint(int(uint(_805) >> uint(2)));
        float _809 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_807)]);
        float _811 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _813 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _815 = _771 * _661;
        float _817 = _787 * _661;
        float _819 = _803 * _661;
        float _821 = fma(_765, _663, _815);
        float _823 = fma(_781, _663, _817);
        float _825 = fma(_797, _663, _819);
        float _827 = fma(_777, _571, _821);
        float _829 = fma(_793, _571, _823);
        float _831 = fma(_809, _571, _825);
        float _833 = _761 + _827;
        float _835 = _811 + _829;
        float _837 = _813 + _831;
        _743 = _835;
        _733 = _833;
        _759 = _837;
    }
    float _839 = _743;
    float _841 = _733;
    float _843 = _759;
    bool _845 = !_755;
    float _847 = _839;
    float _849 = _841;
    float _851 = _843;
    if (!_845)
    {
        uint _853 = uint(int(uint(_163) >> uint(2)));
        float _855 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_853)]);
        int _857 = _163 + 4;
        uint _859 = uint(int(uint(_857) >> uint(2)));
        float _861 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_859)]);
        int _863 = _163 + 8;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        float _867 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_865)]);
        int _869 = _163 + 12;
        uint _871 = uint(int(uint(_869) >> uint(2)));
        float _873 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_871)]);
        uint _875 = uint(int(uint(_163) >> uint(2)));
        float _877 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_875)]);
        int _879 = _163 + 4;
        uint _881 = uint(int(uint(_879) >> uint(2)));
        float _883 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_881)]);
        int _885 = _163 + 8;
        uint _887 = uint(int(uint(_885) >> uint(2)));
        float _889 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_887)]);
        int _891 = _163 + 12;
        uint _893 = uint(int(uint(_891) >> uint(2)));
        float _895 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_893)]);
        uint _897 = uint(int(uint(_163) >> uint(2)));
        float _899 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_897)]);
        int _901 = _163 + 4;
        uint _903 = uint(int(uint(_901) >> uint(2)));
        float _905 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_903)]);
        int _907 = _163 + 8;
        uint _909 = uint(int(uint(_907) >> uint(2)));
        float _911 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_909)]);
        int _913 = _163 + 12;
        uint _915 = uint(int(uint(_913) >> uint(2)));
        float _917 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_915)]);
        float _919 = _861 * _661;
        float _921 = _883 * _661;
        float _923 = _905 * _661;
        float _925 = fma(_855, _663, _919);
        float _927 = fma(_877, _663, _921);
        float _929 = fma(_899, _663, _923);
        float _931 = fma(_867, _571, _925);
        float _933 = fma(_889, _571, _927);
        float _935 = fma(_911, _571, _929);
        float _937 = _931 + _873;
        float _939 = _933 + _895;
        float _941 = _935 + _917;
        _847 = _939;
        _849 = _937;
        _851 = _941;
    }
    float _943 = _847;
    float _945 = _849;
    float _947 = _851;
    float _949 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _951 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
    float _953 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
    float _955 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
    float _957 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
    float _959 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[61]);
    float _961 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[60]);
    float _963 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[504]);
    float _965 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[505]);
    float _967 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[506]);
    float _969 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[507]);
    float _971 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[501]);
    float _973 = _953 * _943;
    float _975 = fma(_951, _945, _973);
    float _977 = fma(_955, _947, _975);
    float _979 = _957 + _977;
    float _981 = -_979;
    bool _983 = _959 >= _981;
    bool _985 = isnan(_959);
    bool _987 = _983 || _985;
    bool _989 = isnan(_981);
    bool _991 = _987 || _989;
    float _993 = -_979;
    bool _995 = _961 >= _993;
    bool _997 = isnan(_961);
    bool _999 = _995 || _997;
    bool _1001 = isnan(_993);
    bool _1003 = _999 || _1001;
    int _1005 = _991 ? 0 : 1;
    int _1007 = 2;
    if (_991)
    {
        _1007 = 1;
    }
    int _1009 = _1007;
    int _1011 = _1009;
    if (_1003)
    {
        _1011 = _1005;
    }
    int _1013 = _1011;
    int _1015 = _1013 << 6;
    int _1017 = _1015 + 96;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    float _1021 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1019)]);
    int _1023 = _1017 + 4;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    float _1027 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1025)]);
    int _1029 = _1017 + 8;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    float _1033 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1031)]);
    int _1035 = _1017 + 12;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    float _1039 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1037)]);
    int _1041 = _1015 + 48;
    int _1043 = _1015 + 64;
    uint _1045 = uint(int(uint(_1041) >> uint(2)));
    float _1047 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1045)]);
    int _1049 = _1041 + 4;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    float _1053 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1051)]);
    int _1055 = _1041 + 8;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    float _1059 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1057)]);
    int _1061 = _1041 + 12;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    float _1065 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1063)]);
    uint _1067 = uint(int(uint(_1043) >> uint(2)));
    float _1069 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1067)]);
    int _1071 = _1043 + 4;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    float _1075 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1073)]);
    int _1077 = _1043 + 8;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    float _1081 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1079)]);
    int _1083 = _1043 + 12;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    float _1087 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1085)]);
    int _1089 = _1015 + 80;
    float _1091 = _949 + 1.0;
    float _1093 = _1091 + _943;
    uint _1095 = uint(int(uint(_1089) >> uint(2)));
    float _1097 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1095)]);
    int _1099 = _1089 + 4;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    float _1103 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1101)]);
    int _1105 = _1089 + 8;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    float _1109 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1107)]);
    int _1111 = _1089 + 12;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    float _1115 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1113)]);
    float _1117 = _1093 * _965;
    float _1119 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[502]);
    float _1121 = fma(_963, _945, _1117);
    float _1123 = fma(_967, _947, _1121);
    float _1125 = _969 + _1123;
    float _1127 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[508]);
    float _1129 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[509]);
    float _1131 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[510]);
    float _1133 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[511]);
    float _1135 = trunc(_1125);
    int _1137 = int(_1135);
    int _1139 = ~as_type<int>(_971);
    int _1141 = _1137 + _1139;
    int _1143 = _1141 + 1;
    bool _1145 = _1143 >= 0;
    int _1147 = _1137;
    float _1149 = as_type<float>(_1013);
    if (_1145)
    {
        float _1151 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _1147 = as_type<int>(_1151);
    }
    int _1153 = _1147;
    float _1155 = _1093 * _1027;
    float _1157 = fma(_1021, _945, _1155);
    float _1159 = fma(_1033, _947, _1157);
    float _1161 = _1039 + _1159;
    float _1163 = _1093 * _1053;
    float _1165 = 1.0 / _1161;
    float _1167 = fma(_1047, _945, _1163);
    float _1169 = _1093 * _1075;
    float _1171 = fma(_1059, _947, _1167);
    float _1173 = fma(_1069, _945, _1169);
    float _1175 = _1065 + _1171;
    float _1177 = fma(_1081, _947, _1173);
    float _1179 = _1175 * _1165;
    float _1181 = _1087 + _1177;
    bool _1183 = _1179 >= 0.0;
    float _1185 = _1181 * _1165;
    bool _1187 = _1179 <= 1.0;
    bool _1189 = _1187 && _1183;
    bool _1191 = _1185 >= 0.0;
    bool _1193 = _1191 && _1189;
    bool _1195 = _1185 <= 1.0;
    bool _1197 = _1195 && _1193;
    float _1199 = _1093 * _1103;
    float _1201 = fma(_1097, _945, _1199);
    if (_1197)
    {
        float _1203 = float(_1013);
        _1149 = _1203;
    }
    float _1205 = _1149;
    float _1207 = fma(_1109, _947, _1201);
    float _1209 = _1205;
    if (_1197)
    {
        float _1211 = rint(_1205);
        float _1213 = precise::max(_1211, 0.0);
        uint _1215 = uint(_1213);
        uint _1217 = clamp(_1215, 0u, 65535u);
        _1209 = as_type<float>(_1217);
    }
    float _1219 = _1209;
    float _1221 = _1115 + _1207;
    float _1223 = _1221 * _1165;
    float _1225 = _1185;
    if (_1197)
    {
        float3 _3486 = float3(_1179, _1185, float(as_type<int>(_1219)));
        float3 _3490 = select(_3486, float3(0.0), isnan(_3486));
        float _1227 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3490.xy, uint(rint(_3490.z)), _1223, level(0.0));
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1093 * _1129;
    bool _1233 = _1153 <= _1143;
    bool _1235 = !_1145;
    bool _1237 = _1233 || _1235;
    float _1239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _1241 = fma(_1127, _945, _1231);
    float _1243 = fma(_1131, _947, _1241);
    float _1245 = _1133 + _1243;
    float _1247 = trunc(_1245);
    int _1249 = int(_1247);
    int _1251 = ~as_type<int>(_1119);
    int _1253 = _1249 + _1251;
    int _1255 = _1253 + 1;
    bool _1257 = _1255 < 0;
    bool _1259 = _1257 || _1237;
    int _1261 = as_type<int>(_1241);
    float _1263 = as_type<float>(_1249);
    if (!_1259)
    {
        float _1265 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _1261 = as_type<int>(_1265);
    }
    int _1267 = _1261;
    bool _1269 = _1267 <= _1255;
    bool _1271 = _1269 || _1259;
    if (_1271)
    {
        _1263 = 1.0;
    }
    float _1273 = _1263;
    float _1275 = _1273;
    if (!_1271)
    {
        float _1277 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        int _1279 = _1255 * as_type<int>(_1277);
        int _1281 = _1279 + _1143;
        int _1283 = _1281 << 2;
        uint _1285 = uint(int(uint(_1281) >> uint(2)));
        int _1287 = 12 & _1283;
        int _1289 = int(_1285) << 4;
        int _1291 = _1289 + _1287;
        int _1293 = _1291 + 400;
        uint _1295 = uint(int(uint(_1293) >> uint(2)));
        float _1297 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1295)]);
        float _1299 = floor(_1245);
        float _1301 = floor(_1125);
        float _1303 = -_1299;
        float _1305 = _1245 + _1303;
        float _1307 = -_1301;
        float _1309 = _1125 + _1307;
        float _1311 = rint(_1297);
        float _1313 = precise::max(_1311, 0.0);
        uint _1315 = uint(_1313);
        uint _1317 = clamp(_1315, 0u, 65535u);
        float3 _3628 = float3(_1309, _1305, float(int(_1317)));
        float3 _3630 = select(_3628, float3(0.0), isnan(_3628));
        float _1319 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3630.xy, uint(rint(_3630.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3630.xy, uint(rint(_3630.z)), level(0.0)).x;
        int _1321 = _1281 << 4;
        int _1323 = _1321 + 2048;
        uint _1325 = uint(int(uint(_1323) >> uint(2)));
        float _1327 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1325)]);
        int _1329 = _1323 + 4;
        uint _1331 = uint(int(uint(_1329) >> uint(2)));
        float _1333 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1331)]);
        int _1335 = _1323 + 8;
        uint _1337 = uint(int(uint(_1335) >> uint(2)));
        float _1339 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1337)]);
        int _1341 = _1323 + 12;
        uint _1343 = uint(int(uint(_1341) >> uint(2)));
        float _1345 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1343)]);
        float _1347 = _1093 * _1333;
        float _1349 = fma(_1327, _945, _1347);
        float _1351 = fma(_1339, _947, _1349);
        float _1353 = _1345 + _1351;
        float _1355 = precise::clamp(_1353, 0.0, 1.0);
        float _1357 = -_1355;
        float _1359 = _1357 + _1319;
        float _1361 = fma(_1359, 500.0, 1.5);
        float _1363 = exp2(_1361);
        float _1365 = 0.0 + _1363;
        float _1367 = precise::clamp(_1365, 0.0, 1.0);
        _1275 = _1367;
    }
    float _1369 = _1275;
    uint _1371 = uint(int(uint(_163) >> uint(2)));
    float _1373 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1371)]);
    float _1375 = abs(_213);
    float _1377 = log2(_1375);
    float _1379 = _205 * _215;
    float _1381 = _207 * _215;
    float _1383 = _209 * _215;
    float _1385 = _165 * _1379;
    float _1387 = -_227;
    float _1389 = _1239 + _1387;
    float _1391 = _165 * _1381;
    float _1393 = -_199;
    float _1395 = _1393 + _571;
    bool _1397 = _1389 > 0.001000000047497451305389404296875;
    bool _1399 = isnan(_1389);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.001000000047497451305389404296875);
    bool _1405 = _1401 || _1403;
    float _1407 = -_193;
    float _1409 = _1407 + _661;
    int _1411 = _163 + 4;
    float _1413 = _165 * _1377;
    float _1415 = _165 * _1383;
    float _1417 = exp2(_1413);
    float _1419 = fma(_171, _1417, _1385);
    float _1421 = _1385;
    if (!_1197)
    {
        _1421 = 1.0;
    }
    float _1423 = _1421;
    float _1425 = fma(_177, _1417, _1391);
    float _1427 = _1423;
    if (_1197)
    {
        bool _1429 = _1229 >= _1223;
        bool _1431 = isnan(_1229);
        bool _1433 = _1429 || _1431;
        bool _1435 = isnan(_1223);
        bool _1437 = _1433 || _1435;
        float _1439 = float(_1437);
        _1427 = _1439;
    }
    float _1441 = _1427;
    float _1443 = fma(_183, _1417, _1415);
    float _1445 = -_187;
    float _1447 = _1445 + _663;
    int _1449 = _163 + 8;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1369, 1.0);
    float _1455 = -_1373;
    float _1457 = _1453 + _1455;
    float _1459 = _1453;
    if (_1405)
    {
        float _1461 = fma(_1457, 0.0500000007450580596923828125, _1373);
        _1459 = _1461;
    }
    float _1463 = _1459;
    float _1465 = precise::max(0.0, _1463);
    float _1467 = precise::min(_1465, 0.999000012874603271484375);
    uint _1469 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1469)] = as_type<uint>(_1467);
    uint _1471 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1471)] = as_type<uint>(_709);
    uint _1473 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1473)] = as_type<uint>(_663);
    uint _1475 = uint(int(uint(_1411) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1475)] = as_type<uint>(_661);
    uint _1477 = uint(int(uint(_1449) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1477)] = as_type<uint>(_571);
    uint _1479 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1479)] = as_type<uint>(_1419);
    uint _1481 = uint(int(uint(_1411) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1481)] = as_type<uint>(_1425);
    uint _1483 = uint(int(uint(_1449) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1483)] = as_type<uint>(_1443);
    uint _1485 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1485)] = as_type<uint>(_1447);
    uint _1487 = uint(int(uint(_1411) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1487)] = as_type<uint>(_1409);
    uint _1489 = uint(int(uint(_1449) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1489)] = as_type<uint>(_1395);
    float _1491 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1493 = _1409 * _1409;
    float _1495 = _1425 * _1425;
    float _1497 = fma(_1447, _1447, _1493);
    float _1499 = fma(_1419, _1419, _1495);
    float _1501 = fma(_1395, _1395, _1497);
    float _1503 = fma(_1443, _1443, _1499);
    float _1505 = sqrt(_1503);
    float _1507 = sqrt(_1501);
    bool _1509 = _1507 >= 9.9999999747524270787835121154785e-07;
    bool _1511 = isnan(_1507);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(9.9999999747524270787835121154785e-07);
    bool _1517 = _1513 || _1515;
    float _1519 = _1503;
    if (!_1517)
    {
        bool _1521 = _1239 != _227;
        bool _1523 = isnan(_1239);
        bool _1525 = _1521 || _1523;
        bool _1527 = isnan(_227);
        bool _1529 = _1525 || _1527;
        _1531 = _1529;
        if (!_1531)
        {
            float _1533 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1535 = _1533 > 0.0;
            bool _1537 = !_1535;
            if (!_1537)
            {
                float _1539 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1541 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1543 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1545 = _1541 * _1541;
                float _1547 = fma(_1539, _1539, _1545);
                float _1549 = fma(_1543, _1543, _1547);
                float _1551 = rsqrt(_1549);
                float _1553 = _1551 * 9.9999999747524270787835121154785e-07;
                float _1555 = _1539 * _1553;
                float _1557 = _1541 * _1553;
                float _1559 = _1543 * _1553;
                _359 = as_type<int>(_1555);
                _361 = as_type<int>(_1557);
                _363 = as_type<int>(_1559);
                _1531 = true;
            }
            else
            {
                bool _1561 = _1505 >= 9.9999999747524270787835121154785e-07;
                bool _1563 = isnan(_1505);
                bool _1565 = _1561 || _1563;
                bool _1567 = isnan(9.9999999747524270787835121154785e-07);
                bool _1569 = _1565 || _1567;
                if (!_1569)
                {
                    float _1571 = _661 * _661;
                    float _1573 = fma(_663, _663, _1571);
                    float _1575 = fma(_571, _571, _1573);
                    float _1577 = sqrt(_1575);
                    bool _1579 = _1577 >= 9.9999999747524270787835121154785e-07;
                    bool _1581 = isnan(_1577);
                    bool _1583 = _1579 || _1581;
                    bool _1585 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1587 = _1583 || _1585;
                    int _1589 = as_type<int>(_299);
                    int _1591 = as_type<int>(_1577);
                    if (_1587)
                    {
                        float _1593 = rsqrt(_1575);
                        _1589 = as_type<int>(_1593);
                    }
                    int _1595 = _1589;
                    if (!_1587)
                    {
                        _1591 = 0;
                    }
                    int _1597 = _1591;
                    int _1599 = _1597;
                    if (!_1587)
                    {
                        _351 = 897988541;
                    }
                    int _1601 = _351;
                    int _1603 = _1595;
                    int _1605 = _1601;
                    if (_1587)
                    {
                        float _1607 = as_type<float>(_1595) * 9.9999999747524270787835121154785e-07;
                        _1519 = _1607;
                    }
                    float _1609 = _1519;
                    if (!_1587)
                    {
                        _1603 = 0;
                    }
                    int _1611 = _1603;
                    int _1613 = _1611;
                    if (_1587)
                    {
                        float _1615 = _663 * _1609;
                        _1599 = as_type<int>(_1615);
                    }
                    int _1617 = _1599;
                    _359 = _1617;
                    if (_1587)
                    {
                        float _1619 = _661 * _1609;
                        _1605 = as_type<int>(_1619);
                    }
                    int _1621 = _1605;
                    _361 = _1621;
                    if (_1587)
                    {
                        float _1623 = _571 * _1609;
                        _1613 = as_type<int>(_1623);
                    }
                    int _1625 = _1613;
                    _363 = _1625;
                    _1531 = true;
                }
                else
                {
                    float _1627 = rsqrt(_1503);
                    float _1629 = _1627 * 9.9999999747524270787835121154785e-07;
                    float _1631 = _1419 * _1629;
                    float _1633 = _1425 * _1629;
                    float _1635 = _1443 * _1629;
                    _359 = as_type<int>(_1631);
                    _361 = as_type<int>(_1633);
                    _363 = as_type<int>(_1635);
                    _1531 = true;
                }
            }
        }
    }
    else
    {
        float _1637 = _1505 * _1491;
        bool _1639 = _1637 >= 0.001000000047497451305389404296875;
        bool _1641 = isnan(_1637);
        bool _1643 = _1639 || _1641;
        bool _1645 = isnan(0.001000000047497451305389404296875);
        bool _1647 = _1643 || _1645;
        bool _1649 = _1637 > 0.0;
        bool _1651 = !_1647;
        bool _1653 = _1649 && _1651;
        bool _1655 = _1507 < 0.001000000047497451305389404296875;
        bool _1657 = _1655 && _1653;
        if (!_1657)
        {
            _353 = as_type<int>(_1447);
        }
        int _1659 = _353;
        int _1661 = _1659;
        if (_1657)
        {
            float _1663 = _1419 * _1491;
            _1661 = as_type<int>(_1663);
        }
        int _1665 = _1661;
        _359 = _1665;
        if (!_1657)
        {
            _355 = as_type<int>(_1409);
        }
        int _1667 = _355;
        int _1669 = _1667;
        if (_1657)
        {
            float _1671 = _1425 * _1491;
            _1669 = as_type<int>(_1671);
        }
        int _1673 = _1669;
        _361 = _1673;
        if (!_1657)
        {
            _357 = as_type<int>(_1395);
        }
        int _1675 = _357;
        _363 = _1675;
        if (_1657)
        {
            float _1677 = _1443 * _1491;
            _363 = as_type<int>(_1677);
        }
    }
    _1531 = false;
    int _1679 = _359;
    int _1681 = _361;
    int _1683 = _363;
    uint _1685 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1685)] = uint(_1679);
    uint _1687 = uint(int(uint(_1411) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1687)] = uint(_1681);
    uint _1689 = uint(int(uint(_1449) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1689)] = uint(_1683);
}

