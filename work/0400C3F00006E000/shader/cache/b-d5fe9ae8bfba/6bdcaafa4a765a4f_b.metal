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
    bool _2085 = false;
    float _71 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _73 = as_type<float>(gl_LocalInvocationID.x);
    float _75 = as_type<float>(gl_WorkGroupID.x);
    int _78 = as_type<int>(_75) << 5;
    int _80 = _78 + as_type<int>(_73);
    float _82 = trunc(_71);
    int _84 = int(_82);
    bool _88 = _80 >= _84;
    int _90 = as_type<int>(_75);
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
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _161 = _80 << 4;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_163)]);
    int _167 = _161 + 4;
    uint _169 = uint(int(uint(_167) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_169)]);
    int _173 = _161 + 8;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_175)]);
    int _179 = as_type<int>(_159) & 512;
    bool _181 = _179 != 0;
    int _183 = _161 + 12;
    uint _185 = uint(int(uint(_161) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_185)]);
    int _189 = _161 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_191)]);
    int _195 = _161 + 8;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    uint _201 = uint(int(uint(_161) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_201)]);
    int _205 = _161 + 4;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_207)]);
    int _211 = _161 + 8;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_213)]);
    int _217 = _161 + 12;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_219)]);
    float _223 = 0.0;
    float _225 = 0.0;
    float _227 = 0.0;
    if (_181)
    {
        float _229 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _231 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _223 = _229;
        _225 = _231;
        _227 = _233;
    }
    float _235 = _223;
    float _237 = _225;
    float _239 = _227;
    float _241 = 0.0;
    float _243 = 0.0;
    float _245 = 0.0;
    if (_181)
    {
        float _247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _241 = _247;
        _243 = _249;
        _245 = _251;
    }
    float _253 = _241;
    float _255 = _243;
    float _257 = _245;
    float _259 = 0.0;
    float _261 = 0.0;
    float _263 = 0.0;
    if (_181)
    {
        float _265 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _267 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _269 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _259 = _265;
        _261 = _267;
        _263 = _269;
    }
    float _271 = _259;
    float _273 = _261;
    float _275 = _263;
    uint _277 = uint(int(uint(_183) >> uint(2)));
    float _279 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_277)]);
    uint _281 = uint(int(uint(_183) >> uint(2)));
    float _283 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_281)]);
    float _285 = 0.0;
    float _287 = 0.0;
    float _289 = 0.0;
    float _291 = _221;
    float _293 = _255;
    float _295 = _253;
    float _297 = _237;
    float _299 = _257;
    float _301 = _235;
    float _303 = _273;
    float _305 = _239;
    float _307 = _271;
    float _309 = _275;
    float _311 = _279;
    float _313 = _199;
    float _315 = _187;
    float _317 = _193;
    float _319 = _187;
    float _321 = _199;
    int _323 = as_type<int>(_203);
    int _325 = as_type<int>(_209);
    int _327 = as_type<int>(_215);
    int _329 = as_type<int>(_203);
    int _331 = as_type<int>(_209);
    int _333 = as_type<int>(_215);
    int _335 = as_type<int>(_203);
    int _337 = as_type<int>(_209);
    int _339 = as_type<int>(_215);
    if (!_181)
    {
        int _341 = _161 + 4;
        uint _343 = uint(int(uint(_161) >> uint(2)));
        float _345 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_343)]);
        int _347 = _161 + 8;
        uint _349 = uint(int(uint(_161) >> uint(2)));
        float _351 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_349)]);
        uint _353 = uint(int(uint(_341) >> uint(2)));
        float _355 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_353)]);
        uint _357 = uint(int(uint(_347) >> uint(2)));
        float _359 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_357)]);
        uint _361 = uint(int(uint(_341) >> uint(2)));
        float _363 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_361)]);
        uint _365 = uint(int(uint(_161) >> uint(2)));
        float _367 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_365)]);
        uint _369 = uint(int(uint(_347) >> uint(2)));
        float _371 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_369)]);
        uint _373 = uint(int(uint(_341) >> uint(2)));
        float _375 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_373)]);
        uint _377 = uint(int(uint(_347) >> uint(2)));
        float _379 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_377)]);
        float _381 = _345 * _345;
        float _383 = fma(_351, _351, _381);
        float _385 = _355 * _355;
        float _387 = _359 * _359;
        float _389 = fma(_363, _363, _385);
        float _391 = fma(_367, _367, _383);
        float _393 = fma(_371, _371, _387);
        float _395 = fma(_375, _375, _389);
        float _397 = sqrt(_391);
        float _399 = fma(_379, _379, _393);
        float _401 = sqrt(_395);
        float _403 = sqrt(_399);
        bool _405 = _397 > 0.0;
        bool _407 = _401 > 0.0;
        bool _409 = _403 > 0.0;
        float _411 = _387;
        float _413 = _389;
        float _415 = _393;
        float _417 = _397;
        float _419 = _401;
        float _421 = _403;
        float _423 = _391;
        float _425 = _355;
        float _427 = _367;
        float _429 = _395;
        _285 = _379;
        _287 = _399;
        _291 = _345;
        if (_405)
        {
            float _431 = rsqrt(_391);
            _411 = _431;
        }
        float _433 = _411;
        float _435 = 0.0;
        if (_407)
        {
            float _437 = rsqrt(_395);
            _435 = _437;
        }
        float _439 = _435;
        float _441 = 0.0;
        if (_409)
        {
            float _443 = rsqrt(_399);
            _441 = _443;
        }
        float _445 = _441;
        if (!_405)
        {
            _413 = 0.0;
        }
        float _447 = _413;
        float _449 = _447;
        _289 = _433;
        if (_405)
        {
            float _451 = _367 * _433;
            _449 = _451;
        }
        float _453 = _449;
        _307 = _453;
        if (!_407)
        {
            _415 = 0.0;
        }
        float _455 = _415;
        float _457 = _455;
        if (!_405)
        {
            _417 = 0.0;
        }
        float _459 = _417;
        float _461 = _459;
        if (_405)
        {
            float _463 = _345 * _433;
            _461 = _463;
        }
        float _465 = _461;
        _295 = _465;
        if (!_405)
        {
            _419 = 0.0;
        }
        float _467 = _419;
        float _469 = _467;
        if (_407)
        {
            float _471 = _355 * _439;
            _457 = _471;
        }
        float _473 = _457;
        _293 = _473;
        if (!_407)
        {
            _421 = 0.0;
        }
        float _475 = _421;
        float _477 = _475;
        if (_405)
        {
            float _479 = _351 * _433;
            _469 = _479;
        }
        float _481 = _469;
        _301 = _481;
        if (!_407)
        {
            _423 = 0.0;
        }
        float _483 = _423;
        float _485 = _483;
        if (_407)
        {
            float _487 = _363 * _439;
            _477 = _487;
        }
        float _489 = _477;
        _297 = _489;
        if (!_409)
        {
            _425 = 0.0;
        }
        float _491 = _425;
        float _493 = _491;
        if (_407)
        {
            float _495 = _375 * _439;
            _485 = _495;
        }
        float _497 = _485;
        _303 = _497;
        if (!_409)
        {
            _427 = 0.0;
        }
        float _499 = _427;
        float _501 = _499;
        if (_409)
        {
            float _503 = _359 * _445;
            _493 = _503;
        }
        float _505 = _493;
        _299 = _505;
        if (!_409)
        {
            _429 = 0.0;
        }
        float _507 = _429;
        _309 = _507;
        if (_409)
        {
            float _509 = _371 * _445;
            _501 = _509;
        }
        float _511 = _501;
        _305 = _511;
        if (_409)
        {
            float _513 = _379 * _445;
            _309 = _513;
        }
    }
    float _515 = _285;
    float _517 = _287;
    float _519 = _289;
    float _521 = _291;
    float _523 = _293;
    float _525 = _295;
    float _527 = _297;
    float _529 = _299;
    float _531 = _301;
    float _533 = _303;
    float _535 = _305;
    float _537 = _307;
    float _539 = _309;
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[52]);
    int _545 = as_type<int>(_159) & 1024;
    bool _547 = _545 != 0;
    float _549 = 0.0;
    float _551 = 0.0;
    float _553 = 0.0;
    float _555 = 0.0;
    if (_181)
    {
        float _557 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _559 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _561 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _563 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _549 = _557;
        _551 = _559;
        _553 = _561;
        _555 = _563;
    }
    float _565 = _549;
    float _567 = _551;
    float _569 = _553;
    float _571 = _555;
    int _573 = as_type<int>(_159) & 2048;
    bool _575 = _573 != 0;
    float _577 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _579 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _581 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _583 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _585 = 0.0;
    float _587 = 0.0;
    float _589 = 0.0;
    float _591 = 0.0;
    if (_547)
    {
        uint _593 = uint(int(uint(_161) >> uint(2)));
        float _595 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_593)]);
        int _597 = _161 + 4;
        uint _599 = uint(int(uint(_597) >> uint(2)));
        float _601 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_599)]);
        int _603 = _161 + 8;
        uint _605 = uint(int(uint(_603) >> uint(2)));
        float _607 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_605)]);
        int _609 = _161 + 12;
        uint _611 = uint(int(uint(_609) >> uint(2)));
        float _613 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_611)]);
        _585 = _595;
        _587 = _601;
        _589 = _607;
        _591 = _613;
    }
    float _615 = _585;
    float _617 = _587;
    float _619 = _589;
    float _621 = _591;
    float _623 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _625 = _515;
    float _627 = _517;
    float _629 = _519;
    float _631 = _159;
    if (_575)
    {
        uint _633 = uint(int(uint(_161) >> uint(2)));
        float _635 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_633)]);
        int _637 = _161 + 4;
        uint _639 = uint(int(uint(_637) >> uint(2)));
        float _641 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_639)]);
        int _643 = _161 + 8;
        uint _645 = uint(int(uint(_643) >> uint(2)));
        float _647 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_645)]);
        int _649 = _161 + 12;
        uint _651 = uint(int(uint(_649) >> uint(2)));
        float _653 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_651)]);
        _625 = _635;
        _627 = _641;
        _629 = _647;
        _631 = _653;
    }
    float _655 = _625;
    float _657 = _627;
    float _659 = _629;
    float _661 = _631;
    float _663 = 0.0;
    if (_547)
    {
        float _665 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _663 = _665;
    }
    float _667 = _663;
    float _669 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _671 = trunc(_543);
    int _673 = int(_671);
    bool _675 = _673 != 0;
    float _677 = _521;
    if (!_675)
    {
        float _679 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _677 = _679;
    }
    float _681 = _677;
    float _683 = _279 * _541;
    bool _685 = _673 != 1;
    float _687 = fma(_193, _683, _171);
    float _689 = 0.0;
    float _691 = _615;
    float _693 = _583;
    float _695 = _569;
    float _697 = _621;
    float _699 = _659;
    float _701 = _661;
    float _703 = _657;
    float _705 = _661;
    float _707 = _667;
    if (!_685)
    {
        float _709 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _689 = _709;
    }
    float _711 = _689;
    float _713 = fma(_187, _683, _165);
    float _715 = _713;
    if (_181)
    {
        float _717 = _687 * _567;
        _311 = _717;
    }
    float _719 = _311;
    float _721 = _719;
    if (_181)
    {
        float _723 = fma(_713, _565, _719);
        _721 = _723;
    }
    float _725 = _721;
    float _727 = abs(_577);
    float _729 = log2(_727);
    bool _731 = _687 < _681;
    bool _733 = !_675;
    bool _735 = _731 && _733;
    float _737 = 0.0;
    float _739 = _725;
    if (!_735)
    {
        _737 = _687;
    }
    float _741 = _737;
    float _743 = 0.0;
    if (_735)
    {
        float _745 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[53]);
        _743 = _745;
    }
    float _747 = _743;
    float _749 = 0.0;
    if (_735)
    {
        float _751 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[54]);
        _749 = _751;
    }
    float _753 = _749;
    float _755 = _741;
    if (_735)
    {
        float _757 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _755 = _757;
    }
    float _759 = _755;
    float _761 = 0.0;
    if (_547)
    {
        float _763 = _687 * _617;
        _761 = _763;
    }
    float _765 = _761;
    float _767 = fma(_199, _683, _177);
    float _769 = _583 * _623;
    float _771 = _767;
    if (_547)
    {
        float _773 = fma(_713, _615, _765);
        _691 = _773;
    }
    float _775 = _691;
    if (_575)
    {
        float _777 = _687 * _657;
        _693 = _777;
    }
    float _779 = _693;
    float _781 = _779;
    if (_181)
    {
        float _783 = fma(_767, _569, _725);
        _695 = _783;
    }
    float _785 = _695;
    float _787 = _581 * _623;
    if (_547)
    {
        float _789 = fma(_767, _619, _775);
        _697 = _789;
    }
    float _791 = _697;
    float _793 = _541 * _729;
    if (!_181)
    {
        _739 = 0.0;
    }
    float _795 = _739;
    float _797 = _795;
    if (_575)
    {
        float _799 = fma(_713, _655, _779);
        _781 = _799;
    }
    float _801 = _781;
    float _803 = _801;
    if (_181)
    {
        float _805 = _571 + _785;
        _797 = _805;
    }
    float _807 = _797;
    float _809 = _579 * _623;
    float _811 = _807;
    float _813 = _809;
    if (_547)
    {
        float _815 = _667 + _791;
        _811 = _815;
    }
    float _817 = _811;
    float _819 = _787 * _523;
    float _821 = exp2(_793);
    float _823 = _819;
    if (_575)
    {
        float _825 = fma(_767, _659, _801);
        _699 = _825;
    }
    float _827 = _699;
    float _829 = _787 * _525;
    float _831 = fma(_809, _527, _819);
    float _833 = _827;
    if (!_575)
    {
        _823 = _817;
    }
    float _835 = _823;
    float _837 = _787 * _529;
    float _839 = _835;
    if (_575)
    {
        float _841 = _661 + _827;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = fma(_809, _531, _829);
    float _847 = fma(_769, _533, _831);
    float _849 = fma(_809, _535, _837);
    bool _851 = _843 < _711;
    bool _853 = !_685;
    bool _855 = _851 && _853;
    float _857 = fma(_769, _537, _845);
    float _859 = _541 * _847;
    float _861 = fma(_769, _539, _849);
    float _863 = _541 * _857;
    float _865 = fma(_193, _821, _859);
    float _867 = _541 * _861;
    float _869 = fma(_187, _821, _863);
    uint _871 = uint(int(uint(_183) >> uint(2)));
    float _873 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_871)]);
    float _875 = fma(_199, _821, _867);
    float _877 = _867;
    float _879 = _861;
    float _881 = _869;
    float _883 = _875;
    float _885 = _849;
    float _887 = _849;
    float _889 = _865;
    float _891 = _863;
    if (!_735)
    {
        _877 = _865;
    }
    float _893 = _877;
    float _895 = _893;
    float _897 = _759;
    if (_735)
    {
        float _899 = _865 * _747;
        _879 = _899;
    }
    float _901 = _879;
    float _903 = -_283;
    float _905 = _669 + _903;
    float _907 = _901;
    if (_735)
    {
        float _909 = -_901;
        float _911 = fma(_909, _753, -0.0);
        _895 = _911;
    }
    float _913 = _895;
    float _915 = _913;
    if (_735)
    {
        float _917 = _869 * _753;
        _881 = _917;
    }
    float _919 = _881;
    float _921 = _919;
    if (_735)
    {
        float _923 = _875 * _753;
        _883 = _923;
    }
    float _925 = _883;
    float _927 = _925;
    if (!_855)
    {
        _907 = _759;
    }
    float _929 = _907;
    bool _931 = !_855;
    float _933 = _929;
    float _935 = _929;
    if (!_931)
    {
        float _937 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        float _939 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[53]);
        float _941 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[54]);
        if (!_181)
        {
            _313 = _525;
        }
        float _943 = _313;
        float _945 = _943;
        if (!_181)
        {
            _933 = _523;
        }
        float _947 = _933;
        float _949 = _947;
        if (!_181)
        {
            _315 = _529;
        }
        float _951 = _315;
        bool _953 = !_181;
        float _955 = _951;
        _813 = _937;
        if (!_953)
        {
            float _957 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _959 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _961 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _963 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _965 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _967 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _969 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _971 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _973 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _975 = _963 * _961;
            float _977 = _965 * _961;
            float _979 = -_975;
            float _981 = fma(_967, _957, _979);
            float _983 = -_977;
            float _985 = fma(_967, _959, _983);
            float _987 = _963 * _959;
            float _989 = _973 * _963;
            float _991 = _971 * _981;
            float _993 = -_987;
            float _995 = fma(_965, _957, _993);
            float _997 = -_989;
            float _999 = fma(_969, _967, _997);
            float _1001 = -_991;
            float _1003 = fma(_969, _985, _1001);
            float _1005 = _971 * _967;
            float _1007 = fma(_973, _995, _1003);
            float _1009 = _969 * _965;
            float _1011 = -_1005;
            float _1013 = fma(_973, _965, _1011);
            float _1015 = -_1009;
            float _1017 = fma(_971, _963, _1015);
            float _1019 = 1.0 / _1007;
            float _1021 = _1013 * _1019;
            float _1023 = _999 * _1019;
            float _1025 = _1017 * _1019;
            _949 = _1023;
            _945 = _1021;
            _955 = _1025;
            _885 = _999;
            _701 = _1005;
        }
        float _1027 = _949;
        float _1029 = _945;
        float _1031 = _955;
        float _1033 = _885;
        float _1035 = _701;
        float _1037 = _1027 * _1027;
        float _1039 = _939 + 1.0;
        float _1041 = fma(_1029, _1029, _1037);
        float _1043 = fma(_1031, _1031, _1041);
        float _1045 = rsqrt(_1043);
        float _1047 = _1045 * _1027;
        float _1049 = _1045 * _1029;
        float _1051 = _1045 * _1031;
        float _1053 = _1047 * _913;
        float _1055 = fma(_1049, _919, _1053);
        float _1057 = -_843;
        float _1059 = _1057 + _937;
        float _1061 = fma(_1051, _925, _1055);
        float _1063 = fma(_1059, _1029, _713);
        float _1065 = fma(_1059, _1027, _759);
        float _1067 = fma(_1059, _1031, _767);
        float _1069 = _1061 * _1039;
        float _1071 = -_1049;
        float _1073 = fma(_1071, _1069, _919);
        float _1075 = -_1047;
        float _1077 = fma(_1075, _1069, _913);
        float _1079 = -_1051;
        float _1081 = fma(_1079, _1069, _925);
        float _1083 = _1073 * _941;
        float _1085 = _1077 * _941;
        float _1087 = _1081 * _941;
        _317 = _1045;
        _935 = _1065;
        _887 = _1033;
        _803 = _1059;
        _889 = _1047;
        _703 = _1069;
        _833 = _1051;
        _705 = _1035;
        _319 = _1031;
        _321 = _1029;
        _891 = _1049;
        _715 = _1063;
        _771 = _1067;
        _921 = _1083;
        _915 = _1085;
        _927 = _1087;
    }
    float _1089 = _317;
    float _1091 = _935;
    float _1093 = _887;
    float _1095 = _803;
    float _1097 = _813;
    float _1099 = _889;
    float _1101 = _703;
    float _1103 = _833;
    float _1105 = _705;
    float _1107 = _319;
    float _1109 = _321;
    float _1111 = _891;
    float _1113 = _715;
    float _1115 = _771;
    float _1117 = _921;
    float _1119 = _915;
    float _1121 = _927;
    bool _1123 = _673 != 3;
    bool _1125 = _673 != 2;
    float _1127 = _1089;
    if (!_1123)
    {
        float _1129 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _1127 = _1129;
    }
    float _1131 = _1127;
    float _1133 = as_type<float>(_673);
    if (!_1125)
    {
        float _1135 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _1133 = _1135;
    }
    float _1137 = _1133;
    bool _1139 = _843 < _1131;
    bool _1141 = !_1123;
    bool _1143 = _1139 && _1141;
    bool _1145 = _1091 < _1137;
    bool _1147 = !_1125;
    bool _1149 = _1145 && _1147;
    bool _1151 = !_1143;
    bool _1153 = _1151 && _1149;
    bool _1155 = !_1149;
    bool _1157 = _1143 && _1155;
    bool _1159 = _1153 || _1157;
    bool _1161 = _1143 && _1149;
    bool _1163 = _1159 || _1161;
    bool _1165 = !_1163;
    int _1167 = _1165 ? as_type<int>(_873) : 0;
    uint _1169 = uint(int(uint(_183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = uint(_1167);
    float _1171 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1173 = as_type<int>(_1171) & 512;
    bool _1175 = _1173 != 0;
    int _1177 = as_type<int>(_1171) & 1024;
    bool _1179 = _1177 != 0;
    float _1181 = _843;
    float _1183 = _1093;
    float _1185 = _1095;
    float _1187 = _1097;
    float _1189 = _1137;
    if (_1175)
    {
        float _1191 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1193 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1195 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1181 = _1191;
        _1183 = _1193;
        _1185 = _1195;
        _1187 = _1197;
    }
    float _1199 = _1181;
    float _1201 = _1183;
    float _1203 = _1185;
    float _1205 = _1187;
    float _1207 = _1099;
    float _1209 = _1101;
    float _1211 = _1103;
    float _1213 = _1105;
    if (_1175)
    {
        float _1215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1219 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1207 = _1215;
        _1209 = _1217;
        _1211 = _1219;
        _1213 = _1221;
    }
    float _1223 = _1207;
    float _1225 = _1209;
    float _1227 = _1211;
    float _1229 = _1213;
    float _1231 = _1107;
    float _1233 = _1131;
    float _1235 = _1109;
    float _1237 = _1111;
    if (_1175)
    {
        float _1239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1243 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1245 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1231 = _1239;
        _1233 = _1241;
        _1235 = _1243;
        _1237 = _1245;
    }
    float _1247 = _1231;
    float _1249 = _1233;
    float _1251 = _1235;
    float _1253 = _1237;
    if (!_1175)
    {
        _1189 = 0.0;
    }
    float _1255 = _1189;
    float _1257 = _1255;
    if (!_1175)
    {
        _707 = 0.0;
    }
    float _1259 = _707;
    float _1261 = _1259;
    if (!_1175)
    {
        _897 = 0.0;
    }
    float _1263 = _897;
    int _1265 = as_type<int>(_1171) & 2048;
    bool _1267 = _1265 != 0;
    float _1269 = _1201;
    float _1271 = _1203;
    float _1273 = _1263;
    if (_1175)
    {
        float _1275 = _1201 * _1091;
        _1269 = _1275;
    }
    float _1277 = _1269;
    float _1279 = _1225;
    float _1281 = _1277;
    float _1283 = _1249;
    float _1285 = _1227;
    float _1287 = _1251;
    if (_1175)
    {
        float _1289 = _1225 * _1091;
        _1279 = _1289;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (_1175)
    {
        float _1295 = fma(_1199, _1113, _1277);
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (_1175)
    {
        float _1299 = _1249 * _1091;
        _1283 = _1299;
    }
    float _1301 = _1283;
    float _1303 = _1301;
    if (_1175)
    {
        float _1305 = fma(_1223, _1113, _1291);
        _1293 = _1305;
    }
    float _1307 = _1293;
    if (_1175)
    {
        float _1309 = fma(_1203, _1115, _1297);
        _1271 = _1309;
    }
    float _1311 = _1271;
    if (_1175)
    {
        float _1313 = fma(_1247, _1113, _1301);
        _1303 = _1313;
    }
    float _1315 = _1303;
    if (_1175)
    {
        float _1317 = fma(_1227, _1115, _1307);
        _1285 = _1317;
    }
    float _1319 = _1285;
    if (_1175)
    {
        float _1321 = _1205 + _1311;
        _1257 = _1321;
    }
    float _1323 = _1257;
    float _1325 = _1323;
    if (_1175)
    {
        float _1327 = fma(_1251, _1115, _1315);
        _1287 = _1327;
    }
    float _1329 = _1287;
    if (_1175)
    {
        float _1331 = _1229 + _1319;
        _1261 = _1331;
    }
    float _1333 = _1261;
    float _1335 = _1333;
    if (_1175)
    {
        float _1337 = _1253 + _1329;
        _1273 = _1337;
    }
    float _1339 = _1273;
    bool _1341 = !_1179;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1347 = uint(int(uint(_161) >> uint(2)));
        float _1349 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1347)]);
        int _1351 = _161 + 4;
        uint _1353 = uint(int(uint(_1351) >> uint(2)));
        float _1355 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1353)]);
        int _1357 = _161 + 8;
        uint _1359 = uint(int(uint(_1357) >> uint(2)));
        float _1361 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1359)]);
        uint _1363 = uint(int(uint(_161) >> uint(2)));
        float _1365 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1363)]);
        int _1367 = _161 + 4;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        float _1371 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1369)]);
        int _1373 = _161 + 8;
        uint _1375 = uint(int(uint(_1373) >> uint(2)));
        float _1377 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1375)]);
        uint _1379 = uint(int(uint(_161) >> uint(2)));
        float _1381 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1379)]);
        int _1383 = _161 + 4;
        uint _1385 = uint(int(uint(_1383) >> uint(2)));
        float _1387 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1385)]);
        int _1389 = _161 + 8;
        uint _1391 = uint(int(uint(_1389) >> uint(2)));
        float _1393 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1391)]);
        float _1395 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1397 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1399 = _1355 * _1091;
        float _1401 = _1371 * _1091;
        float _1403 = _1387 * _1091;
        float _1405 = fma(_1349, _1113, _1399);
        float _1407 = fma(_1365, _1113, _1401);
        float _1409 = fma(_1381, _1113, _1403);
        float _1411 = fma(_1361, _1115, _1405);
        float _1413 = fma(_1377, _1115, _1407);
        float _1415 = fma(_1393, _1115, _1409);
        float _1417 = _1345 + _1411;
        float _1419 = _1395 + _1413;
        float _1421 = _1397 + _1415;
        _1335 = _1419;
        _1325 = _1417;
        _1343 = _1421;
    }
    float _1423 = _1335;
    float _1425 = _1325;
    float _1427 = _1343;
    bool _1429 = !_1267;
    float _1431 = _1423;
    float _1433 = _1425;
    float _1435 = _1427;
    if (!_1429)
    {
        uint _1437 = uint(int(uint(_161) >> uint(2)));
        float _1439 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1437)]);
        int _1441 = _161 + 4;
        uint _1443 = uint(int(uint(_1441) >> uint(2)));
        float _1445 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1443)]);
        int _1447 = _161 + 8;
        uint _1449 = uint(int(uint(_1447) >> uint(2)));
        float _1451 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1449)]);
        int _1453 = _161 + 12;
        uint _1455 = uint(int(uint(_1453) >> uint(2)));
        float _1457 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1455)]);
        uint _1459 = uint(int(uint(_161) >> uint(2)));
        float _1461 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1459)]);
        int _1463 = _161 + 4;
        uint _1465 = uint(int(uint(_1463) >> uint(2)));
        float _1467 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1465)]);
        int _1469 = _161 + 8;
        uint _1471 = uint(int(uint(_1469) >> uint(2)));
        float _1473 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1471)]);
        int _1475 = _161 + 12;
        uint _1477 = uint(int(uint(_1475) >> uint(2)));
        float _1479 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1477)]);
        uint _1481 = uint(int(uint(_161) >> uint(2)));
        float _1483 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1481)]);
        int _1485 = _161 + 4;
        uint _1487 = uint(int(uint(_1485) >> uint(2)));
        float _1489 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1487)]);
        int _1491 = _161 + 8;
        uint _1493 = uint(int(uint(_1491) >> uint(2)));
        float _1495 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1493)]);
        int _1497 = _161 + 12;
        uint _1499 = uint(int(uint(_1497) >> uint(2)));
        float _1501 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1499)]);
        float _1503 = _1445 * _1091;
        float _1505 = _1467 * _1091;
        float _1507 = _1489 * _1091;
        float _1509 = fma(_1439, _1113, _1503);
        float _1511 = fma(_1461, _1113, _1505);
        float _1513 = fma(_1483, _1113, _1507);
        float _1515 = fma(_1451, _1115, _1509);
        float _1517 = fma(_1473, _1115, _1511);
        float _1519 = fma(_1495, _1115, _1513);
        float _1521 = _1515 + _1457;
        float _1523 = _1517 + _1479;
        float _1525 = _1519 + _1501;
        _1431 = _1523;
        _1433 = _1521;
        _1435 = _1525;
    }
    float _1527 = _1431;
    float _1529 = _1433;
    float _1531 = _1435;
    float _1533 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _1535 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
    float _1537 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
    float _1539 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
    float _1541 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
    float _1543 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[61]);
    float _1545 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[60]);
    float _1547 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[504]);
    float _1549 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[505]);
    float _1551 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[506]);
    float _1553 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[507]);
    float _1555 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[501]);
    float _1557 = _1537 * _1527;
    float _1559 = fma(_1535, _1529, _1557);
    float _1561 = fma(_1539, _1531, _1559);
    float _1563 = _1541 + _1561;
    float _1565 = -_1563;
    bool _1567 = _1543 >= _1565;
    bool _1569 = isnan(_1543);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    float _1577 = -_1563;
    bool _1579 = _1545 >= _1577;
    bool _1581 = isnan(_1545);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_1577);
    bool _1587 = _1583 || _1585;
    int _1589 = _1575 ? 0 : 1;
    int _1591 = 2;
    float _1593 = _1529;
    if (_1575)
    {
        _1591 = 1;
    }
    int _1595 = _1591;
    int _1597 = _1595;
    if (_1587)
    {
        _1597 = _1589;
    }
    int _1599 = _1597;
    int _1601 = _1599 << 6;
    int _1603 = _1601 + 96;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    float _1607 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1605)]);
    int _1609 = _1603 + 4;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    float _1613 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1611)]);
    int _1615 = _1603 + 8;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    float _1619 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1617)]);
    int _1621 = _1603 + 12;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    float _1625 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1623)]);
    int _1627 = _1601 + 48;
    int _1629 = _1601 + 64;
    uint _1631 = uint(int(uint(_1627) >> uint(2)));
    float _1633 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1631)]);
    int _1635 = _1627 + 4;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    float _1639 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1637)]);
    int _1641 = _1627 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    float _1645 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1643)]);
    int _1647 = _1627 + 12;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    float _1651 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1649)]);
    uint _1653 = uint(int(uint(_1629) >> uint(2)));
    float _1655 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1653)]);
    int _1657 = _1629 + 4;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    float _1661 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1659)]);
    int _1663 = _1629 + 8;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    float _1667 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1665)]);
    int _1669 = _1629 + 12;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    float _1673 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1671)]);
    int _1675 = _1601 + 80;
    float _1677 = _1533 + 1.0;
    float _1679 = _1677 + _1527;
    uint _1681 = uint(int(uint(_1675) >> uint(2)));
    float _1683 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1681)]);
    int _1685 = _1675 + 4;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    float _1689 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1687)]);
    int _1691 = _1675 + 8;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    float _1695 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1693)]);
    int _1697 = _1675 + 12;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    float _1701 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1699)]);
    float _1703 = _1679 * _1549;
    float _1705 = fma(_1547, _1529, _1703);
    float _1707 = fma(_1551, _1531, _1705);
    float _1709 = _1553 + _1707;
    float _1711 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[508]);
    float _1713 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[509]);
    float _1715 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[510]);
    float _1717 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[511]);
    float _1719 = trunc(_1709);
    int _1721 = int(_1719);
    int _1723 = ~as_type<int>(_1555);
    int _1725 = _1721 + _1723;
    int _1727 = _1725 + 1;
    float _1729 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[502]);
    bool _1731 = _1727 >= 0;
    int _1733 = _1721;
    float _1735 = as_type<float>(_1599);
    if (_1731)
    {
        float _1737 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _1733 = as_type<int>(_1737);
    }
    int _1739 = _1733;
    float _1741 = _1679 * _1613;
    float _1743 = fma(_1607, _1529, _1741);
    float _1745 = fma(_1619, _1531, _1743);
    float _1747 = _1625 + _1745;
    float _1749 = _1679 * _1639;
    float _1751 = 1.0 / _1747;
    float _1753 = fma(_1633, _1529, _1749);
    float _1755 = _1679 * _1661;
    float _1757 = fma(_1645, _1531, _1753);
    float _1759 = fma(_1655, _1529, _1755);
    float _1761 = _1651 + _1757;
    float _1763 = fma(_1667, _1531, _1759);
    float _1765 = _1761 * _1751;
    float _1767 = _1673 + _1763;
    bool _1769 = _1765 >= 0.0;
    float _1771 = _1767 * _1751;
    bool _1773 = _1765 <= 1.0;
    bool _1775 = _1773 && _1769;
    bool _1777 = _1771 >= 0.0;
    bool _1779 = _1777 && _1775;
    bool _1781 = _1771 <= 1.0;
    bool _1783 = _1781 && _1779;
    float _1785 = _1679 * _1689;
    float _1787 = fma(_1683, _1529, _1785);
    if (_1783)
    {
        float _1789 = float(_1599);
        _1735 = _1789;
    }
    float _1791 = _1735;
    float _1793 = fma(_1695, _1531, _1787);
    float _1795 = _1791;
    if (_1783)
    {
        float _1797 = rint(_1791);
        float _1799 = precise::max(_1797, 0.0);
        uint _1801 = uint(_1799);
        uint _1803 = clamp(_1801, 0u, 65535u);
        _1795 = as_type<float>(_1803);
    }
    float _1805 = _1795;
    float _1807 = _1701 + _1793;
    float _1809 = _1807 * _1751;
    float _1811 = _1771;
    if (_1783)
    {
        float3 _4848 = float3(_1765, _1771, float(as_type<int>(_1805)));
        float3 _4852 = select(_4848, float3(0.0), isnan(_4848));
        float _1813 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4852.xy, uint(rint(_4852.z)), _1809, level(0.0));
        _1811 = _1813;
    }
    float _1815 = _1811;
    float _1817 = _1679 * _1713;
    float _1819 = fma(_1711, _1529, _1817);
    float _1821 = fma(_1715, _1531, _1819);
    float _1823 = _1717 + _1821;
    float _1825 = trunc(_1823);
    int _1827 = int(_1825);
    bool _1829 = _1739 <= _1727;
    bool _1831 = !_1731;
    bool _1833 = _1829 || _1831;
    int _1835 = ~as_type<int>(_1729);
    int _1837 = _1827 + _1835;
    int _1839 = _1837 + 1;
    bool _1841 = _1839 < 0;
    bool _1843 = _1841 || _1833;
    int _1845 = as_type<int>(_1819);
    float _1847 = as_type<float>(_1827);
    if (!_1843)
    {
        float _1849 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        _1845 = as_type<int>(_1849);
    }
    int _1851 = _1845;
    bool _1853 = _1851 <= _1839;
    bool _1855 = _1853 || _1843;
    if (_1855)
    {
        _1847 = 1.0;
    }
    float _1857 = _1847;
    float _1859 = _1857;
    if (!_1855)
    {
        float _1861 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[500]);
        int _1863 = _1839 * as_type<int>(_1861);
        int _1865 = _1863 + _1727;
        int _1867 = _1865 << 2;
        uint _1869 = uint(int(uint(_1865) >> uint(2)));
        int _1871 = 12 & _1867;
        int _1873 = int(_1869) << 4;
        int _1875 = _1873 + _1871;
        int _1877 = _1875 + 400;
        uint _1879 = uint(int(uint(_1877) >> uint(2)));
        float _1881 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1879)]);
        float _1883 = floor(_1823);
        float _1885 = floor(_1709);
        float _1887 = -_1883;
        float _1889 = _1823 + _1887;
        float _1891 = -_1885;
        float _1893 = _1709 + _1891;
        float _1895 = rint(_1881);
        float _1897 = precise::max(_1895, 0.0);
        uint _1899 = uint(_1897);
        uint _1901 = clamp(_1899, 0u, 65535u);
        float3 _4987 = float3(_1893, _1889, float(int(_1901)));
        float3 _4989 = select(_4987, float3(0.0), isnan(_4987));
        float _1903 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4989.xy, uint(rint(_4989.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4989.xy, uint(rint(_4989.z)), level(0.0)).x;
        int _1905 = _1865 << 4;
        int _1907 = _1905 + 2048;
        uint _1909 = uint(int(uint(_1907) >> uint(2)));
        float _1911 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1909)]);
        int _1913 = _1907 + 4;
        uint _1915 = uint(int(uint(_1913) >> uint(2)));
        float _1917 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1915)]);
        int _1919 = _1907 + 8;
        uint _1921 = uint(int(uint(_1919) >> uint(2)));
        float _1923 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1921)]);
        int _1925 = _1907 + 12;
        uint _1927 = uint(int(uint(_1925) >> uint(2)));
        float _1929 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1927)]);
        float _1931 = _1679 * _1917;
        float _1933 = fma(_1911, _1529, _1931);
        float _1935 = fma(_1923, _1531, _1933);
        float _1937 = _1929 + _1935;
        float _1939 = precise::clamp(_1937, 0.0, 1.0);
        float _1941 = -_1939;
        float _1943 = _1941 + _1903;
        float _1945 = fma(_1943, 500.0, 1.5);
        float _1947 = exp2(_1945);
        float _1949 = 0.0 + _1947;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1593 = 500.0;
        _1859 = _1951;
    }
    float _1953 = _1593;
    float _1955 = _1859;
    uint _1957 = uint(int(uint(_161) >> uint(2)));
    float _1959 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1957)]);
    float _1961 = _1953;
    if (!_1783)
    {
        _1961 = 1.0;
    }
    float _1963 = _1961;
    bool _1965 = _905 > 0.001000000047497451305389404296875;
    bool _1967 = isnan(_905);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.001000000047497451305389404296875);
    bool _1973 = _1969 || _1971;
    float _1975 = -_177;
    float _1977 = _1975 + _1115;
    float _1979 = _1963;
    if (_1783)
    {
        bool _1981 = _1815 >= _1809;
        bool _1983 = isnan(_1815);
        bool _1985 = _1981 || _1983;
        bool _1987 = isnan(_1809);
        bool _1989 = _1985 || _1987;
        float _1991 = float(_1989);
        _1979 = _1991;
    }
    float _1993 = _1979;
    int _1995 = _161 + 8;
    float _1997 = -_1993;
    float _1999 = fma(_1997, _1955, 1.0);
    float _2001 = -_1959;
    float _2003 = _1999 + _2001;
    float _2005 = _1999;
    if (_1973)
    {
        float _2007 = fma(_2003, 0.0500000007450580596923828125, _1959);
        _2005 = _2007;
    }
    float _2009 = _2005;
    int _2011 = _161 + 4;
    float _2013 = -_171;
    float _2015 = _2013 + _1091;
    float _2017 = precise::max(0.0, _2009);
    float _2019 = precise::min(_2017, 0.999000012874603271484375);
    float _2021 = -_165;
    float _2023 = _2021 + _1113;
    uint _2025 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_2025)] = as_type<uint>(_2019);
    uint _2027 = uint(int(uint(_183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2027)] = uint(_1167);
    uint _2029 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2029)] = as_type<uint>(_1113);
    uint _2031 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2031)] = as_type<uint>(_1091);
    uint _2033 = uint(int(uint(_1995) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2033)] = as_type<uint>(_1115);
    uint _2035 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2035)] = as_type<uint>(_1117);
    uint _2037 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2037)] = as_type<uint>(_1119);
    uint _2039 = uint(int(uint(_1995) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2039)] = as_type<uint>(_1121);
    uint _2041 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2041)] = as_type<uint>(_2023);
    uint _2043 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2043)] = as_type<uint>(_2015);
    uint _2045 = uint(int(uint(_1995) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2045)] = as_type<uint>(_1977);
    float _2047 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2049 = _2015 * _2015;
    float _2051 = _1119 * _1119;
    float _2053 = fma(_2023, _2023, _2049);
    float _2055 = fma(_1117, _1117, _2051);
    float _2057 = fma(_1977, _1977, _2053);
    float _2059 = fma(_1121, _1121, _2055);
    float _2061 = sqrt(_2059);
    float _2063 = sqrt(_2057);
    bool _2065 = _2063 >= 9.9999999747524270787835121154785e-07;
    bool _2067 = isnan(_2063);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(9.9999999747524270787835121154785e-07);
    bool _2073 = _2069 || _2071;
    if (!_2073)
    {
        bool _2075 = _669 != _283;
        bool _2077 = isnan(_669);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan(_283);
        bool _2083 = _2079 || _2081;
        _2085 = _2083;
        if (!_2085)
        {
            float _2087 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2089 = _2087 > 0.0;
            bool _2091 = !_2089;
            if (!_2091)
            {
                float _2093 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2095 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2097 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2099 = _2095 * _523;
                float _2101 = _2095 * _525;
                float _2103 = _2095 * _529;
                float _2105 = fma(_2093, _527, _2099);
                float _2107 = fma(_2093, _531, _2101);
                float _2109 = fma(_2093, _535, _2103);
                float _2111 = fma(_2097, _533, _2105);
                float _2113 = fma(_2097, _537, _2107);
                float _2115 = fma(_2097, _539, _2109);
                float _2117 = _2111 * _2111;
                float _2119 = fma(_2113, _2113, _2117);
                float _2121 = fma(_2115, _2115, _2119);
                float _2123 = rsqrt(_2121);
                float _2125 = _2123 * 9.9999999747524270787835121154785e-07;
                float _2127 = _2113 * _2125;
                float _2129 = _2111 * _2125;
                float _2131 = _2115 * _2125;
                _335 = as_type<int>(_2127);
                _337 = as_type<int>(_2129);
                _339 = as_type<int>(_2131);
                _2085 = true;
            }
            else
            {
                bool _2133 = _2061 >= 9.9999999747524270787835121154785e-07;
                bool _2135 = isnan(_2061);
                bool _2137 = _2133 || _2135;
                bool _2139 = isnan(9.9999999747524270787835121154785e-07);
                bool _2141 = _2137 || _2139;
                if (!_2141)
                {
                    float _2143 = _1091 * _1091;
                    float _2145 = fma(_1113, _1113, _2143);
                    float _2147 = fma(_1115, _1115, _2145);
                    float _2149 = sqrt(_2147);
                    bool _2151 = _2149 >= 9.9999999747524270787835121154785e-07;
                    bool _2153 = isnan(_2149);
                    bool _2155 = _2151 || _2153;
                    bool _2157 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2159 = _2155 || _2157;
                    float _2161 = _2149;
                    if (_2159)
                    {
                        float _2163 = rsqrt(_2147);
                        _2161 = _2163;
                    }
                    float _2165 = _2161;
                    if (!_2159)
                    {
                        _323 = 0;
                    }
                    int _2167 = _323;
                    int _2169 = _2167;
                    if (!_2159)
                    {
                        _325 = 897988541;
                    }
                    int _2171 = _325;
                    int _2173 = _2171;
                    if (!_2159)
                    {
                        _327 = 0;
                    }
                    int _2175 = _327;
                    float _2177 = _2165;
                    int _2179 = _2175;
                    if (_2159)
                    {
                        float _2181 = _2165 * 9.9999999747524270787835121154785e-07;
                        _2177 = _2181;
                    }
                    float _2183 = _2177;
                    if (_2159)
                    {
                        float _2185 = _1113 * _2183;
                        _2169 = as_type<int>(_2185);
                    }
                    int _2187 = _2169;
                    _335 = _2187;
                    if (_2159)
                    {
                        float _2189 = _1091 * _2183;
                        _2173 = as_type<int>(_2189);
                    }
                    int _2191 = _2173;
                    _337 = _2191;
                    if (_2159)
                    {
                        float _2193 = _1115 * _2183;
                        _2179 = as_type<int>(_2193);
                    }
                    int _2195 = _2179;
                    _339 = _2195;
                    _2085 = true;
                }
                else
                {
                    float _2197 = rsqrt(_2059);
                    float _2199 = _2197 * 9.9999999747524270787835121154785e-07;
                    float _2201 = _1117 * _2199;
                    float _2203 = _1119 * _2199;
                    float _2205 = _1121 * _2199;
                    _335 = as_type<int>(_2201);
                    _337 = as_type<int>(_2203);
                    _339 = as_type<int>(_2205);
                    _2085 = true;
                }
            }
        }
    }
    else
    {
        float _2207 = _2061 * _2047;
        bool _2209 = _2207 >= 0.001000000047497451305389404296875;
        bool _2211 = isnan(_2207);
        bool _2213 = _2209 || _2211;
        bool _2215 = isnan(0.001000000047497451305389404296875);
        bool _2217 = _2213 || _2215;
        bool _2219 = _2207 > 0.0;
        bool _2221 = !_2217;
        bool _2223 = _2219 && _2221;
        bool _2225 = _2063 < 0.001000000047497451305389404296875;
        bool _2227 = _2225 && _2223;
        if (!_2227)
        {
            _329 = as_type<int>(_2023);
        }
        int _2229 = _329;
        int _2231 = _2229;
        if (_2227)
        {
            float _2233 = _2047 * _1117;
            _2231 = as_type<int>(_2233);
        }
        int _2235 = _2231;
        _335 = _2235;
        if (!_2227)
        {
            _331 = as_type<int>(_2015);
        }
        int _2237 = _331;
        int _2239 = _2237;
        if (_2227)
        {
            float _2241 = _2047 * _1119;
            _2239 = as_type<int>(_2241);
        }
        int _2243 = _2239;
        _337 = _2243;
        if (!_2227)
        {
            _333 = as_type<int>(_1977);
        }
        int _2245 = _333;
        _339 = _2245;
        if (_2227)
        {
            float _2247 = _2047 * _1121;
            _339 = as_type<int>(_2247);
        }
    }
    _2085 = false;
    int _2249 = _335;
    int _2251 = _337;
    int _2253 = _339;
    uint _2255 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2255)] = uint(_2249);
    uint _2257 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2257)] = uint(_2251);
    uint _2259 = uint(int(uint(_1995) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2259)] = uint(_2253);
}

