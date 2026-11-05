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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = gl_FragCoord.x;
    float _50 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _52 = _48 / _50;
    float _54 = gl_FragCoord.y;
    float _56 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _58 = _54 / _56;
    float _60 = 1.0 / _46;
    float _62 = _52 * _60;
    float _64 = _58 * _60;
    float _66 = _62 * 0.001953125;
    float _68 = _64 * 0.001953125;
    float2 _1411 = float2(_66, _68);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1411, float2(0.0), isnan(_1411)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1411, float2(0.0), isnan(_1411)), level(0.0)).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    bool _80 = 0 < as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
    int _83 = (-1) + as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
    int _85 = _83 + 1;
    bool _87 = _85 > 3;
    bool _89 = _87 && _80;
    float2 _1442 = float2(_74, _76);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1442, float2(0.0), isnan(_1442)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1442, float2(0.0), isnan(_1442)), level(0.0)).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float _102 = 0.0;
    int _104 = 0;
    int _106 = 0;
    if (_89)
    {
        float3 _1459 = float3(0.0);
        float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1459, float3(0.0), isnan(_1459))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1459, float3(0.0), isnan(_1459))).x;
        _102 = _108;
    }
    float _110 = _102;
    float _112 = _100 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _116 = _100 + _114;
    float _118 = _96 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _120 = _98 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _122 = precise::min(_112, _116);
    float _124 = _94 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _126 = precise::max(0.0, _122);
    bool _128 = !_80;
    float _130 = _124;
    float _132 = _118;
    float _134 = _120;
    float _136 = _124;
    float _138 = _118;
    float _140 = _120;
    float _142 = _124;
    float _144 = _118;
    float _146 = _120;
    if (!_128)
    {
        bool _148 = !_87;
        int _150 = -1;
        if (!_148)
        {
            int _152 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x) + (-3);
            _150 = 0;
            bool _154;
            do
            {
                int _156 = _104;
                float _158 = _130;
                float _160 = _132;
                float _162 = _134;
                int _164 = _156 * 48;
                int _166 = _156 * 48;
                int _168 = _166 + 48;
                int _170 = _164 + 24;
                uint _173 = uint(int(uint(_170) >> uint(2)));
                uint _175 = uint(int(uint(int(_173)) >> uint(2)));
                int _177 = int(_173) & 3;
                float _179 = (*spvDescriptorSet0.fp_c4)._m0[int(_175)][_177];
                int _181 = int(_173) + 1;
                uint _183 = uint(int(uint(_181) >> uint(2)));
                int _185 = _181 & 3;
                float _187 = (*spvDescriptorSet0.fp_c4)._m0[int(_183)][_185];
                int _189 = _168 + 24;
                uint _191 = uint(int(uint(_189) >> uint(2)));
                uint _193 = uint(int(uint(int(_191)) >> uint(2)));
                int _195 = int(_191) & 3;
                float _197 = (*spvDescriptorSet0.fp_c4)._m0[int(_193)][_195];
                int _199 = int(_191) + 1;
                uint _201 = uint(int(uint(_199) >> uint(2)));
                int _203 = _199 & 3;
                float _205 = (*spvDescriptorSet0.fp_c4)._m0[int(_201)][_203];
                int _207 = _168 + 16;
                uint _209 = uint(int(uint(_207) >> uint(2)));
                uint _211 = uint(int(uint(int(_209)) >> uint(2)));
                int _213 = int(_209) & 3;
                float _215 = (*spvDescriptorSet0.fp_c4)._m0[int(_211)][_213];
                int _217 = int(_209) + 1;
                uint _219 = uint(int(uint(_217) >> uint(2)));
                int _221 = _217 & 3;
                float _223 = (*spvDescriptorSet0.fp_c4)._m0[int(_219)][_221];
                int _225 = _168 + 72;
                uint _227 = uint(int(uint(_225) >> uint(2)));
                uint _229 = uint(int(uint(int(_227)) >> uint(2)));
                int _231 = int(_227) & 3;
                float _233 = (*spvDescriptorSet0.fp_c4)._m0[int(_229)][_231];
                int _235 = int(_227) + 1;
                uint _237 = uint(int(uint(_235) >> uint(2)));
                int _239 = _235 & 3;
                float _241 = (*spvDescriptorSet0.fp_c4)._m0[int(_237)][_239];
                float _243 = _205 * 6.0;
                float _245 = _197 * 6.0;
                float _247 = _243 * _243;
                float _249 = fma(_245, _245, _247);
                float _251 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _253 = _223 + _251;
                int _255 = _168 + 64;
                uint _257 = uint(int(uint(_255) >> uint(2)));
                uint _259 = uint(int(uint(int(_257)) >> uint(2)));
                int _261 = int(_257) & 3;
                float _263 = (*spvDescriptorSet0.fp_c4)._m0[int(_259)][_261];
                int _265 = int(_257) + 1;
                uint _267 = uint(int(uint(_265) >> uint(2)));
                int _269 = _265 & 3;
                float _271 = (*spvDescriptorSet0.fp_c4)._m0[int(_267)][_269];
                float _273 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
                float _275 = _215 + _273;
                float _277 = rsqrt(_249);
                float _279 = fma(_253, -2.0, _243);
                float _281 = fma(_275, -2.0, _245);
                float _283 = _241 * 6.0;
                float _285 = _64 + _279;
                int _287 = _168 + 120;
                uint _289 = uint(int(uint(_287) >> uint(2)));
                uint _291 = uint(int(uint(int(_289)) >> uint(2)));
                int _293 = int(_289) & 3;
                float _295 = (*spvDescriptorSet0.fp_c4)._m0[int(_291)][_293];
                int _297 = int(_289) + 1;
                uint _299 = uint(int(uint(_297) >> uint(2)));
                int _301 = _297 & 3;
                float _303 = (*spvDescriptorSet0.fp_c4)._m0[int(_299)][_301];
                float _305 = _233 * 6.0;
                float _307 = _283 * _283;
                float _309 = _62 + _281;
                float _311 = _187 * 6.0;
                float _313 = sqrt(_249);
                float _315 = fma(_305, _305, _307);
                float _317 = _311 * _311;
                float _319 = _243 * _277;
                float _321 = _245 * _277;
                float _323 = _179 * 6.0;
                float _325 = rsqrt(_315);
                float _327 = _319 * _285;
                float _329 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
                float _331 = _263 + _329;
                float _333 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _335 = _271 + _333;
                float _337 = fma(_321, _309, _327);
                int _339 = _164 + 16;
                uint _341 = uint(int(uint(_339) >> uint(2)));
                uint _343 = uint(int(uint(int(_341)) >> uint(2)));
                int _345 = int(_341) & 3;
                float _347 = (*spvDescriptorSet0.fp_c4)._m0[int(_343)][_345];
                int _349 = int(_341) + 1;
                uint _351 = uint(int(uint(_349) >> uint(2)));
                int _353 = _349 & 3;
                float _355 = (*spvDescriptorSet0.fp_c4)._m0[int(_351)][_353];
                float _357 = fma(_323, _323, _317);
                float _359 = fma(_335, -2.0, _283);
                float _361 = -_319;
                float _363 = fma(_361, _337, _285);
                float _365 = fma(_331, -2.0, _305);
                float _367 = _295 * 6.0;
                float _369 = _303 * 6.0;
                float _371 = _64 + _359;
                int _373 = _168 + 112;
                uint _375 = uint(int(uint(_373) >> uint(2)));
                uint _377 = uint(int(uint(int(_375)) >> uint(2)));
                int _379 = int(_375) & 3;
                float _381 = (*spvDescriptorSet0.fp_c4)._m0[int(_377)][_379];
                int _383 = int(_375) + 1;
                uint _385 = uint(int(uint(_383) >> uint(2)));
                int _387 = _383 & 3;
                float _389 = (*spvDescriptorSet0.fp_c4)._m0[int(_385)][_387];
                float _391 = _62 + _365;
                float _393 = _283 * _325;
                float _395 = _369 * _369;
                float _397 = rsqrt(_357);
                float _399 = _305 * _325;
                float _401 = _393 * _371;
                float _403 = fma(_367, _367, _395);
                float _405 = -_321;
                float _407 = fma(_405, _337, _309);
                float _409 = _363 * _363;
                float _411 = fma(_399, _391, _401);
                float _413 = _277 * _337;
                float _415 = sqrt(_357);
                bool _417 = _337 >= _313;
                bool _419 = isnan(_337);
                bool _421 = _417 || _419;
                bool _423 = isnan(_313);
                bool _425 = _421 || _423;
                float _427 = -_393;
                float _429 = fma(_427, _411, _371);
                float _431 = -_399;
                float _433 = fma(_431, _411, _391);
                float _435 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _437 = _355 + _435;
                float _439 = _325 * _411;
                float _441 = _429 * _429;
                bool _443 = _337 > 0.0;
                bool _445 = !_425;
                bool _447 = _443 && _445;
                float _449 = rsqrt(_403);
                float _451 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
                float _453 = _347 + _451;
                float _455 = fma(_407, _407, _409);
                float _457 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
                float _459 = _389 + _457;
                float _461 = fma(_453, -2.0, _323);
                float _463 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
                float _465 = _381 + _463;
                float _467 = fma(_437, -2.0, _311);
                float _469 = fma(_459, -2.0, _369);
                float _471 = _62 + _461;
                float _473 = fma(_465, -2.0, _367);
                float _475 = _64 + _467;
                float _477 = sqrt(_315);
                float _479 = _311 * _397;
                float _481 = _64 + _469;
                float _483 = _323 * _397;
                float _485 = _367 * _449;
                float _487 = _479 * _475;
                float _489 = _369 * _449;
                float _491 = _62 + _473;
                float _493 = sqrt(_455);
                float _495 = fma(_433, _433, _441);
                float _497 = fma(_483, _471, _487);
                float _499 = _489 * _481;
                float _501 = -_479;
                float _503 = fma(_501, _497, _475);
                float _505 = -_483;
                float _507 = fma(_505, _497, _471);
                float _509 = sqrt(_495);
                float _511 = _503 * _503;
                bool _513 = _411 >= _477;
                bool _515 = isnan(_411);
                bool _517 = _513 || _515;
                bool _519 = isnan(_477);
                bool _521 = _517 || _519;
                float _523 = fma(_485, _491, _499);
                bool _525 = _497 >= _415;
                bool _527 = isnan(_497);
                bool _529 = _525 || _527;
                bool _531 = isnan(_415);
                bool _533 = _529 || _531;
                float _535 = fma(_413, -2.0, 4.0);
                float _537 = fma(_439, -2.0, 4.0);
                float _539 = fma(_507, _507, _511);
                bool _541 = _411 > 0.0;
                bool _543 = !_521;
                bool _545 = _541 && _543;
                float _547 = -_489;
                float _549 = fma(_547, _523, _481);
                bool _551 = _493 < _535;
                bool _553 = _551 && _447;
                float _555 = -_485;
                float _557 = fma(_555, _523, _491);
                float _559 = sqrt(_403);
                float _561 = _549 * _549;
                bool _563 = _497 > 0.0;
                bool _565 = !_533;
                bool _567 = _563 && _565;
                bool _569 = _509 < _537;
                bool _571 = _569 && _545;
                float _573 = fma(_557, _557, _561);
                float _575 = _397 * _497;
                float _577 = _449 * _523;
                float _579 = sqrt(_539);
                float _581 = fma(_575, -2.0, 4.0);
                float _583 = _413;
                float _585 = _493;
                float _587 = _415;
                float _589 = _160;
                float _591 = _162;
                float _593 = _523;
                float _595 = _158;
                if (_553)
                {
                    int _597 = _168 + 44;
                    uint _599 = uint(int(uint(_597) >> uint(2)));
                    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
                    int _603 = int(_599) & 3;
                    float _605 = (*spvDescriptorSet0.fp_c4)._m0[int(_601)][_603];
                    _583 = _605;
                }
                float _607 = _583;
                float _609 = fma(_577, -2.0, 4.0);
                if (_553)
                {
                    float _611 = -_493;
                    float _613 = _611 + _535;
                    _585 = _613;
                }
                float _615 = _585;
                float _617 = sqrt(_573);
                bool _619 = _523 >= _559;
                bool _621 = isnan(_523);
                bool _623 = _619 || _621;
                bool _625 = isnan(_559);
                bool _627 = _623 || _625;
                float _629 = _559;
                if (_571)
                {
                    float _631 = -_509;
                    float _633 = _631 + _537;
                    _587 = _633;
                }
                float _635 = _587;
                float _637 = _575;
                if (_571)
                {
                    int _639 = _168 + 92;
                    uint _641 = uint(int(uint(_639) >> uint(2)));
                    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
                    int _645 = int(_641) & 3;
                    float _647 = (*spvDescriptorSet0.fp_c4)._m0[int(_643)][_645];
                    _637 = _647;
                }
                float _649 = _637;
                if (_553)
                {
                    float _651 = _110 * _615;
                    float _653 = _651 * 0.5;
                    _629 = _653;
                }
                float _655 = _629;
                bool _657 = _523 > 0.0;
                bool _659 = !_627;
                bool _661 = _657 && _659;
                bool _663 = _579 < _581;
                bool _665 = _663 && _567;
                float _667 = _439;
                float _669 = _655;
                float _671 = _579;
                if (_553)
                {
                    float _673 = 1.0 / _535;
                    _667 = _673;
                }
                float _675 = _667;
                bool _677 = _617 < _609;
                bool _679 = _677 && _661;
                float _681 = _561;
                if (_571)
                {
                    float _683 = 1.0 / _537;
                    _681 = _683;
                }
                float _685 = _681;
                bool _687 = !_665;
                float _689 = _685;
                if (!_687)
                {
                    float _691 = -_579;
                    float _693 = _691 + _581;
                    int _695 = _156 * 48;
                    int _697 = _695 + 44;
                    float _699 = _110 * _693;
                    float _701 = _699 * 0.5;
                    float _703 = 1.0 / _581;
                    uint _705 = uint(int(uint(_697) >> uint(2)));
                    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
                    int _709 = int(_705) & 3;
                    float _711 = (*spvDescriptorSet0.fp_c4)._m0[int(_707)][_709];
                    float _713 = _701 * _703;
                    float _715 = fma(_713, _711, _158);
                    float _717 = fma(_713, _711, _160);
                    float _719 = fma(_713, _711, _162);
                    _589 = _717;
                    _591 = _719;
                    _593 = _713;
                    _595 = _715;
                }
                float _721 = _589;
                float _723 = _591;
                float _725 = _593;
                float _727 = _595;
                float _729 = as_type<float>(_168);
                float _731 = _721;
                float _733 = _723;
                float _735 = _727;
                if (_679)
                {
                    int _737 = _168 + 140;
                    uint _739 = uint(int(uint(_737) >> uint(2)));
                    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
                    int _743 = int(_739) & 3;
                    float _745 = (*spvDescriptorSet0.fp_c4)._m0[int(_741)][_743];
                    _729 = _745;
                }
                float _747 = _729;
                float _749 = _725;
                if (_679)
                {
                    float _751 = 1.0 / _609;
                    _749 = _751;
                }
                float _753 = _749;
                if (_553)
                {
                    float _755 = _655 * _675;
                    _669 = _755;
                }
                float _757 = _669;
                float _759 = _727;
                if (_571)
                {
                    float _761 = _110 * _635;
                    float _763 = _761 * 0.5;
                    _671 = _763;
                }
                float _765 = _671;
                int _767 = _156 + 4;
                _104 = _767;
                _106 = _767;
                if (_553)
                {
                    float _769 = fma(_757, _607, _721);
                    _731 = _769;
                }
                float _771 = _731;
                float _773 = _771;
                if (_553)
                {
                    float _775 = fma(_757, _607, _723);
                    _733 = _775;
                }
                float _777 = _733;
                float _779 = _777;
                if (_553)
                {
                    float _781 = fma(_757, _607, _727);
                    _759 = _781;
                }
                float _783 = _759;
                bool _785 = _767 >= _152;
                float _787 = _783;
                if (_679)
                {
                    float _789 = -_617;
                    float _791 = _789 + _609;
                    _735 = _791;
                }
                float _793 = _735;
                float _795 = _793;
                if (_571)
                {
                    float _797 = _765 * _685;
                    _689 = _797;
                }
                float _799 = _689;
                if (_679)
                {
                    float _801 = _110 * _793;
                    float _803 = _801 * 0.5;
                    _795 = _803;
                }
                float _805 = _795;
                if (_571)
                {
                    float _807 = fma(_799, _649, _783);
                    _787 = _807;
                }
                float _809 = _787;
                if (_571)
                {
                    float _811 = fma(_799, _649, _771);
                    _773 = _811;
                }
                float _813 = _773;
                float _815 = _813;
                if (_571)
                {
                    float _817 = fma(_799, _649, _777);
                    _779 = _817;
                }
                float _819 = _779;
                float _821 = _753;
                float _823 = _819;
                if (_679)
                {
                    float _825 = _805 * _753;
                    _821 = _825;
                }
                float _827 = _821;
                float _829 = _809;
                if (_679)
                {
                    float _831 = fma(_827, _747, _813);
                    _815 = _831;
                }
                float _833 = _815;
                _132 = _833;
                _138 = _833;
                if (_679)
                {
                    float _835 = fma(_827, _747, _809);
                    _829 = _835;
                }
                float _837 = _829;
                _130 = _837;
                _136 = _837;
                if (_679)
                {
                    float _839 = fma(_827, _747, _819);
                    _823 = _839;
                }
                float _841 = _823;
                _154 = !_785;
                _134 = _841;
                _140 = _841;
            } while (_154);
        }
        int _843 = _106;
        float _845 = _136;
        float _847 = _138;
        float _849 = _140;
        int _851 = _150;
        int _853 = ~_843;
        int _855 = _853 + as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
        int _857 = _855 + 1;
        bool _859 = _857 > 1;
        bool _861 = !_859;
        float _863 = _847;
        float _865 = _849;
        int _867 = _843;
        int _869 = _851;
        float _871 = _845;
        float _873 = _847;
        float _875 = _849;
        if (!_861)
        {
            int _877 = _843 * 48;
            int _879 = _877 + 24;
            uint _881 = uint(int(uint(_879) >> uint(2)));
            uint _883 = uint(int(uint(int(_881)) >> uint(2)));
            int _885 = int(_881) & 3;
            float _887 = (*spvDescriptorSet0.fp_c4)._m0[int(_883)][_885];
            int _889 = int(_881) + 1;
            uint _891 = uint(int(uint(_889) >> uint(2)));
            int _893 = _889 & 3;
            float _895 = (*spvDescriptorSet0.fp_c4)._m0[int(_891)][_893];
            int _897 = _843 * 48;
            int _899 = _897 + 48;
            int _901 = _899 + 24;
            uint _903 = uint(int(uint(_901) >> uint(2)));
            uint _905 = uint(int(uint(int(_903)) >> uint(2)));
            int _907 = int(_903) & 3;
            float _909 = (*spvDescriptorSet0.fp_c4)._m0[int(_905)][_907];
            int _911 = int(_903) + 1;
            uint _913 = uint(int(uint(_911) >> uint(2)));
            int _915 = _911 & 3;
            float _917 = (*spvDescriptorSet0.fp_c4)._m0[int(_913)][_915];
            int _919 = _877 + 16;
            uint _921 = uint(int(uint(_919) >> uint(2)));
            uint _923 = uint(int(uint(int(_921)) >> uint(2)));
            int _925 = int(_921) & 3;
            float _927 = (*spvDescriptorSet0.fp_c4)._m0[int(_923)][_925];
            int _929 = int(_921) + 1;
            uint _931 = uint(int(uint(_929) >> uint(2)));
            int _933 = _929 & 3;
            float _935 = (*spvDescriptorSet0.fp_c4)._m0[int(_931)][_933];
            float _937 = _895 * 6.0;
            int _939 = _899 + 16;
            uint _941 = uint(int(uint(_939) >> uint(2)));
            uint _943 = uint(int(uint(int(_941)) >> uint(2)));
            int _945 = int(_941) & 3;
            float _947 = (*spvDescriptorSet0.fp_c4)._m0[int(_943)][_945];
            int _949 = int(_941) + 1;
            uint _951 = uint(int(uint(_949) >> uint(2)));
            int _953 = _949 & 3;
            float _955 = (*spvDescriptorSet0.fp_c4)._m0[int(_951)][_953];
            float _957 = _887 * 6.0;
            float _959 = _937 * _937;
            float _961 = _917 * 6.0;
            float _963 = fma(_957, _957, _959);
            float _965 = _909 * 6.0;
            float _967 = _961 * _961;
            float _969 = rsqrt(_963);
            float _971 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _973 = _935 + _971;
            float _975 = fma(_965, _965, _967);
            float _977 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
            float _979 = _927 + _977;
            float _981 = fma(_973, -2.0, _937);
            float _983 = rsqrt(_975);
            float _985 = fma(_979, -2.0, _957);
            float _987 = _64 + _981;
            float _989 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
            float _991 = _947 + _989;
            float _993 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _995 = _955 + _993;
            float _997 = _62 + _985;
            float _999 = _937 * _969;
            float _1001 = fma(_995, -2.0, _961);
            float _1003 = _957 * _969;
            float _1005 = fma(_991, -2.0, _965);
            float _1007 = _999 * _987;
            float _1009 = _64 + _1001;
            float _1011 = sqrt(_963);
            float _1013 = _62 + _1005;
            float _1015 = fma(_1003, _997, _1007);
            float _1017 = _961 * _983;
            float _1019 = _965 * _983;
            float _1021 = -_999;
            float _1023 = fma(_1021, _1015, _987);
            float _1025 = -_1003;
            float _1027 = fma(_1025, _1015, _997);
            float _1029 = _1017 * _1009;
            float _1031 = sqrt(_975);
            float _1033 = _1023 * _1023;
            float _1035 = _969 * _1015;
            float _1037 = fma(_1019, _1013, _1029);
            float _1039 = fma(_1027, _1027, _1033);
            float _1041 = -_1017;
            float _1043 = fma(_1041, _1037, _1009);
            float _1045 = -_1019;
            float _1047 = fma(_1045, _1037, _1013);
            float _1049 = _983 * _1037;
            float _1051 = sqrt(_1039);
            float _1053 = _1043 * _1043;
            bool _1055 = _1015 >= _1011;
            bool _1057 = isnan(_1015);
            bool _1059 = _1055 || _1057;
            bool _1061 = isnan(_1011);
            bool _1063 = _1059 || _1061;
            float _1065 = fma(_1047, _1047, _1053);
            float _1067 = fma(_1035, -2.0, 4.0);
            bool _1069 = _1015 > 0.0;
            bool _1071 = !_1063;
            bool _1073 = _1069 && _1071;
            float _1075 = fma(_1049, -2.0, 4.0);
            bool _1077 = _1037 >= _1031;
            bool _1079 = isnan(_1037);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan(_1031);
            bool _1085 = _1081 || _1083;
            float _1087 = sqrt(_1065);
            int _1089 = _843 + 1;
            bool _1091 = _1037 > 0.0;
            bool _1093 = !_1085;
            bool _1095 = _1091 && _1093;
            bool _1097 = _1051 < _1067;
            bool _1099 = _1097 && _1073;
            bool _1101 = _1087 < _1075;
            bool _1103 = _1101 && _1095;
            float _1105 = _1049;
            _869 = 0;
            if (!_1099)
            {
                _1105 = _845;
            }
            float _1107 = _1105;
            bool _1109 = !_1099;
            float _1111 = _1107;
            if (!_1109)
            {
                float3 _2944 = float3(0.0);
                float _1113 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2944, float3(0.0), isnan(_2944))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2944, float3(0.0), isnan(_2944))).x;
                float _1115 = -_1051;
                float _1117 = _1115 + _1067;
                int _1119 = _843 * 48;
                int _1121 = _1119 + 44;
                float _1123 = 1.0 / _1067;
                uint _1125 = uint(int(uint(_1121) >> uint(2)));
                uint _1127 = uint(int(uint(int(_1125)) >> uint(2)));
                int _1129 = int(_1125) & 3;
                float _1131 = (*spvDescriptorSet0.fp_c4)._m0[int(_1127)][_1129];
                float _1133 = _1113 * _1117;
                float _1135 = _1133 * 0.5;
                float _1137 = _1135 * _1123;
                float _1139 = fma(_1137, _1131, _845);
                float _1141 = fma(_1137, _1131, _847);
                float _1143 = fma(_1137, _1131, _849);
                _1111 = _1139;
                _863 = _1141;
                _865 = _1143;
            }
            float _1145 = _1111;
            float _1147 = _863;
            float _1149 = _865;
            int _1151 = _1089 + 1;
            bool _1153 = !_1103;
            float _1155 = _1145;
            float _1157 = _1147;
            float _1159 = _1149;
            _867 = _1151;
            if (!_1153)
            {
                float3 _3014 = float3(0.0);
                float _1161 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3014, float3(0.0), isnan(_3014))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3014, float3(0.0), isnan(_3014))).x;
                int _1163 = _899 + 44;
                uint _1165 = uint(int(uint(_1163) >> uint(2)));
                uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
                int _1169 = int(_1165) & 3;
                float _1171 = (*spvDescriptorSet0.fp_c4)._m0[int(_1167)][_1169];
                float _1173 = 1.0 / _1075;
                float _1175 = -_1087;
                float _1177 = _1175 + _1075;
                float _1179 = _1161 * _1177;
                float _1181 = _1179 * 0.5;
                float _1183 = _1181 * _1173;
                float _1185 = fma(_1183, _1171, _1145);
                float _1187 = fma(_1183, _1171, _1147);
                float _1189 = fma(_1183, _1171, _1149);
                _1155 = _1185;
                _1157 = _1187;
                _1159 = _1189;
            }
            float _1191 = _1155;
            float _1193 = _1157;
            float _1195 = _1159;
            _871 = _1191;
            _873 = _1193;
            _875 = _1195;
        }
        int _1197 = _867;
        int _1199 = _869;
        float _1201 = _871;
        float _1203 = _873;
        float _1205 = _875;
        bool _1207 = _1197 < as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
        int _1209 = (_1207 ? (-1) : 0) | _1199;
        int _1211 = ~_1209;
        _142 = _1201;
        _144 = _1203;
        _146 = _1205;
        if (!(_1211 != 0))
        {
            int _1213 = _1197 * 48;
            int _1215 = _1213 + 24;
            uint _1217 = uint(int(uint(_1215) >> uint(2)));
            uint _1219 = uint(int(uint(int(_1217)) >> uint(2)));
            int _1221 = int(_1217) & 3;
            float _1223 = (*spvDescriptorSet0.fp_c4)._m0[int(_1219)][_1221];
            int _1225 = int(_1217) + 1;
            uint _1227 = uint(int(uint(_1225) >> uint(2)));
            int _1229 = _1225 & 3;
            float _1231 = (*spvDescriptorSet0.fp_c4)._m0[int(_1227)][_1229];
            int _1233 = _1213 + 16;
            uint _1235 = uint(int(uint(_1233) >> uint(2)));
            uint _1237 = uint(int(uint(int(_1235)) >> uint(2)));
            int _1239 = int(_1235) & 3;
            float _1241 = (*spvDescriptorSet0.fp_c4)._m0[int(_1237)][_1239];
            int _1243 = int(_1235) + 1;
            uint _1245 = uint(int(uint(_1243) >> uint(2)));
            int _1247 = _1243 & 3;
            float _1249 = (*spvDescriptorSet0.fp_c4)._m0[int(_1245)][_1247];
            float _1251 = _1231 * 6.0;
            float _1253 = _1223 * 6.0;
            float _1255 = _1251 * _1251;
            float _1257 = fma(_1253, _1253, _1255);
            float _1259 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _1261 = _1249 + _1259;
            float _1263 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
            float _1265 = _1241 + _1263;
            float _1267 = rsqrt(_1257);
            float _1269 = fma(_1261, -2.0, _1251);
            float _1271 = fma(_1265, -2.0, _1253);
            float _1273 = _64 + _1269;
            float _1275 = _62 + _1271;
            float _1277 = sqrt(_1257);
            float _1279 = _1251 * _1267;
            float _1281 = _1253 * _1267;
            float _1283 = _1279 * _1273;
            float _1285 = fma(_1281, _1275, _1283);
            float _1287 = -_1279;
            float _1289 = fma(_1287, _1285, _1273);
            float _1291 = -_1281;
            float _1293 = fma(_1291, _1285, _1275);
            float _1295 = _1285 * _1267;
            float _1297 = _1289 * _1289;
            bool _1299 = _1285 >= _1277;
            bool _1301 = isnan(_1285);
            bool _1303 = _1299 || _1301;
            bool _1305 = isnan(_1277);
            bool _1307 = _1303 || _1305;
            float _1309 = fma(_1293, _1293, _1297);
            float _1311 = fma(_1295, -2.0, 4.0);
            bool _1313 = _1285 > 0.0;
            bool _1315 = !_1307;
            bool _1317 = _1313 && _1315;
            float _1319 = sqrt(_1309);
            bool _1321 = _1319 < _1311;
            bool _1323 = _1321 && _1317;
            bool _1325 = !_1323;
            if (!_1325)
            {
                float3 _3269 = float3(0.0);
                float _1327 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3269, float3(0.0), isnan(_3269))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3269, float3(0.0), isnan(_3269))).x;
                float _1329 = -_1319;
                float _1331 = _1329 + _1311;
                int _1333 = _1197 * 48;
                int _1335 = _1333 + 44;
                float _1337 = 1.0 / _1311;
                uint _1339 = uint(int(uint(_1335) >> uint(2)));
                uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
                int _1343 = int(_1339) & 3;
                float _1345 = (*spvDescriptorSet0.fp_c4)._m0[int(_1341)][_1343];
                float _1347 = _1331 * _1327;
                float _1349 = _1347 * 0.5;
                float _1351 = _1349 * _1337;
                float _1353 = fma(_1351, _1345, _1201);
                float _1355 = fma(_1351, _1345, _1203);
                float _1357 = fma(_1351, _1345, _1205);
                _142 = _1353;
                _144 = _1355;
                _146 = _1357;
            }
        }
    }
    float _1359 = _142;
    float _1361 = _144;
    float _1363 = _146;
    float _1365 = precise::max(0.0, _1359);
    float _1367 = precise::max(0.0, _1361);
    float _1369 = precise::max(0.0, _1363);
    float _1371 = precise::max(0.0, _126);
    out.m_39.x = _1365;
    out.m_39.y = _1367;
    out.m_39.z = _1369;
    out.m_39.w = _1371;
    return out;
}

