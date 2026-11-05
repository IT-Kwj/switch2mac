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
    bool _1671 = false;
    bool _539 = false;
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    float _77 = as_type<float>(gl_WorkGroupID.x);
    int _80 = as_type<int>(_77) << 5;
    int _82 = _80 + as_type<int>(_75);
    float _84 = trunc(_73);
    int _86 = int(_84);
    bool _90 = _82 >= _86;
    int _92 = 0;
    if (_90)
    {
        _92 = 0;
    }
    int _94 = _92;
    int _96 = _94;
    int _98 = _94;
    if (!_90)
    {
        int _100 = _82 << 4;
        int _102 = _100 + 12;
        uint _105 = uint(int(uint(_102) >> uint(2)));
        float _107 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_105)]);
        float _109 = trunc(_107);
        int _111 = int(_109);
        bool _113 = _111 >= 1;
        int _115 = _113 ? (-1) : 0;
        if (!_113)
        {
            _96 = 0;
        }
        int _117 = _96;
        bool _119 = !_113;
        _98 = _117;
        if (!_119)
        {
            float _121 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _123 = uint(int(uint(_102) >> uint(2)));
            float _125 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_123)]);
            float _127 = float(_111);
            float _129 = -_125;
            float _131 = _121 + _129;
            bool _133 = _131 > _127;
            int _135 = as_type<int>(_121);
            if (!_133)
            {
                bool _137 = _121 >= _125;
                bool _139 = isnan(_121);
                bool _141 = _137 || _139;
                bool _143 = isnan(_125);
                bool _145 = _141 || _143;
                _115 = _145 ? (-1) : 0;
            }
            int _147 = _115;
            if (_133)
            {
                _135 = 0;
            }
            int _149 = _135;
            _98 = _149;
            if (!_133)
            {
                int _151 = ~_147;
                int _153 = (_151 != 0) ? 0 : 1;
                _98 = _153;
            }
        }
    }
    int _155 = _98;
    int _157 = _155 & 1;
    bool _159 = _157 != 0;
    if (!_159)
    {
        return;
    }
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _165 = _82 << 4;
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _169 = _165 + 12;
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _175 = uint(int(uint(_169) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_175)]);
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _181 = uint(int(uint(_165) >> uint(2)));
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_181)]);
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    uint _197 = uint(int(uint(_165) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    int _201 = _165 + 4;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_203)]);
    int _207 = _165 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_209)]);
    uint _213 = uint(int(uint(_169) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_213)]);
    uint _217 = uint(int(uint(_165) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_217)]);
    int _221 = _165 + 4;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_223)]);
    int _227 = _165 + 8;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_229)]);
    int _233 = _165 + 12;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_235)]);
    float _239 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _241 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _245 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _247 = uint(int(uint(_165) >> uint(2)));
    float _249 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_247)]);
    int _251 = _165 + 4;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_253)]);
    int _257 = _165 + 8;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    float _261 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_259)]);
    int _263 = _165 + 12;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    float _267 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_265)]);
    uint _269 = uint(int(uint(_169) >> uint(2)));
    float _271 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_269)]);
    bool _273 = _161 > 0.0;
    float _275 = abs(_163);
    float _277 = log2(_275);
    bool _279 = _167 > 0.0;
    float _281 = 0.0;
    float _283 = _179;
    float _285 = _189;
    float _287 = _237;
    float _289 = _171;
    float _291 = _185;
    float _293 = _239;
    float _295 = _241;
    float _297 = _243;
    float _299 = _245;
    float _301 = _161;
    float _303 = _191;
    float _305 = _195;
    float _307 = _173;
    if (_273)
    {
        float _309 = 1.0 / _161;
        _281 = _309;
    }
    float _311 = _281;
    float _313 = _171 * _277;
    float _315 = -_177;
    float _317 = _173 + _315;
    float _319 = exp2(_313);
    float _321 = _179 * _167;
    float _323 = _311;
    float _325 = _321;
    float _327 = _313;
    if (_273)
    {
        float _329 = _317 * _311;
        _323 = _329;
    }
    float _331 = _323;
    if (_279)
    {
        float _333 = -_321;
        float _335 = fma(_183, _333, _179);
        _283 = _335;
    }
    float _337 = _283;
    int _339 = as_type<int>(_185) & 512;
    bool _341 = _339 != 0;
    float _343 = _337;
    bool _345 = _341;
    if (_273)
    {
        float _347 = precise::min(_331, 1.0);
        _325 = _347;
    }
    float _349 = _325;
    float _351 = _171 * _187;
    float _353 = _189 * _351;
    float _355 = _191 * _351;
    float _357 = _193 * _351;
    float _359 = _357;
    if (_273)
    {
        float _361 = _349 * _337;
        _343 = _361;
    }
    float _363 = _343;
    float _365 = fma(_199, _319, _353);
    float _367 = fma(_205, _319, _355);
    float _369 = fma(_211, _319, _357);
    float _371 = _171 * _363;
    float _373 = _215 * _171;
    float _375 = fma(_199, _373, _219);
    float _377 = fma(_205, _373, _225);
    float _379 = fma(_211, _373, _231);
    float _381 = _239 * _371;
    float _383 = _241 * _371;
    float _385 = _243 * _371;
    bool _387 = !_341;
    float _389 = _267;
    float _391 = _363;
    float _393 = _373;
    float _395 = _371;
    float _397 = _375;
    int _399 = as_type<int>(_255);
    int _401 = as_type<int>(_249);
    int _403 = as_type<int>(_255);
    int _405 = as_type<int>(_261);
    int _407 = as_type<int>(_249);
    int _409 = as_type<int>(_255);
    int _411 = as_type<int>(_261);
    float _533;
    float _535;
    float _537;
    if (!_387)
    {
        float _413 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _415 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _417 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _419 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _421 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _423 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _425 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _427 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _429 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _431 = _417 * _419;
        float _433 = _417 * _421;
        float _435 = _415 * _419;
        float _437 = -_431;
        float _439 = fma(_413, _423, _437);
        float _441 = -_433;
        float _443 = fma(_415, _423, _441);
        float _445 = -_435;
        float _447 = fma(_413, _421, _445);
        float _449 = _427 * _413;
        float _451 = _427 * _439;
        float _453 = _429 * _415;
        float _455 = _425 * _421;
        float _457 = -_449;
        float _459 = fma(_425, _415, _457);
        float _461 = -_451;
        float _463 = fma(_425, _443, _461);
        float _465 = _427 * _423;
        float _467 = _429 * _419;
        float _469 = -_455;
        float _471 = fma(_427, _419, _469);
        float _473 = fma(_429, _447, _463);
        float _475 = -_465;
        float _477 = fma(_429, _421, _475);
        float _479 = -_467;
        float _481 = fma(_425, _423, _479);
        float _483 = _425 * _417;
        float _485 = 1.0 / _473;
        float _487 = -_413;
        float _489 = fma(_487, _423, _431);
        float _491 = -_453;
        float _493 = fma(_427, _417, _491);
        float _495 = -_483;
        float _497 = fma(_429, _413, _495);
        float _499 = _477 * _485;
        float _501 = _481 * _485;
        float _503 = _471 * _485;
        float _505 = _489 * _485;
        float _507 = _383 * _499;
        float _509 = _381 * _485;
        float _511 = _383 * _501;
        float _513 = _383 * _503;
        float _515 = _493 * _485;
        float _517 = fma(_443, _509, _507);
        float _519 = _497 * _485;
        float _521 = _459 * _485;
        float _523 = fma(_381, _505, _511);
        float _525 = fma(_447, _509, _513);
        float _527 = fma(_385, _515, _517);
        float _529 = fma(_385, _519, _523);
        float _531 = fma(_385, _521, _525);
        _391 = _419;
        _393 = _421;
        _289 = _423;
        _291 = _447;
        _293 = _507;
        _295 = _509;
        _297 = _523;
        _299 = _473;
        _327 = _425;
        _395 = _427;
        _301 = _429;
        _359 = _501;
        _533 = _529;
        _535 = _527;
        _537 = _531;
        _303 = _519;
        _305 = _521;
        _539 = true;
    }
    else
    {
        int _541 = as_type<int>(_185) & 1024;
        bool _543 = _541 != 0;
        if (_543)
        {
            _345 = true;
        }
        bool _545 = _345;
        bool _547 = _545;
        if (!_543)
        {
            int _549 = as_type<int>(_185) & 2048;
            bool _551 = _549 != 0;
            _547 = _551;
        }
        bool _553 = _547;
        if (!_553)
        {
            _389 = _381;
        }
        float _555 = _389;
        _535 = _555;
        if (!_553)
        {
            _285 = _383;
        }
        float _557 = _285;
        _533 = _557;
        if (!_553)
        {
            _287 = _385;
        }
        float _559 = _287;
        bool _561 = !_553;
        _537 = _559;
        if (!_561)
        {
            uint _563 = uint(int(uint(_165) >> uint(2)));
            float _565 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_563)]);
            int _567 = _165 + 4;
            uint _569 = uint(int(uint(_567) >> uint(2)));
            float _571 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_569)]);
            int _573 = _165 + 8;
            uint _575 = uint(int(uint(_573) >> uint(2)));
            float _577 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_575)]);
            uint _579 = uint(int(uint(_165) >> uint(2)));
            float _581 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_579)]);
            int _583 = _165 + 4;
            uint _585 = uint(int(uint(_583) >> uint(2)));
            float _587 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_585)]);
            int _589 = _165 + 8;
            uint _591 = uint(int(uint(_589) >> uint(2)));
            float _593 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_591)]);
            uint _595 = uint(int(uint(_165) >> uint(2)));
            float _597 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_595)]);
            int _599 = _165 + 4;
            uint _601 = uint(int(uint(_599) >> uint(2)));
            float _603 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_601)]);
            int _605 = _165 + 8;
            uint _607 = uint(int(uint(_605) >> uint(2)));
            float _609 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_607)]);
            float _611 = _577 * _581;
            float _613 = _577 * _587;
            float _615 = _571 * _581;
            float _617 = -_611;
            float _619 = fma(_565, _593, _617);
            float _621 = -_613;
            float _623 = fma(_571, _593, _621);
            float _625 = -_615;
            float _627 = fma(_565, _587, _625);
            float _629 = _603 * _565;
            float _631 = _603 * _619;
            float _633 = _609 * _571;
            float _635 = _597 * _587;
            float _637 = -_629;
            float _639 = fma(_597, _571, _637);
            float _641 = -_631;
            float _643 = fma(_597, _623, _641);
            float _645 = _603 * _593;
            float _647 = _609 * _581;
            float _649 = -_635;
            float _651 = fma(_603, _581, _649);
            float _653 = fma(_609, _627, _643);
            float _655 = -_645;
            float _657 = fma(_609, _587, _655);
            float _659 = -_647;
            float _661 = fma(_597, _593, _659);
            float _663 = _597 * _577;
            float _665 = 1.0 / _653;
            float _667 = -_565;
            float _669 = fma(_667, _593, _611);
            float _671 = -_633;
            float _673 = fma(_603, _577, _671);
            float _675 = -_663;
            float _677 = fma(_609, _565, _675);
            float _679 = _657 * _665;
            float _681 = _661 * _665;
            float _683 = _651 * _665;
            float _685 = _669 * _665;
            float _687 = _383 * _679;
            float _689 = _381 * _665;
            float _691 = _383 * _681;
            float _693 = _383 * _683;
            float _695 = _673 * _665;
            float _697 = fma(_623, _689, _687);
            float _699 = _677 * _665;
            float _701 = _639 * _665;
            float _703 = fma(_381, _685, _691);
            float _705 = fma(_627, _689, _693);
            float _707 = fma(_385, _695, _697);
            float _709 = fma(_385, _699, _703);
            float _711 = fma(_385, _701, _705);
            _391 = _581;
            _393 = _587;
            _289 = _593;
            _291 = _627;
            _293 = _687;
            _295 = _689;
            _297 = _703;
            _299 = _653;
            _327 = _597;
            _395 = _603;
            _301 = _609;
            _359 = _681;
            _533 = _709;
            _535 = _707;
            _537 = _711;
            _303 = _699;
            _305 = _701;
        }
    }
    _539 = false;
    float _713 = _391;
    float _715 = _393;
    float _717 = _289;
    float _719 = _291;
    float _721 = _293;
    float _723 = _295;
    float _725 = _297;
    float _727 = _299;
    float _729 = _327;
    float _731 = _395;
    float _733 = _301;
    float _735 = _359;
    float _737 = _533;
    float _739 = _535;
    float _741 = _537;
    float _743 = _303;
    float _745 = _305;
    uint _747 = uint(int(uint(_169) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_747)] = as_type<uint>(_271);
    float _749 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _751 = as_type<int>(_749) & 512;
    bool _753 = _751 != 0;
    int _755 = as_type<int>(_749) & 1024;
    bool _757 = _755 != 0;
    float _759 = _713;
    float _761 = _715;
    float _763 = _717;
    float _765 = _719;
    float _767 = _743;
    float _769 = _745;
    if (_753)
    {
        float _771 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _773 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _775 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _777 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _759 = _771;
        _761 = _773;
        _763 = _775;
        _765 = _777;
    }
    float _779 = _759;
    float _781 = _761;
    float _783 = _763;
    float _785 = _765;
    float _787 = _721;
    float _789 = _723;
    float _791 = _725;
    float _793 = _727;
    if (_753)
    {
        float _795 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _797 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _799 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _801 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _787 = _795;
        _789 = _797;
        _791 = _799;
        _793 = _801;
    }
    float _803 = _787;
    float _805 = _789;
    float _807 = _791;
    float _809 = _793;
    float _811 = _729;
    float _813 = _731;
    float _815 = _733;
    float _817 = _735;
    if (_753)
    {
        float _819 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _821 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _823 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _825 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _811 = _819;
        _813 = _821;
        _815 = _823;
        _817 = _825;
    }
    float _827 = _811;
    float _829 = _813;
    float _831 = _815;
    float _833 = _817;
    float _835 = _377 + _737;
    float _837 = _375 + _739;
    float _839 = _379 + _741;
    if (!_753)
    {
        _767 = 0.0;
    }
    float _841 = _767;
    float _843 = _841;
    if (!_753)
    {
        _769 = 0.0;
    }
    float _845 = _769;
    int _847 = as_type<int>(_749) & 2048;
    bool _849 = _847 != 0;
    float _851 = _783;
    float _853 = _845;
    if (_753)
    {
        float _855 = _835 * _781;
        _397 = _855;
    }
    float _857 = _397;
    float _859 = _805;
    float _861 = _857;
    float _863 = _807;
    if (_753)
    {
        float _865 = _835 * _805;
        _859 = _865;
    }
    float _867 = _859;
    float _869 = _867;
    if (_753)
    {
        float _871 = fma(_837, _779, _857);
        _861 = _871;
    }
    float _873 = _861;
    float _875 = _829;
    float _877 = _873;
    float _879 = _827;
    if (_753)
    {
        float _881 = _835 * _829;
        _875 = _881;
    }
    float _883 = _875;
    if (_753)
    {
        float _885 = fma(_837, _803, _867);
        _869 = _885;
    }
    float _887 = _869;
    if (_753)
    {
        float _889 = fma(_839, _783, _873);
        _851 = _889;
    }
    float _891 = _851;
    if (!_753)
    {
        _877 = 0.0;
    }
    float _893 = _877;
    float _895 = _893;
    if (_753)
    {
        float _897 = fma(_837, _827, _883);
        _879 = _897;
    }
    float _899 = _879;
    float _901 = _899;
    if (_753)
    {
        float _903 = fma(_839, _807, _887);
        _863 = _903;
    }
    float _905 = _863;
    if (_753)
    {
        float _907 = _785 + _891;
        _843 = _907;
    }
    float _909 = _843;
    float _911 = _909;
    if (_753)
    {
        float _913 = fma(_839, _831, _899);
        _901 = _913;
    }
    float _915 = _901;
    if (_753)
    {
        float _917 = _809 + _905;
        _895 = _917;
    }
    float _919 = _895;
    float _921 = _919;
    if (_753)
    {
        float _923 = _833 + _915;
        _853 = _923;
    }
    float _925 = _853;
    bool _927 = !_757;
    float _929 = _925;
    if (!_927)
    {
        float _931 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _933 = uint(int(uint(_165) >> uint(2)));
        float _935 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_933)]);
        int _937 = _165 + 4;
        uint _939 = uint(int(uint(_937) >> uint(2)));
        float _941 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_939)]);
        int _943 = _165 + 8;
        uint _945 = uint(int(uint(_943) >> uint(2)));
        float _947 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_945)]);
        uint _949 = uint(int(uint(_165) >> uint(2)));
        float _951 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_949)]);
        int _953 = _165 + 4;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        float _957 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_955)]);
        int _959 = _165 + 8;
        uint _961 = uint(int(uint(_959) >> uint(2)));
        float _963 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_961)]);
        uint _965 = uint(int(uint(_165) >> uint(2)));
        float _967 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_965)]);
        int _969 = _165 + 4;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        float _973 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_971)]);
        int _975 = _165 + 8;
        uint _977 = uint(int(uint(_975) >> uint(2)));
        float _979 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_977)]);
        float _981 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _983 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _985 = _835 * _941;
        float _987 = _835 * _957;
        float _989 = _835 * _973;
        float _991 = fma(_837, _935, _985);
        float _993 = fma(_837, _951, _987);
        float _995 = fma(_837, _967, _989);
        float _997 = fma(_839, _947, _991);
        float _999 = fma(_839, _963, _993);
        float _1001 = fma(_839, _979, _995);
        float _1003 = _931 + _997;
        float _1005 = _981 + _999;
        float _1007 = _983 + _1001;
        _921 = _1005;
        _911 = _1003;
        _929 = _1007;
    }
    float _1009 = _921;
    float _1011 = _911;
    float _1013 = _929;
    bool _1015 = !_849;
    float _1017 = _1009;
    float _1019 = _1011;
    float _1021 = _1013;
    if (!_1015)
    {
        uint _1023 = uint(int(uint(_165) >> uint(2)));
        float _1025 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1023)]);
        int _1027 = _165 + 4;
        uint _1029 = uint(int(uint(_1027) >> uint(2)));
        float _1031 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1029)]);
        int _1033 = _165 + 8;
        uint _1035 = uint(int(uint(_1033) >> uint(2)));
        float _1037 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1035)]);
        int _1039 = _165 + 12;
        uint _1041 = uint(int(uint(_1039) >> uint(2)));
        float _1043 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1041)]);
        uint _1045 = uint(int(uint(_165) >> uint(2)));
        float _1047 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1045)]);
        int _1049 = _165 + 4;
        uint _1051 = uint(int(uint(_1049) >> uint(2)));
        float _1053 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1051)]);
        int _1055 = _165 + 8;
        uint _1057 = uint(int(uint(_1055) >> uint(2)));
        float _1059 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1057)]);
        int _1061 = _165 + 12;
        uint _1063 = uint(int(uint(_1061) >> uint(2)));
        float _1065 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1063)]);
        uint _1067 = uint(int(uint(_165) >> uint(2)));
        float _1069 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1067)]);
        int _1071 = _165 + 4;
        uint _1073 = uint(int(uint(_1071) >> uint(2)));
        float _1075 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1073)]);
        int _1077 = _165 + 8;
        uint _1079 = uint(int(uint(_1077) >> uint(2)));
        float _1081 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1079)]);
        int _1083 = _165 + 12;
        uint _1085 = uint(int(uint(_1083) >> uint(2)));
        float _1087 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1085)]);
        float _1089 = _835 * _1031;
        float _1091 = _835 * _1053;
        float _1093 = _835 * _1075;
        float _1095 = fma(_837, _1025, _1089);
        float _1097 = fma(_837, _1047, _1091);
        float _1099 = fma(_837, _1069, _1093);
        float _1101 = fma(_839, _1037, _1095);
        float _1103 = fma(_839, _1059, _1097);
        float _1105 = fma(_839, _1081, _1099);
        float _1107 = _1101 + _1043;
        float _1109 = _1103 + _1065;
        float _1111 = _1105 + _1087;
        _1017 = _1109;
        _1019 = _1107;
        _1021 = _1111;
    }
    float _1113 = _1017;
    float _1115 = _1019;
    float _1117 = _1021;
    float _1119 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1121 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1123 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1125 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1127 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1129 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1131 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1133 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1135 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1137 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1139 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1141 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1143 = _1121 * _1113;
    float _1145 = fma(_1119, _1115, _1143);
    float _1147 = fma(_1123, _1117, _1145);
    float _1149 = _1125 + _1147;
    float _1151 = -_1149;
    bool _1153 = _1127 >= _1151;
    bool _1155 = isnan(_1127);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(_1151);
    bool _1161 = _1157 || _1159;
    float _1163 = -_1149;
    bool _1165 = _1129 >= _1163;
    bool _1167 = isnan(_1129);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(_1163);
    bool _1173 = _1169 || _1171;
    int _1175 = _1161 ? 0 : 1;
    int _1177 = 2;
    if (_1161)
    {
        _1177 = 1;
    }
    int _1179 = _1177;
    int _1181 = _1179;
    if (_1173)
    {
        _1181 = _1175;
    }
    int _1183 = _1181;
    int _1185 = _1183 << 6;
    int _1187 = _1185 + 96;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    float _1191 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1189)]);
    int _1193 = _1187 + 4;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    float _1197 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1195)]);
    int _1199 = _1187 + 8;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    float _1203 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1201)]);
    int _1205 = _1187 + 12;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    float _1209 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1207)]);
    int _1211 = _1185 + 48;
    int _1213 = _1185 + 64;
    uint _1215 = uint(int(uint(_1211) >> uint(2)));
    float _1217 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1215)]);
    int _1219 = _1211 + 4;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    float _1223 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1221)]);
    int _1225 = _1211 + 8;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    float _1229 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1227)]);
    int _1231 = _1211 + 12;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    float _1235 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1233)]);
    uint _1237 = uint(int(uint(_1213) >> uint(2)));
    float _1239 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1237)]);
    int _1241 = _1213 + 4;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    float _1245 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1243)]);
    int _1247 = _1213 + 8;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    float _1251 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1249)]);
    int _1253 = _1213 + 12;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    float _1257 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1255)]);
    int _1259 = _1185 + 80;
    float _1261 = _1131 + 1.0;
    float _1263 = _1261 + _1113;
    uint _1265 = uint(int(uint(_1259) >> uint(2)));
    float _1267 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1265)]);
    int _1269 = _1259 + 4;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    float _1273 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1271)]);
    int _1275 = _1259 + 8;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    float _1279 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1277)]);
    int _1281 = _1259 + 12;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    float _1285 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1283)]);
    float _1287 = _1263 * _1135;
    float _1289 = fma(_1133, _1115, _1287);
    float _1291 = fma(_1137, _1117, _1289);
    float _1293 = _1139 + _1291;
    float _1295 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1297 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1299 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1301 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1303 = trunc(_1293);
    int _1305 = int(_1303);
    int _1307 = ~as_type<int>(_1141);
    int _1309 = _1305 + _1307;
    int _1311 = _1309 + 1;
    float _1313 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1315 = _1311 >= 0;
    int _1317 = _1185;
    float _1319 = as_type<float>(_1183);
    if (_1315)
    {
        float _1321 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1317 = as_type<int>(_1321);
    }
    int _1323 = _1317;
    float _1325 = _1263 * _1197;
    float _1327 = fma(_1191, _1115, _1325);
    float _1329 = fma(_1203, _1117, _1327);
    float _1331 = _1209 + _1329;
    float _1333 = _1263 * _1223;
    float _1335 = 1.0 / _1331;
    float _1337 = fma(_1217, _1115, _1333);
    float _1339 = _1263 * _1245;
    float _1341 = fma(_1229, _1117, _1337);
    float _1343 = fma(_1239, _1115, _1339);
    float _1345 = _1235 + _1341;
    float _1347 = fma(_1251, _1117, _1343);
    float _1349 = _1345 * _1335;
    float _1351 = _1257 + _1347;
    bool _1353 = _1349 >= 0.0;
    float _1355 = _1351 * _1335;
    bool _1357 = _1349 <= 1.0;
    bool _1359 = _1357 && _1353;
    bool _1361 = _1355 >= 0.0;
    bool _1363 = _1361 && _1359;
    bool _1365 = _1355 <= 1.0;
    bool _1367 = _1365 && _1363;
    float _1369 = _1263 * _1273;
    float _1371 = fma(_1267, _1115, _1369);
    if (_1367)
    {
        float _1373 = float(_1183);
        _1319 = _1373;
    }
    float _1375 = _1319;
    float _1377 = _1239;
    if (_1367)
    {
        float _1379 = rint(_1375);
        float _1381 = precise::max(_1379, 0.0);
        uint _1383 = uint(_1381);
        uint _1385 = clamp(_1383, 0u, 65535u);
        _1377 = as_type<float>(_1385);
    }
    float _1387 = _1377;
    float _1389 = fma(_1279, _1117, _1371);
    float _1391 = _1285 + _1389;
    float _1393 = _1391 * _1335;
    float _1395 = _1387;
    if (_1367)
    {
        float3 _3905 = float3(_1349, _1355, float(as_type<int>(_1387)));
        float3 _3909 = select(_3905, float3(0.0), isnan(_3905));
        float _1397 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3909.xy, uint(rint(_3909.z)), _1393, level(0.0));
        _1395 = _1397;
    }
    float _1399 = _1395;
    float _1401 = _1263 * _1297;
    float _1403 = fma(_1295, _1115, _1401);
    float _1405 = fma(_1299, _1117, _1403);
    float _1407 = _1301 + _1405;
    float _1409 = trunc(_1407);
    int _1411 = int(_1409);
    bool _1413 = _1323 <= _1311;
    bool _1415 = !_1315;
    bool _1417 = _1413 || _1415;
    int _1419 = ~as_type<int>(_1313);
    int _1421 = _1411 + _1419;
    int _1423 = _1421 + 1;
    bool _1425 = _1423 < 0;
    bool _1427 = _1425 || _1417;
    float _1429 = _1403;
    float _1431 = as_type<float>(_1411);
    if (!_1427)
    {
        float _1433 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1429 = _1433;
    }
    float _1435 = _1429;
    bool _1437 = as_type<int>(_1435) <= _1423;
    bool _1439 = _1437 || _1427;
    float _1441 = _1435;
    if (_1439)
    {
        _1431 = 1.0;
    }
    float _1443 = _1431;
    float _1445 = _1443;
    if (!_1439)
    {
        float _1447 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1449 = _1423 * as_type<int>(_1447);
        int _1451 = _1449 + _1311;
        int _1453 = _1451 << 2;
        uint _1455 = uint(int(uint(_1451) >> uint(2)));
        int _1457 = 12 & _1453;
        int _1459 = int(_1455) << 4;
        int _1461 = _1459 + _1457;
        int _1463 = _1461 + 400;
        uint _1465 = uint(int(uint(_1463) >> uint(2)));
        float _1467 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1465)]);
        float _1469 = floor(_1407);
        float _1471 = floor(_1293);
        float _1473 = -_1469;
        float _1475 = _1407 + _1473;
        float _1477 = -_1471;
        float _1479 = _1293 + _1477;
        float _1481 = rint(_1467);
        float _1483 = precise::max(_1481, 0.0);
        uint _1485 = uint(_1483);
        uint _1487 = clamp(_1485, 0u, 65535u);
        float3 _4044 = float3(_1479, _1475, float(int(_1487)));
        float3 _4046 = select(_4044, float3(0.0), isnan(_4044));
        float _1489 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4046.xy, uint(rint(_4046.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4046.xy, uint(rint(_4046.z)), level(0.0)).x;
        int _1491 = _1451 << 4;
        int _1493 = _1491 + 2048;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        float _1497 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1495)]);
        int _1499 = _1493 + 4;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        float _1503 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1501)]);
        int _1505 = _1493 + 8;
        uint _1507 = uint(int(uint(_1505) >> uint(2)));
        float _1509 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1507)]);
        int _1511 = _1493 + 12;
        uint _1513 = uint(int(uint(_1511) >> uint(2)));
        float _1515 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1513)]);
        float _1517 = _1263 * _1503;
        float _1519 = fma(_1497, _1115, _1517);
        float _1521 = fma(_1509, _1117, _1519);
        float _1523 = _1515 + _1521;
        float _1525 = precise::clamp(_1523, 0.0, 1.0);
        float _1527 = -_1525;
        float _1529 = _1527 + _1489;
        float _1531 = fma(_1529, 500.0, 1.5);
        float _1533 = exp2(_1531);
        float _1535 = 0.0 + _1533;
        float _1537 = precise::clamp(_1535, 0.0, 1.0);
        _1441 = _1467;
        _1445 = _1537;
    }
    float _1539 = _1441;
    float _1541 = _1445;
    uint _1543 = uint(int(uint(_165) >> uint(2)));
    float _1545 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1543)]);
    float _1547 = _1539;
    if (!_1367)
    {
        _1547 = 1.0;
    }
    float _1549 = _1547;
    float _1551 = -_225;
    float _1553 = _1551 + _835;
    bool _1555 = _317 > 0.001000000047497451305389404296875;
    bool _1557 = isnan(_317);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(0.001000000047497451305389404296875);
    bool _1563 = _1559 || _1561;
    float _1565 = _1549;
    if (_1367)
    {
        bool _1567 = _1399 >= _1393;
        bool _1569 = isnan(_1399);
        bool _1571 = _1567 || _1569;
        bool _1573 = isnan(_1393);
        bool _1575 = _1571 || _1573;
        float _1577 = float(_1575);
        _1565 = _1577;
    }
    float _1579 = _1565;
    float _1581 = -_231;
    float _1583 = _1581 + _839;
    int _1585 = _165 + 4;
    float _1587 = -_1579;
    float _1589 = fma(_1587, _1541, 1.0);
    float _1591 = _1553 * _1553;
    float _1593 = -_1545;
    float _1595 = _1589 + _1593;
    float _1597 = _1589;
    if (_1563)
    {
        float _1599 = fma(_1595, 0.0500000007450580596923828125, _1545);
        _1597 = _1599;
    }
    float _1601 = _1597;
    float _1603 = -_219;
    float _1605 = _1603 + _837;
    int _1607 = _165 + 8;
    float _1609 = precise::max(0.0, _1601);
    float _1611 = precise::min(_1609, 0.999000012874603271484375);
    uint _1613 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1613)] = as_type<uint>(_1611);
    uint _1615 = uint(int(uint(_169) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1615)] = as_type<uint>(_271);
    uint _1617 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1617)] = as_type<uint>(_837);
    uint _1619 = uint(int(uint(_1585) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1619)] = as_type<uint>(_835);
    uint _1621 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1621)] = as_type<uint>(_839);
    uint _1623 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1623)] = as_type<uint>(_365);
    uint _1625 = uint(int(uint(_1585) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1625)] = as_type<uint>(_367);
    uint _1627 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1627)] = as_type<uint>(_369);
    uint _1629 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1629)] = as_type<uint>(_1605);
    uint _1631 = uint(int(uint(_1585) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1631)] = as_type<uint>(_1553);
    uint _1633 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1633)] = as_type<uint>(_1583);
    float _1635 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1637 = fma(_1605, _1605, _1591);
    float _1639 = _367 * _367;
    float _1641 = fma(_1583, _1583, _1637);
    float _1643 = fma(_365, _365, _1639);
    float _1645 = fma(_369, _369, _1643);
    float _1647 = sqrt(_1641);
    float _1649 = sqrt(_1645);
    bool _1651 = _1647 >= 9.9999999747524270787835121154785e-07;
    bool _1653 = isnan(_1647);
    bool _1655 = _1651 || _1653;
    bool _1657 = isnan(9.9999999747524270787835121154785e-07);
    bool _1659 = _1655 || _1657;
    if (!_1659)
    {
        bool _1661 = _173 != _177;
        bool _1663 = isnan(_173);
        bool _1665 = _1661 || _1663;
        bool _1667 = isnan(_177);
        bool _1669 = _1665 || _1667;
        _1671 = _1669;
        if (!_1671)
        {
            float _1673 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1675 = _1673 > 0.0;
            bool _1677 = !_1675;
            if (!_1677)
            {
                float _1679 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1681 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1683 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1685 = _1681 * _1681;
                float _1687 = fma(_1679, _1679, _1685);
                float _1689 = fma(_1683, _1683, _1687);
                float _1691 = rsqrt(_1689);
                float _1693 = _1691 * 9.9999999747524270787835121154785e-07;
                float _1695 = _1679 * _1693;
                float _1697 = _1681 * _1693;
                float _1699 = _1683 * _1693;
                _407 = as_type<int>(_1695);
                _409 = as_type<int>(_1697);
                _411 = as_type<int>(_1699);
                _1671 = true;
            }
            else
            {
                bool _1701 = _1649 >= 9.9999999747524270787835121154785e-07;
                bool _1703 = isnan(_1649);
                bool _1705 = _1701 || _1703;
                bool _1707 = isnan(9.9999999747524270787835121154785e-07);
                bool _1709 = _1705 || _1707;
                if (!_1709)
                {
                    float _1711 = _835 * _835;
                    float _1713 = fma(_837, _837, _1711);
                    float _1715 = fma(_839, _839, _1713);
                    float _1717 = sqrt(_1715);
                    bool _1719 = _1717 >= 9.9999999747524270787835121154785e-07;
                    bool _1721 = isnan(_1717);
                    bool _1723 = _1719 || _1721;
                    bool _1725 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1727 = _1723 || _1725;
                    int _1729 = as_type<int>(_261);
                    int _1731 = as_type<int>(_1717);
                    if (_1727)
                    {
                        float _1733 = rsqrt(_1715);
                        _1729 = as_type<int>(_1733);
                    }
                    int _1735 = _1729;
                    if (!_1727)
                    {
                        _1731 = 0;
                    }
                    int _1737 = _1731;
                    int _1739 = _1737;
                    if (!_1727)
                    {
                        _399 = 897988541;
                    }
                    int _1741 = _399;
                    int _1743 = _1735;
                    int _1745 = _1741;
                    if (_1727)
                    {
                        float _1747 = as_type<float>(_1735) * 9.9999999747524270787835121154785e-07;
                        _307 = _1747;
                    }
                    float _1749 = _307;
                    if (!_1727)
                    {
                        _1743 = 0;
                    }
                    int _1751 = _1743;
                    int _1753 = _1751;
                    if (_1727)
                    {
                        float _1755 = _837 * _1749;
                        _1739 = as_type<int>(_1755);
                    }
                    int _1757 = _1739;
                    _407 = _1757;
                    if (_1727)
                    {
                        float _1759 = _835 * _1749;
                        _1745 = as_type<int>(_1759);
                    }
                    int _1761 = _1745;
                    _409 = _1761;
                    if (_1727)
                    {
                        float _1763 = _839 * _1749;
                        _1753 = as_type<int>(_1763);
                    }
                    int _1765 = _1753;
                    _411 = _1765;
                    _1671 = true;
                }
                else
                {
                    float _1767 = rsqrt(_1645);
                    float _1769 = _1767 * 9.9999999747524270787835121154785e-07;
                    float _1771 = _365 * _1769;
                    float _1773 = _367 * _1769;
                    float _1775 = _369 * _1769;
                    _407 = as_type<int>(_1771);
                    _409 = as_type<int>(_1773);
                    _411 = as_type<int>(_1775);
                    _1671 = true;
                }
            }
        }
    }
    else
    {
        float _1777 = _1649 * _1635;
        bool _1779 = _1777 >= 0.001000000047497451305389404296875;
        bool _1781 = isnan(_1777);
        bool _1783 = _1779 || _1781;
        bool _1785 = isnan(0.001000000047497451305389404296875);
        bool _1787 = _1783 || _1785;
        bool _1789 = _1777 > 0.0;
        bool _1791 = !_1787;
        bool _1793 = _1789 && _1791;
        bool _1795 = _1647 < 0.001000000047497451305389404296875;
        bool _1797 = _1795 && _1793;
        if (!_1797)
        {
            _401 = as_type<int>(_1605);
        }
        int _1799 = _401;
        int _1801 = _1799;
        if (_1797)
        {
            float _1803 = _365 * _1635;
            _1801 = as_type<int>(_1803);
        }
        int _1805 = _1801;
        _407 = _1805;
        if (!_1797)
        {
            _403 = as_type<int>(_1553);
        }
        int _1807 = _403;
        int _1809 = _1807;
        if (_1797)
        {
            float _1811 = _367 * _1635;
            _1809 = as_type<int>(_1811);
        }
        int _1813 = _1809;
        _409 = _1813;
        if (!_1797)
        {
            _405 = as_type<int>(_1583);
        }
        int _1815 = _405;
        _411 = _1815;
        if (_1797)
        {
            float _1817 = _369 * _1635;
            _411 = as_type<int>(_1817);
        }
    }
    _1671 = false;
    int _1819 = _407;
    int _1821 = _409;
    int _1823 = _411;
    uint _1825 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1825)] = uint(_1819);
    uint _1827 = uint(int(uint(_1585) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1827)] = uint(_1821);
    uint _1829 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1829)] = uint(_1823);
}

