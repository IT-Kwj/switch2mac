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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _5220, thread const int& _5221, constant _10& support_buffer)
{
    int _5224 = 1 + _5221;
    float _5226 = support_buffer._m5[_5224].x;
    float _5228 = abs(_5226);
    bool _5230 = _5228 == 1.0;
    if (_5230)
    {
        return _5220;
    }
    float _5232 = float(_5220);
    float _5234 = _5232 / _5228;
    int _5236 = int(_5234);
    return _5236;
}

static inline __attribute__((always_inline))
int _44(thread const int& _5258, thread const int& _5259, thread const int& _5260, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5263 = 1 + _5259;
    float _5265 = support_buffer._m5[_5263].x;
    bool _5267 = _5265 == 1.0;
    if (_5267)
    {
        return _5258;
    }
    bool _5269 = _5265 < 0.0;
    if (_5269)
    {
        float _5271 = -_5265;
        float _5273 = float(_5258);
        float _5275 = _5273 * _5271;
        float _5277 = gl_FragCoord.x;
        float _5279 = gl_FragCoord.y;
        float _5281 = (_5260 != 0) ? _5279 : _5277;
        float _5283 = mod(_5281, _5271);
        float _5285 = _5275 + _5283;
        int _5287 = int(_5285);
        return _5287;
    }
    float _5289 = float(_5258);
    float _5291 = _5289 * _5265;
    int _5293 = int(_5291);
    return _5293;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2261 = false;
    bool _947 = false;
    bool _1829 = false;
    bool _1727 = false;
    bool _1617 = false;
    int _47 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _49 = _47;
    int _51 = 0;
    int _53 = _42(_49, _51, (*spvDescriptorSet0.support_buffer));
    int _55 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _57 = _55;
    int _59 = 0;
    int _61 = _42(_57, _59, (*spvDescriptorSet0.support_buffer));
    float _64 = gl_FragCoord.w;
    float _66 = in.m_33.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_33.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float _84 = float(_61);
    float _86 = float(_53);
    float _88 = fma(_82, _84, -0.4999000132083892822265625);
    float _90 = fma(_80, _86, -0.4999000132083892822265625);
    float _92 = floor(_88);
    int _94 = int(_92);
    float _96 = floor(_90);
    int _98 = int(_96);
    int _100 = _94 + 1;
    int _102 = _98 + 1;
    int _104 = _98;
    int _106 = 1;
    int _108 = 0;
    int _110 = _44(_104, _106, _108, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _112 = _94;
    int _114 = 1;
    int _116 = 1;
    int _118 = _44(_112, _114, _116, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _120 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_110, _118)), 0).x;
    int _122 = _98;
    int _124 = 1;
    int _126 = 0;
    int _128 = _44(_122, _124, _126, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _130 = _100;
    int _132 = 1;
    int _134 = 1;
    int _136 = _44(_130, _132, _134, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _138 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_128, _136)), 0).x;
    int _140 = _102;
    int _142 = 1;
    int _144 = 0;
    int _146 = _44(_140, _142, _144, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _148 = _100;
    int _150 = 1;
    int _152 = 1;
    int _154 = _44(_148, _150, _152, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _156 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_146, _154)), 0).x;
    int _158 = _102;
    int _160 = 1;
    int _162 = 0;
    int _164 = _44(_158, _160, _162, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _166 = _94;
    int _168 = 1;
    int _170 = 1;
    int _172 = _44(_166, _168, _170, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _174 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_164, _172)), 0).x;
    int _176 = _98;
    int _178 = 0;
    int _180 = 0;
    int _182 = _44(_176, _178, _180, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _184 = _94;
    int _186 = 0;
    int _188 = 1;
    int _190 = _44(_184, _186, _188, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _193 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_182, _190)), 0).xyzw;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = _193.w;
    int _203 = _98;
    int _205 = 0;
    int _207 = 0;
    int _209 = _44(_203, _205, _207, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _211 = _100;
    int _213 = 0;
    int _215 = 1;
    int _217 = _44(_211, _213, _215, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _219 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_209, _217)), 0).xyzw;
    float _221 = _219.x;
    float _223 = _219.y;
    float _225 = _219.z;
    float _227 = _219.w;
    int _229 = _102;
    int _231 = 0;
    int _233 = 0;
    int _235 = _44(_229, _231, _233, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _237 = _100;
    int _239 = 0;
    int _241 = 1;
    int _243 = _44(_237, _239, _241, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _245 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_235, _243)), 0).xyzw;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = _245.z;
    float _253 = _245.w;
    int _255 = _102;
    int _257 = 0;
    int _259 = 0;
    int _261 = _44(_255, _257, _259, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _263 = _94;
    int _265 = 0;
    int _267 = 1;
    int _269 = _44(_263, _265, _267, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _271 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_261, _269)), 0).xyzw;
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = _271.z;
    float _279 = _271.w;
    float _281 = floor(_90);
    float _283 = float(_94);
    float _285 = _283 + 0.5;
    float _287 = floor(_88);
    float _289 = 1.0 / _84;
    float _291 = -_281;
    float _293 = _90 + _291;
    float _295 = 1.0 / _86;
    float _297 = -_287;
    float _299 = _88 + _297;
    float _301 = float(_98);
    float _303 = -_293;
    float _305 = _303 + 1.0;
    float _307 = float(_100);
    float _309 = -_299;
    float _311 = _309 + 1.0;
    float _313 = float(_102);
    float _315 = _293 * _299;
    float _317 = _299 * _305;
    float _319 = _305 * _311;
    float _321 = _293 * _311;
    float _323 = _307 + 0.5;
    float _325 = _301 + 0.5;
    float _327 = _313 + 0.5;
    float _329 = _285 * _289;
    float _331 = _323 * _289;
    float _333 = _325 * _295;
    float _335 = _327 * _295;
    int _337 = 0;
    float _339 = 0.0;
    float _341 = _305;
    int _343 = 0;
    float _345 = 0.0;
    float _347 = _327;
    float _349 = _295;
    float _351 = 0.0;
    float _353 = 0.0;
    float _355 = 0.0;
    float _357 = 0.0;
    float _359 = 0.0;
    float _361 = 0.0;
    float _363 = 0.0;
    float _365 = 0.0;
    float _367 = 0.0;
    float _369 = 0.0;
    float _371 = 0.0;
    float _939;
    float _941;
    float _943;
    float _945;
    float _1611;
    float _1613;
    float _1615;
    float _1723;
    float _1725;
    float _1827;
    float _2237;
    float _2243;
    float _2249;
    float _2259;
    do
    {
        int _373 = _337;
        float _375 = _339;
        float _377 = _341;
        int _379 = _343;
        float _381 = _345;
        float _383 = _347;
        float _385 = _349;
        float _387 = _351;
        float _389 = _353;
        float _391 = _355;
        float _393 = _357;
        float _395 = _359;
        float _397 = _361;
        float _399 = _363;
        float _401 = _365;
        float _403 = _367;
        float _405 = _369;
        float _407 = _371;
        int _409 = _373 << 3;
        int _411 = _373 << 4;
        bool _415 = _409 == 8;
        bool _417 = 0 == _409;
        bool _419 = _411 == 0;
        bool _421 = _409 == 16;
        int _423 = _373 << 2;
        bool _425 = _411 == 16;
        bool _427 = _423 == 0;
        bool _429 = _409 == 24;
        bool _431 = _423 == 4;
        float _433 = _385;
        float _435 = _383;
        float _437 = _377;
        float _439 = _381;
        int _441 = _379;
        float _443 = _375;
        float _445 = _387;
        float _447 = _389;
        float _449 = _399;
        float _451 = _391;
        float _453 = _393;
        float _455 = _395;
        float _457 = _391;
        float _459 = _391;
        float _461 = _393;
        float _463 = _395;
        float _465 = _397;
        if (_417)
        {
            _433 = _329;
        }
        float _467 = _433;
        bool _469 = _423 == 8;
        float _471 = _467;
        if (_417)
        {
            _435 = _333;
        }
        float _473 = _435;
        bool _475 = _411 == 32;
        float _477 = _473;
        if (_415)
        {
            _471 = _331;
        }
        float _479 = _471;
        int _481 = _427 ? 64 : 0;
        float _483 = _479;
        if (_415)
        {
            _477 = _333;
        }
        float _485 = _477;
        float _487 = _485;
        if (_419)
        {
            _437 = _195;
        }
        float _489 = _437;
        float _491 = _489;
        if (_421)
        {
            _483 = _331;
        }
        float _493 = _483;
        bool _495 = _411 == 48;
        float _497 = _493;
        if (_421)
        {
            _487 = _335;
        }
        float _499 = _487;
        float _501 = _499;
        if (_419)
        {
            _439 = _199;
        }
        float _503 = _439;
        bool _505 = _423 == 12;
        float _507 = _503;
        if (_419)
        {
            _441 = as_type<int>(_197);
        }
        int _509 = _441;
        int _511 = _509;
        if (_425)
        {
            _511 = as_type<int>(_223);
        }
        int _513 = _511;
        int _515 = _513;
        if (_427)
        {
            _443 = _120;
        }
        float _517 = _443;
        float _519 = _517;
        if (_425)
        {
            _491 = _221;
        }
        float _521 = _491;
        float _523 = _521;
        if (_425)
        {
            _507 = _225;
        }
        float _525 = _507;
        float _527 = _525;
        if (_431)
        {
            _519 = _138;
        }
        float _529 = _519;
        float _531 = _529;
        if (_469)
        {
            _531 = _156;
        }
        float _533 = _531;
        float _535 = _533;
        if (_505)
        {
            _535 = _174;
        }
        float _537 = _535;
        float _539 = _537;
        if (_475)
        {
            _523 = _247;
        }
        float _541 = _523;
        float _543 = _541;
        if (_475)
        {
            _515 = as_type<int>(_249);
        }
        int _545 = _515;
        bool _547 = _537 >= 1.0;
        bool _549 = isnan(_537);
        bool _551 = _547 || _549;
        bool _553 = isnan(1.0);
        bool _555 = _551 || _553;
        int _557 = _545;
        if (_475)
        {
            _527 = _251;
        }
        float _559 = _527;
        float _561 = _559;
        if (_495)
        {
            _557 = as_type<int>(_275);
        }
        int _563 = _557;
        float _565 = as_type<float>(_563);
        if (_429)
        {
            _501 = _335;
        }
        float _567 = _501;
        float _569 = _567;
        if (_429)
        {
            _497 = _329;
        }
        float _571 = _497;
        float _573 = _571;
        if (_495)
        {
            _543 = _273;
        }
        float _575 = _543;
        float _577 = _575;
        if (_495)
        {
            _561 = _277;
        }
        float _579 = _561;
        float _581 = _579;
        if (_555)
        {
            _539 = _575;
        }
        float _583 = _539;
        float _585 = _583;
        float _587 = _583;
        if (_555)
        {
            _445 = as_type<float>(_563);
        }
        float _589 = _445;
        float _591 = _589;
        float _593 = _589;
        if (_555)
        {
            _447 = _579;
        }
        float _595 = _447;
        float _597 = _595;
        float _599 = _595;
        if (!_555)
        {
            bool _601 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _603 = isnan(0.0);
            bool _605 = _601 || _603;
            bool _607 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _609 = _605 || _607;
            if (!_609)
            {
                float _611 = _575 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _585 = _611;
            }
            float _613 = _585;
            _587 = _613;
            if (!_609)
            {
                float _615 = as_type<float>(_563) * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _591 = _615;
            }
            float _617 = _591;
            _593 = _617;
            if (!_609)
            {
                float _619 = _579 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _597 = _619;
            }
            float _621 = _597;
            bool _623 = !_609;
            _599 = _621;
            if (!_623)
            {
                float _625 = as_type<float>(_563) * 0.715200006961822509765625;
                float _627 = fma(_575, 0.2125999927520751953125, _625);
                float _629 = fma(_579, 0.072200000286102294921875, _627);
                float _631 = 1.0 / _629;
                float _633 = _631 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _635 = precise::clamp(_633, 0.0, 1.0);
                float _637 = fma(_635, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _639 = _575 * _637;
                float _641 = as_type<float>(_563) * _637;
                float _643 = _579 * _637;
                _587 = _639;
                _593 = _641;
                _599 = _643;
                _449 = _629;
            }
        }
        float _645 = _587;
        float _647 = _593;
        float _649 = _599;
        float _651 = _449;
        float _653 = _645;
        float _655 = _647;
        float _657 = _649;
        float _659 = _651;
        if (!_555)
        {
            float _661 = _567 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _663 = _571 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float2 _2902 = float2(_661, _663);
            float3 _667 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2902, float2(0.0), isnan(_2902))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2902, float2(0.0), isnan(_2902))).xyz;
            float _669 = _667.x;
            float _671 = _667.y;
            float _673 = _667.z;
            float _675 = _669 + _645;
            float _677 = _671 + _647;
            float _679 = _673 + _649;
            _653 = _675;
            _565 = _673;
            _655 = _677;
            _657 = _679;
            _569 = _669;
            _573 = _671;
        }
        float _681 = _653;
        int _683 = as_type<int>(_565);
        float _685 = _655;
        float _687 = _657;
        float _689 = _569;
        float _691 = _573;
        float _693 = _691;
        float _695 = _689;
        int _697 = _683;
        float _699 = _681;
        float _701 = _685;
        float _703 = _687;
        float _705 = _681;
        float _707 = _685;
        float _709 = _687;
        float _711 = _681;
        float _713 = _681;
        float _715 = _685;
        float _717 = _687;
        float _719 = _681;
        float _721 = _685;
        float _723 = _687;
        if (_555)
        {
            _577 = _681;
        }
        float _725 = _577;
        float _727 = _725;
        if (_555)
        {
            _693 = _685;
        }
        float _729 = _693;
        float _731 = _729;
        if (_555)
        {
            _695 = _687;
        }
        float _733 = _695;
        float _735 = _733;
        if (!_555)
        {
            bool _737 = _681 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _739 = isnan(_681);
            bool _741 = _737 || _739;
            bool _743 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _745 = _741 || _743;
            bool _747 = _685 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _749 = isnan(_685);
            bool _751 = _747 || _749;
            bool _753 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _755 = _751 || _753;
            float _757 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _759 = fma(_685, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _761 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _763 = _687 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _765 = isnan(_687);
            bool _767 = _763 || _765;
            bool _769 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _771 = _767 || _769;
            float _773 = exp2(_757);
            float _775 = exp2(_759);
            float _777 = exp2(_761);
            float _779 = -_773;
            float _781 = _779 + 1.0;
            bool _783 = !_745;
            float _785 = _783 ? _681 : _781;
            float _787 = -_775;
            float _789 = _787 + 1.0;
            bool _791 = !_755;
            float _793 = _791 ? _685 : _789;
            float _795 = -_777;
            float _797 = _795 + 1.0;
            bool _799 = !_771;
            float _801 = _799 ? _687 : _797;
            _727 = _785;
            _697 = as_type<int>(_781);
            _581 = _775;
            _735 = _801;
            _731 = _793;
            _659 = _777;
        }
        float _803 = _727;
        int _805 = _697;
        float _807 = _581;
        float _809 = _735;
        float _811 = _731;
        float _813 = _659;
        float _815 = _807;
        float _817 = _813;
        int _819 = _805;
        float _821 = _813;
        float _823 = _803;
        float _825 = _811;
        float _827 = _809;
        float _829 = _803;
        int _831 = _805;
        float _833 = _813;
        float _835 = _811;
        if (_555)
        {
            _815 = _809;
        }
        float _837 = _815;
        float _839 = _837;
        float _841 = _837;
        float _843 = _837;
        if (!_555)
        {
            bool _845 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _847 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _849 = _845 || _847;
            bool _851 = isnan(6.0);
            bool _853 = _849 || _851;
            if (!_853)
            {
                float _855 = -_803;
                float _857 = _855 + 1.0;
                float _859 = -_811;
                float _861 = _859 + 1.0;
                float _863 = -_809;
                float _865 = _863 + 1.0;
                float _867 = abs(_857);
                float _869 = log2(_867);
                float _871 = abs(_861);
                float _873 = log2(_871);
                float _875 = abs(_865);
                float _877 = log2(_875);
                float _879 = _869 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _881 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _883 = _873 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _885 = exp2(_879);
                float _887 = _877 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _889 = exp2(_883);
                float _891 = exp2(_887);
                float _893 = fma(_881, _885, 1.0);
                float _895 = fma(_881, _889, 1.0);
                float _897 = 1.0 / _893;
                float _899 = fma(_881, _891, 1.0);
                float _901 = 1.0 / _895;
                float _903 = 1.0 / _899;
                float _905 = _897 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _907 = _901 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _909 = precise::max(_905, _907);
                float _911 = _903 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _913 = precise::max(_911, _909);
                float _915 = -_905;
                float _917 = _915 + _913;
                float _919 = -_907;
                float _921 = _919 + _913;
                float _923 = -_911;
                float _925 = _923 + _913;
                float _927 = fma(_917, (*spvDescriptorSet0.fp_c3)._m0[6].w, _905);
                float _929 = fma(_921, (*spvDescriptorSet0.fp_c3)._m0[6].w, _907);
                float _931 = fma(_925, (*spvDescriptorSet0.fp_c3)._m0[6].w, _911);
                float _933 = _927 * _803;
                float _935 = _929 * _811;
                float _937 = _931 * _809;
                _713 = _931;
                _939 = _933;
                _715 = _901;
                _717 = _917;
                _941 = _935;
                _943 = _933;
                _945 = _937;
                _947 = true;
            }
            else
            {
                bool _949 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_949)
                {
                    _451 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _951 = _451;
                bool _953 = !_949;
                float _955 = _951;
                _457 = _951;
                if (!_953)
                {
                    float _957 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _959 = _80 + _957;
                    float _961 = abs(_959);
                    float _963 = _961 * 2560.0;
                    bool _965 = _963 >= 2.0;
                    bool _967 = isnan(_963);
                    bool _969 = _965 || _967;
                    bool _971 = isnan(2.0);
                    bool _973 = _969 || _971;
                    int _975 = as_type<int>(_963);
                    if (!_973)
                    {
                        _975 = 0;
                        _839 = 0.0;
                    }
                    int _977 = _975;
                    float _979 = _839;
                    int _981 = _977;
                    float _983 = _979;
                    _939 = as_type<float>(_977);
                    _941 = _979;
                    _943 = as_type<float>(_977);
                    if (!_973)
                    {
                        _817 = 0.0;
                    }
                    float _985 = _817;
                    bool _987 = !_973;
                    float _989 = _985;
                    _945 = _985;
                    _947 = _987;
                    if (!_947)
                    {
                        bool _991 = _80 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_991)
                        {
                            _981 = as_type<int>(_803);
                        }
                        int _993 = _981;
                        _819 = _993;
                        _939 = as_type<float>(_993);
                        _943 = as_type<float>(_993);
                        if (_991)
                        {
                            _983 = _811;
                        }
                        float _995 = _983;
                        _841 = _995;
                        _941 = _995;
                        if (_991)
                        {
                            _989 = _809;
                        }
                        float _997 = _989;
                        _821 = _997;
                        _945 = _997;
                        _947 = _991;
                        if (!_947)
                        {
                            float _999 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _955 = _999;
                        }
                    }
                }
                if (!_947)
                {
                    int _1001 = _819;
                    float _1003 = _955;
                    float _1005 = _841;
                    float _1007 = _821;
                    bool _1009 = _1003 != 0.0;
                    bool _1011 = isnan(_1003);
                    bool _1013 = _1009 || _1011;
                    bool _1015 = isnan(0.0);
                    bool _1017 = _1013 || _1015;
                    float _1019 = _1003;
                    int _1021 = _1001;
                    float _1023 = _1005;
                    float _1025 = _1007;
                    _457 = _1003;
                    if (!_1017)
                    {
                        float _1027 = _685 * 0.586600005626678466796875;
                        float _1029 = fma(_681, 0.29890000820159912109375, _1027);
                        float _1031 = fma(_687, 0.1143999993801116943359375, _1029);
                        float _1033 = _1031 * (-1.44269502162933349609375);
                        float _1035 = exp2(_1033);
                        float _1037 = -_1035;
                        float _1039 = _1037 + 1.0;
                        bool _1041 = _1039 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1043 = isnan(_1039);
                        bool _1045 = _1041 || _1043;
                        bool _1047 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1049 = _1045 || _1047;
                        float _1051 = _1031;
                        if (!_1049)
                        {
                            _1051 = _1039;
                        }
                        float _1053 = _1051;
                        bool _1055 = !_1049;
                        float _1057 = _1053;
                        if (!_1055)
                        {
                            float _1059 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1061 = _1039 + _1059;
                            float _1063 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1065 = spvFAdd(_1063, 1.00000095367431640625);
                            float _1067 = 1.0 / _1065;
                            float _1069 = _1061 * _1067;
                            float _1071 = -_1069;
                            float _1073 = _1071 + 1.0;
                            float _1075 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1077 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1075;
                            float _1079 = abs(_1073);
                            float _1081 = log2(_1079);
                            float _1083 = _1077 * _1067;
                            float _1085 = _1083 + (-1.0);
                            float _1087 = _1083 * _1069;
                            float _1089 = _1081 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1091 = exp2(_1089);
                            float _1093 = fma(_1085, _1091, 1.0);
                            float _1095 = 1.0 / _1093;
                            float _1097 = _1087 * _1095;
                            float _1099 = fma(_1065, _1097, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _1019 = _1067;
                            _1057 = _1099;
                        }
                        float _1101 = _1019;
                        float _1103 = _1057;
                        float _1105 = -_1039;
                        float _1107 = _1105 + _1103;
                        float _1109 = _811 * 0.586600005626678466796875;
                        float _1111 = _1107 + 1.0;
                        float _1113 = fma(_803, 0.29890000820159912109375, _1109);
                        float _1115 = fma(_809, 0.1143999993801116943359375, _1113);
                        float _1117 = abs(_1111);
                        float _1119 = log2(_1117);
                        float _1121 = spvFAdd(_1115, 9.9999999747524270787835121154785e-07);
                        float _1123 = 1.0 / _1121;
                        float _1125 = _1119 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1127 = exp2(_1125);
                        float _1129 = fma(_1123, _803, -1.0);
                        float _1131 = fma(_1123, _811, -1.0);
                        float _1133 = fma(_1123, _809, -1.0);
                        float _1135 = fma(_1127, _1129, 1.0);
                        float _1137 = fma(_1127, _1131, 1.0);
                        float _1139 = fma(_1127, _1133, 1.0);
                        float _1141 = _1135 * _1103;
                        float _1143 = _1137 * _1103;
                        float _1145 = _1139 * _1103;
                        float _1147 = precise::max(0.0, _1141);
                        float _1149 = precise::max(0.0, _1143);
                        float _1151 = precise::max(0.0, _1145);
                        float _1153 = precise::min(_1147, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1155 = precise::min(_1149, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1157 = precise::min(_1151, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _713 = _1121;
                        _939 = _1153;
                        _715 = _1123;
                        _717 = _1151;
                        _457 = _1101;
                        _941 = _1155;
                        _943 = _1153;
                        _945 = _1157;
                        _947 = true;
                    }
                    else
                    {
                        bool _1159 = _1003 != 1.0;
                        bool _1161 = isnan(_1003);
                        bool _1163 = _1159 || _1161;
                        bool _1165 = isnan(1.0);
                        bool _1167 = _1163 || _1165;
                        if (!_1167)
                        {
                            bool _1169 = _803 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1171 = isnan(_803);
                            bool _1173 = _1169 || _1171;
                            bool _1175 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1177 = _1173 || _1175;
                            float _1179 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1181 = spvFAdd(_1179, 1.00000095367431640625);
                            bool _1183 = _811 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1185 = isnan(_811);
                            bool _1187 = _1183 || _1185;
                            bool _1189 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1191 = _1187 || _1189;
                            bool _1193 = _809 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1195 = isnan(_809);
                            bool _1197 = _1193 || _1195;
                            bool _1199 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1201 = _1197 || _1199;
                            float _1203 = 1.0 / _1181;
                            float _1205 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1207 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1205;
                            float _1209 = _1207 * _1203;
                            bool _1211 = !_1177;
                            if (!_1211)
                            {
                                float _1213 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1215 = _803 + _1213;
                                float _1217 = _1209 + (-1.0);
                                float _1219 = _1215 * _1203;
                                float _1221 = -_1219;
                                float _1223 = _1221 + 1.0;
                                float _1225 = _1209 * _1219;
                                float _1227 = abs(_1223);
                                float _1229 = log2(_1227);
                                float _1231 = _1229 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1233 = exp2(_1231);
                                float _1235 = fma(_1217, _1233, 1.0);
                                float _1237 = 1.0 / _1235;
                                float _1239 = _1225 * _1237;
                                float _1241 = fma(_1181, _1239, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _699 = _1229;
                                _701 = _1233;
                                _703 = _1235;
                                _823 = _1241;
                            }
                            float _1243 = _699;
                            float _1245 = _701;
                            float _1247 = _703;
                            float _1249 = _823;
                            bool _1251 = !_1191;
                            float _1253 = _1243;
                            float _1255 = _1245;
                            float _1257 = _1247;
                            if (!_1251)
                            {
                                float _1259 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1261 = _811 + _1259;
                                float _1263 = _1209 + (-1.0);
                                float _1265 = _1261 * _1203;
                                float _1267 = -_1265;
                                float _1269 = _1267 + 1.0;
                                float _1271 = _1209 * _1265;
                                float _1273 = abs(_1269);
                                float _1275 = log2(_1273);
                                float _1277 = _1275 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1279 = exp2(_1277);
                                float _1281 = fma(_1263, _1279, 1.0);
                                float _1283 = 1.0 / _1281;
                                float _1285 = _1271 * _1283;
                                float _1287 = fma(_1181, _1285, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1253 = _1275;
                                _1255 = _1279;
                                _1257 = _1281;
                                _825 = _1287;
                            }
                            float _1289 = _1253;
                            float _1291 = _1255;
                            float _1293 = _1257;
                            float _1295 = _825;
                            bool _1297 = !_1201;
                            float _1299 = _1289;
                            float _1301 = _1291;
                            float _1303 = _1293;
                            if (!_1297)
                            {
                                float _1305 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1307 = _809 + _1305;
                                float _1309 = _1209 + (-1.0);
                                float _1311 = _1307 * _1203;
                                float _1313 = -_1311;
                                float _1315 = _1313 + 1.0;
                                float _1317 = _1209 * _1311;
                                float _1319 = abs(_1315);
                                float _1321 = log2(_1319);
                                float _1323 = _1321 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1325 = exp2(_1323);
                                float _1327 = fma(_1309, _1325, 1.0);
                                float _1329 = 1.0 / _1327;
                                float _1331 = _1317 * _1329;
                                float _1333 = fma(_1181, _1331, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1299 = _1321;
                                _1301 = _1325;
                                _1303 = _1327;
                                _827 = _1333;
                            }
                            float _1335 = _1299;
                            float _1337 = _1301;
                            float _1339 = _1303;
                            float _1341 = _827;
                            float _1343 = precise::max(0.0, _1341);
                            float _1345 = precise::max(0.0, _1249);
                            float _1347 = precise::max(0.0, _1295);
                            float _1349 = precise::min(_1343, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1351 = precise::min(_1345, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1353 = precise::min(_1347, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _713 = _1335;
                            _939 = _1351;
                            _715 = _1337;
                            _717 = _1339;
                            _941 = _1353;
                            _943 = _1351;
                            _945 = _1349;
                            _947 = true;
                        }
                        else
                        {
                            bool _1355 = _1003 != 2.0;
                            bool _1357 = isnan(_1003);
                            bool _1359 = _1355 || _1357;
                            bool _1361 = isnan(2.0);
                            bool _1363 = _1359 || _1361;
                            if (!_1363)
                            {
                                float _1365 = _811 * 0.715200006961822509765625;
                                float _1367 = fma(_803, 0.2125999927520751953125, _1365);
                                float _1369 = fma(_809, 0.072200000286102294921875, _1367);
                                float _1371 = spvFAdd(_1369, 9.9999999747524270787835121154785e-07);
                                bool _1373 = _1369 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1375 = isnan(_1369);
                                bool _1377 = _1373 || _1375;
                                bool _1379 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1381 = _1377 || _1379;
                                float _1383 = 1.0 / _1371;
                                bool _1385 = !_1381;
                                float _1387 = _1369;
                                if (!_1385)
                                {
                                    float _1389 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1391 = _1369 + _1389;
                                    float _1393 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1395 = spvFAdd(_1393, 1.00000095367431640625);
                                    float _1397 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1399 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1397;
                                    float _1401 = 1.0 / _1395;
                                    float _1403 = _1391 * _1401;
                                    float _1405 = _1399 * _1401;
                                    float _1407 = -_1403;
                                    float _1409 = _1407 + 1.0;
                                    float _1411 = _1405 + (-1.0);
                                    float _1413 = _1405 * _1403;
                                    float _1415 = abs(_1409);
                                    float _1417 = log2(_1415);
                                    float _1419 = _1417 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1421 = exp2(_1419);
                                    float _1423 = fma(_1411, _1421, 1.0);
                                    float _1425 = 1.0 / _1423;
                                    float _1427 = _1413 * _1425;
                                    float _1429 = fma(_1395, _1427, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _705 = _1421;
                                    _707 = _1425;
                                    _709 = _1401;
                                    _1387 = _1429;
                                }
                                float _1431 = _705;
                                float _1433 = _707;
                                float _1435 = _709;
                                float _1437 = _1387;
                                float _1439 = precise::max(0.0, _1437);
                                float _1441 = precise::min(_1439, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1443 = _1383 * _1441;
                                float _1445 = _803 * _1443;
                                float _1447 = _811 * _1443;
                                float _1449 = _809 * _1443;
                                float _1451 = precise::max(0.0, _1445);
                                float _1453 = precise::max(0.0, _1447);
                                float _1455 = precise::max(0.0, _1449);
                                float _1457 = precise::min(_1451, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1459 = precise::min(_1453, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1461 = precise::min(_1455, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _713 = _1431;
                                _939 = _1457;
                                _715 = _1433;
                                _717 = _1435;
                                _941 = _1459;
                                _943 = _1457;
                                _945 = _1461;
                                _947 = true;
                            }
                            else
                            {
                                bool _1463 = _1003 != 3.0;
                                bool _1465 = isnan(_1003);
                                bool _1467 = _1463 || _1465;
                                bool _1469 = isnan(3.0);
                                bool _1471 = _1467 || _1469;
                                if (!_1471)
                                {
                                    float _1473 = -_803;
                                    float _1475 = _1473 + 1.0;
                                    float _1477 = -_811;
                                    float _1479 = _1477 + 1.0;
                                    float _1481 = -_809;
                                    float _1483 = _1481 + 1.0;
                                    float _1485 = abs(_1475);
                                    float _1487 = log2(_1485);
                                    float _1489 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1491 = abs(_1479);
                                    float _1493 = log2(_1491);
                                    float _1495 = abs(_1483);
                                    float _1497 = log2(_1495);
                                    float _1499 = _1487 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1501 = _1493 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1503 = exp2(_1499);
                                    float _1505 = _1497 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1507 = exp2(_1501);
                                    float _1509 = exp2(_1505);
                                    float _1511 = fma(_1489, _1503, 1.0);
                                    float _1513 = fma(_1489, _1507, 1.0);
                                    float _1515 = 1.0 / _1511;
                                    float _1517 = fma(_1489, _1509, 1.0);
                                    float _1519 = 1.0 / _1513;
                                    float _1521 = 1.0 / _1517;
                                    float _1523 = _1515 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1525 = _1515 + _1519;
                                    float _1527 = _1519 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1529 = _1521 + _1525;
                                    float _1531 = _1521 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1533 = precise::max(_1523, _1527);
                                    float _1535 = _1529 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1537 = precise::max(_1531, _1533);
                                    float _1539 = _1535 * 0.3333333432674407958984375;
                                    float _1541 = -_1539;
                                    float _1543 = _1537 + _1541;
                                    float _1545 = fma(_1543, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1539);
                                    float _1547 = -_1523;
                                    float _1549 = _1547 + _1545;
                                    float _1551 = -_1527;
                                    float _1553 = _1551 + _1545;
                                    float _1555 = -_1531;
                                    float _1557 = _1555 + _1545;
                                    float _1559 = fma(_1549, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1523);
                                    float _1561 = fma(_1553, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1527);
                                    float _1563 = fma(_1557, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1531);
                                    float _1565 = _1559 * _803;
                                    float _1567 = _1561 * _811;
                                    float _1569 = _1563 * _809;
                                    _713 = _1515;
                                    _939 = _1565;
                                    _715 = _1531;
                                    _717 = _1523;
                                    _457 = _1537;
                                    _941 = _1567;
                                    _943 = _1565;
                                    _945 = _1569;
                                    _947 = true;
                                }
                                else
                                {
                                    bool _1571 = _1003 != 4.0;
                                    bool _1573 = isnan(_1003);
                                    bool _1575 = _1571 || _1573;
                                    bool _1577 = isnan(4.0);
                                    bool _1579 = _1575 || _1577;
                                    if (!_1579)
                                    {
                                        bool _1581 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1583 = isnan(0.0);
                                        bool _1585 = _1581 || _1583;
                                        bool _1587 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1589 = _1585 || _1587;
                                        if (!_1589)
                                        {
                                            float _1591 = -_803;
                                            float _1593 = _1591 + 1.0;
                                            float _1595 = abs(_1593);
                                            float _1597 = log2(_1595);
                                            float _1599 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1601 = _1597 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1603 = exp2(_1601);
                                            float _1605 = fma(_1599, _1603, 1.0);
                                            float _1607 = 1.0 / _1605;
                                            float _1609 = _1607 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1611 = _1601;
                                            _1613 = _1607;
                                            _1615 = _1609;
                                            _1617 = true;
                                        }
                                        else
                                        {
                                            float _1619 = spvFAdd(_803, 9.9999999747524270787835121154785e-07);
                                            bool _1621 = _803 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1623 = isnan(_803);
                                            bool _1625 = _1621 || _1623;
                                            bool _1627 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1629 = _1625 || _1627;
                                            float _1631 = 1.0 / _1619;
                                            if (!_1629)
                                            {
                                                _453 = _803;
                                            }
                                            float _1633 = _453;
                                            bool _1635 = !_1629;
                                            float _1637 = _1633;
                                            if (!_1635)
                                            {
                                                float _1639 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1641 = _803 + _1639;
                                                float _1643 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1645 = spvFAdd(_1643, 1.00000095367431640625);
                                                float _1647 = 1.0 / _1645;
                                                float _1649 = _1641 * _1647;
                                                float _1651 = -_1649;
                                                float _1653 = _1651 + 1.0;
                                                float _1655 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1657 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1655;
                                                float _1659 = abs(_1653);
                                                float _1661 = log2(_1659);
                                                float _1663 = _1657 * _1647;
                                                float _1665 = _1663 + (-1.0);
                                                float _1667 = _1663 * _1649;
                                                float _1669 = _1661 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1671 = exp2(_1669);
                                                float _1673 = fma(_1665, _1671, 1.0);
                                                float _1675 = 1.0 / _1673;
                                                float _1677 = _1667 * _1675;
                                                float _1679 = fma(_1645, _1677, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1637 = _1679;
                                                _455 = _1677;
                                                _711 = _1675;
                                            }
                                            float _1681 = _1637;
                                            float _1683 = _455;
                                            float _1685 = _711;
                                            float _1687 = precise::max(0.0, _1681);
                                            float _1689 = precise::min(_1687, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1691 = _1689 * _1631;
                                            _1611 = _1683;
                                            _1613 = _1685;
                                            _1615 = _1691;
                                        }
                                        _1617 = false;
                                        float _1693 = _1611;
                                        float _1695 = _1613;
                                        float _1697 = _1615;
                                        float _1699 = _1693;
                                        float _1701 = _1695;
                                        if (!_1589)
                                        {
                                            float _1703 = -_811;
                                            float _1705 = _1703 + 1.0;
                                            float _1707 = abs(_1705);
                                            float _1709 = log2(_1707);
                                            float _1711 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1713 = _1709 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1715 = exp2(_1713);
                                            float _1717 = fma(_1711, _1715, 1.0);
                                            float _1719 = 1.0 / _1717;
                                            float _1721 = _1719 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1723 = _1713;
                                            _1725 = _1721;
                                            _1727 = true;
                                        }
                                        else
                                        {
                                            float _1729 = spvFAdd(_811, 9.9999999747524270787835121154785e-07);
                                            bool _1731 = _811 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1733 = isnan(_811);
                                            bool _1735 = _1731 || _1733;
                                            bool _1737 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1739 = _1735 || _1737;
                                            float _1741 = 1.0 / _1729;
                                            if (!_1739)
                                            {
                                                _1699 = _811;
                                            }
                                            float _1743 = _1699;
                                            bool _1745 = !_1739;
                                            float _1747 = _1743;
                                            if (!_1745)
                                            {
                                                float _1749 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1751 = _811 + _1749;
                                                float _1753 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1755 = spvFAdd(_1753, 1.00000095367431640625);
                                                float _1757 = 1.0 / _1755;
                                                float _1759 = _1751 * _1757;
                                                float _1761 = -_1759;
                                                float _1763 = _1761 + 1.0;
                                                float _1765 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1767 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1765;
                                                float _1769 = abs(_1763);
                                                float _1771 = log2(_1769);
                                                float _1773 = _1767 * _1757;
                                                float _1775 = _1773 + (-1.0);
                                                float _1777 = _1773 * _1759;
                                                float _1779 = _1771 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1781 = exp2(_1779);
                                                float _1783 = fma(_1775, _1781, 1.0);
                                                float _1785 = 1.0 / _1783;
                                                float _1787 = _1777 * _1785;
                                                float _1789 = fma(_1755, _1787, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1747 = _1789;
                                                _1701 = _1787;
                                            }
                                            float _1791 = _1747;
                                            float _1793 = _1701;
                                            float _1795 = precise::max(0.0, _1791);
                                            float _1797 = precise::min(_1795, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1799 = _1797 * _1741;
                                            _1723 = _1793;
                                            _1725 = _1799;
                                        }
                                        _1727 = false;
                                        float _1801 = _1723;
                                        float _1803 = _1725;
                                        float _1805 = _1801;
                                        if (!_1589)
                                        {
                                            float _1807 = -_809;
                                            float _1809 = _1807 + 1.0;
                                            float _1811 = abs(_1809);
                                            float _1813 = log2(_1811);
                                            float _1815 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1817 = _1813 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1819 = exp2(_1817);
                                            float _1821 = fma(_1815, _1819, 1.0);
                                            float _1823 = 1.0 / _1821;
                                            float _1825 = _1823 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1827 = _1825;
                                            _1829 = true;
                                        }
                                        else
                                        {
                                            float _1831 = spvFAdd(_809, 9.9999999747524270787835121154785e-07);
                                            bool _1833 = _809 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1835 = isnan(_809);
                                            bool _1837 = _1833 || _1835;
                                            bool _1839 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1841 = _1837 || _1839;
                                            float _1843 = 1.0 / _1831;
                                            if (!_1841)
                                            {
                                                _1805 = _809;
                                            }
                                            float _1845 = _1805;
                                            bool _1847 = !_1841;
                                            float _1849 = _1845;
                                            if (!_1847)
                                            {
                                                float _1851 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1853 = _809 + _1851;
                                                float _1855 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1857 = spvFAdd(_1855, 1.00000095367431640625);
                                                float _1859 = 1.0 / _1857;
                                                float _1861 = _1853 * _1859;
                                                float _1863 = -_1861;
                                                float _1865 = _1863 + 1.0;
                                                float _1867 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1869 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1867;
                                                float _1871 = abs(_1865);
                                                float _1873 = log2(_1871);
                                                float _1875 = _1869 * _1859;
                                                float _1877 = _1875 + (-1.0);
                                                float _1879 = _1875 * _1861;
                                                float _1881 = _1873 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1883 = exp2(_1881);
                                                float _1885 = fma(_1877, _1883, 1.0);
                                                float _1887 = 1.0 / _1885;
                                                float _1889 = _1879 * _1887;
                                                float _1891 = fma(_1857, _1889, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1849 = _1891;
                                            }
                                            float _1893 = _1849;
                                            float _1895 = precise::max(0.0, _1893);
                                            float _1897 = precise::min(_1895, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1899 = _1897 * _1843;
                                            _1827 = _1899;
                                        }
                                        _1829 = false;
                                        float _1901 = _1827;
                                        float _1903 = precise::max(_1697, _1803);
                                        float _1905 = precise::max(_1903, _1901);
                                        float _1907 = -_1697;
                                        float _1909 = _1905 + _1907;
                                        float _1911 = -_1803;
                                        float _1913 = _1905 + _1911;
                                        float _1915 = -_1901;
                                        float _1917 = _1905 + _1915;
                                        float _1919 = fma(_1909, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1697);
                                        float _1921 = fma(_1913, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1803);
                                        float _1923 = fma(_1917, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1901);
                                        float _1925 = _1919 * _803;
                                        float _1927 = _1921 * _811;
                                        float _1929 = _1923 * _809;
                                        _713 = _1923;
                                        _939 = _1925;
                                        _715 = _1921;
                                        _717 = _1909;
                                        _941 = _1927;
                                        _943 = _1925;
                                        _945 = _1929;
                                        _947 = true;
                                    }
                                    else
                                    {
                                        bool _1931 = _1003 != 5.0;
                                        bool _1933 = isnan(_1003);
                                        bool _1935 = _1931 || _1933;
                                        bool _1937 = isnan(5.0);
                                        bool _1939 = _1935 || _1937;
                                        if (!_1939)
                                        {
                                            _1021 = as_type<int>(_681);
                                        }
                                        int _1941 = _1021;
                                        float _1943 = as_type<float>(_1941);
                                        _939 = as_type<float>(_1941);
                                        _943 = as_type<float>(_1941);
                                        if (!_1939)
                                        {
                                            _1023 = _685;
                                        }
                                        float _1945 = _1023;
                                        float _1947 = _1945;
                                        _941 = _1945;
                                        if (!_1939)
                                        {
                                            _1025 = _687;
                                        }
                                        float _1949 = _1025;
                                        bool _1951 = !_1939;
                                        float _1953 = _1949;
                                        _945 = _1949;
                                        if (!_1951)
                                        {
                                            bool _1955 = _1003 != 6.0;
                                            bool _1957 = isnan(_1003);
                                            bool _1959 = _1955 || _1957;
                                            bool _1961 = isnan(6.0);
                                            bool _1963 = _1959 || _1961;
                                            if (!_1963)
                                            {
                                                float _1965 = -_811;
                                                float _1967 = _1965 + 1.0;
                                                float _1969 = -_803;
                                                float _1971 = _1969 + 1.0;
                                                float _1973 = -_809;
                                                float _1975 = _1973 + 1.0;
                                                float _1977 = abs(_1967);
                                                float _1979 = log2(_1977);
                                                float _1981 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _1983 = abs(_1971);
                                                float _1985 = log2(_1983);
                                                float _1987 = abs(_1975);
                                                float _1989 = log2(_1987);
                                                float _1991 = _1979 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1993 = _1985 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1995 = exp2(_1991);
                                                float _1997 = _1989 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1999 = exp2(_1993);
                                                float _2001 = exp2(_1997);
                                                float _2003 = fma(_1981, _1995, 1.0);
                                                float _2005 = fma(_1981, _1999, 1.0);
                                                float _2007 = 1.0 / _2003;
                                                float _2009 = fma(_1981, _2001, 1.0);
                                                float _2011 = 1.0 / _2005;
                                                float _2013 = 1.0 / _2009;
                                                float _2015 = _2007 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2017 = _2011 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2019 = precise::max(_2017, _2015);
                                                float _2021 = _2013 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2023 = precise::max(_2021, _2019);
                                                float _2025 = -_2017;
                                                float _2027 = _2025 + _2023;
                                                float _2029 = -_2015;
                                                float _2031 = _2029 + _2023;
                                                float _2033 = -_2021;
                                                float _2035 = _2033 + _2023;
                                                float _2037 = fma(_2027, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2017);
                                                float _2039 = fma(_2031, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2015);
                                                float _2041 = fma(_2035, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2021);
                                                float _2043 = _2037 * _803;
                                                float _2045 = _2039 * _811;
                                                float _2047 = _2041 * _809;
                                                _713 = _2011;
                                                _939 = _2043;
                                                _715 = _2021;
                                                _717 = _2015;
                                                _457 = _2027;
                                                _941 = _2045;
                                                _943 = _2043;
                                                _945 = _2047;
                                                _947 = true;
                                            }
                                            else
                                            {
                                                bool _2049 = _1003 != 7.0;
                                                bool _2051 = isnan(_1003);
                                                bool _2053 = _2049 || _2051;
                                                bool _2055 = isnan(7.0);
                                                bool _2057 = _2053 || _2055;
                                                if (_2057)
                                                {
                                                    _1943 = _395;
                                                }
                                                int _2059 = as_type<int>(_1943);
                                                _939 = as_type<float>(_2059);
                                                _943 = as_type<float>(_2059);
                                                if (_2057)
                                                {
                                                    _1947 = _393;
                                                }
                                                float _2061 = _1947;
                                                _941 = _2061;
                                                if (_2057)
                                                {
                                                    _1953 = _397;
                                                }
                                                float _2063 = _1953;
                                                _945 = _2063;
                                                if (!_2057)
                                                {
                                                    float _2065 = -_811;
                                                    float _2067 = _2065 + 1.0;
                                                    float _2069 = -_803;
                                                    float _2071 = _2069 + 1.0;
                                                    float _2073 = -_809;
                                                    float _2075 = _2073 + 1.0;
                                                    float _2077 = abs(_2067);
                                                    float _2079 = log2(_2077);
                                                    float _2081 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2083 = abs(_2071);
                                                    float _2085 = log2(_2083);
                                                    float _2087 = abs(_2075);
                                                    float _2089 = log2(_2087);
                                                    float _2091 = _2079 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2093 = _2085 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2095 = exp2(_2091);
                                                    float _2097 = _2089 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2099 = exp2(_2093);
                                                    float _2101 = exp2(_2097);
                                                    float _2103 = fma(_2081, _2095, 1.0);
                                                    float _2105 = fma(_2081, _2099, 1.0);
                                                    float _2107 = 1.0 / _2103;
                                                    float _2109 = fma(_2081, _2101, 1.0);
                                                    float _2111 = 1.0 / _2105;
                                                    float _2113 = 1.0 / _2109;
                                                    float _2115 = _2107 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2117 = -_811;
                                                    float _2119 = fma(_2115, _811, _2117);
                                                    float _2121 = _2111 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2123 = -_803;
                                                    float _2125 = fma(_2121, _803, _2123);
                                                    float _2127 = _2113 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2129 = _2125 + _2119;
                                                    float _2131 = -_809;
                                                    float _2133 = fma(_2127, _809, _2131);
                                                    float _2135 = _2133 + _2129;
                                                    float _2137 = -_2125;
                                                    float _2139 = fma(_2135, 0.3333333432674407958984375, _2137);
                                                    float _2141 = -_2119;
                                                    float _2143 = fma(_2135, 0.3333333432674407958984375, _2141);
                                                    float _2145 = -_2133;
                                                    float _2147 = fma(_2135, 0.3333333432674407958984375, _2145);
                                                    float _2149 = fma(_2139, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2125);
                                                    float _2151 = fma(_2143, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2119);
                                                    float _2153 = fma(_2147, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2133);
                                                    float _2155 = _2149 + _803;
                                                    float _2157 = _2151 + _811;
                                                    float _2159 = _2153 + _809;
                                                    _713 = _2153;
                                                    _939 = _2155;
                                                    _715 = _2151;
                                                    _717 = _2139;
                                                    _941 = _2157;
                                                    _943 = _2155;
                                                    _945 = _2159;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _947 = false;
            float _2161 = _713;
            int _2163 = as_type<int>(_939);
            float _2165 = _715;
            float _2167 = _717;
            float _2169 = _457;
            float _2171 = _941;
            float _2173 = _943;
            float _2175 = _945;
            float _2177 = _2171 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2179 = _2173 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2181 = _2175 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _719 = _2161;
            _829 = _2179;
            _831 = _2163;
            _843 = _2181;
            _721 = _2165;
            _723 = _2167;
            _459 = _2169;
            _461 = _2171;
            _463 = _2173;
            _465 = _2175;
            _833 = _2175;
            _835 = _2177;
        }
        float _2183 = _719;
        float _2185 = _829;
        int _2187 = _831;
        float _2189 = _843;
        float _2191 = _721;
        float _2193 = _723;
        float _2195 = _459;
        float _2197 = _461;
        float _2199 = _463;
        float _2201 = _465;
        float _2203 = _833;
        float _2205 = _835;
        int _2207 = _495 ? 64 : 0;
        bool _2209 = _481 != 0;
        int _2211 = _373 + 1;
        bool _2213 = _2211 >= 4;
        bool _2215 = _2207 != 0;
        _337 = _2211;
        _341 = _2185;
        _343 = _2187;
        _345 = _2189;
        _353 = _2193;
        _355 = _2195;
        _357 = _2197;
        _359 = _2199;
        _361 = _2201;
        _363 = _2203;
        float _2217 = _2191;
        float _2219 = _2183;
        if (_2209)
        {
            _2217 = _319;
        }
        float _2221 = _2217;
        float _2223 = _2221;
        if (_431)
        {
            _2223 = _317;
        }
        float _2225 = _2223;
        float _2227 = _2225;
        if (_469)
        {
            _2227 = _315;
        }
        float _2229 = _2227;
        float _2231 = _2229;
        if (_505)
        {
            _2231 = _321;
        }
        float _2233 = _2231;
        _351 = _2233;
        if (_419)
        {
            _2219 = _201;
        }
        float _2235 = _2219;
        _2237 = fma(_2185, _2233, _401);
        _347 = _2237;
        float _2239 = _2235;
        if (_425)
        {
            _2239 = _227;
        }
        float _2241 = _2239;
        _2243 = fma(_2205, _2233, _403);
        _349 = _2243;
        float _2245 = _2241;
        if (_475)
        {
            _2245 = _253;
        }
        float _2247 = _2245;
        _2249 = fma(_2189, _2233, _405);
        _369 = _2249;
        float _2251 = _2247;
        float _2253 = _2247;
        if (_2215)
        {
            _2251 = _279;
            _2253 = _279;
        }
        float _2255 = _2251;
        float _2257 = _2253;
        _2259 = fma(_2233, _2257, _407);
        _339 = _2255;
        _365 = _2237;
        _367 = _2243;
        _371 = _2259;
        if (_2213)
        {
            _2261 = true;
            if (_2261)
            {
                break;
            }
        }
    } while (true);
    _2261 = false;
    out.m_36.x = _2237;
    out.m_36.y = _2243;
    out.m_36.z = _2249;
    out.m_36.w = _2259;
    return out;
}

