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
int _42(thread const int& _2992, thread const int& _2993, constant _10& support_buffer)
{
    int _2996 = 1 + _2993;
    float _2998 = support_buffer._m5[_2996].x;
    float _3000 = abs(_2998);
    bool _3002 = _3000 == 1.0;
    if (_3002)
    {
        return _2992;
    }
    float _3004 = float(_2992);
    float _3006 = _3004 / _3000;
    int _3008 = int(_3006);
    return _3008;
}

static inline __attribute__((always_inline))
int _44(thread const int& _3030, thread const int& _3031, thread const int& _3032, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _3035 = 1 + _3031;
    float _3037 = support_buffer._m5[_3035].x;
    bool _3039 = _3037 == 1.0;
    if (_3039)
    {
        return _3030;
    }
    bool _3041 = _3037 < 0.0;
    if (_3041)
    {
        float _3043 = -_3037;
        float _3045 = float(_3030);
        float _3047 = _3045 * _3043;
        float _3049 = gl_FragCoord.x;
        float _3051 = gl_FragCoord.y;
        float _3053 = (_3032 != 0) ? _3051 : _3049;
        float _3055 = mod(_3053, _3043);
        float _3057 = _3047 + _3055;
        int _3059 = int(_3057);
        return _3059;
    }
    float _3061 = float(_3030);
    float _3063 = _3061 * _3037;
    int _3065 = int(_3063);
    return _3065;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
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
    int _102 = _98;
    int _104 = 1;
    int _106 = 0;
    int _108 = _44(_102, _104, _106, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _110 = _94;
    int _112 = 1;
    int _114 = 1;
    int _116 = _44(_110, _112, _114, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _118 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_108, _116)), 0).x;
    int _120 = _98;
    int _122 = 1;
    int _124 = 0;
    int _126 = _44(_120, _122, _124, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _128 = _100;
    int _130 = 1;
    int _132 = 1;
    int _134 = _44(_128, _130, _132, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _136 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_126, _134)), 0).x;
    int _138 = _98 + 1;
    int _140 = _138;
    int _142 = 1;
    int _144 = 0;
    int _146 = _44(_140, _142, _144, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _148 = _100;
    int _150 = 1;
    int _152 = 1;
    int _154 = _44(_148, _150, _152, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _156 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_146, _154)), 0).x;
    int _158 = _138;
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
    int _229 = _138;
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
    int _255 = _138;
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
    float _285 = float(_98);
    float _287 = float(_100);
    float _289 = floor(_88);
    float _291 = 1.0 / _84;
    float _293 = 1.0 / _86;
    float _295 = float(_138);
    float _297 = -_281;
    float _299 = _90 + _297;
    float _301 = -_289;
    float _303 = _88 + _301;
    float _305 = _283 + 0.5;
    float _307 = _285 + 0.5;
    float _309 = _295 + 0.5;
    float _311 = -_299;
    float _313 = _311 + 1.0;
    float _315 = _287 + 0.5;
    float _317 = _305 * _291;
    float _319 = _299 * _303;
    float _321 = _315 * _291;
    float _323 = _307 * _293;
    float _325 = _309 * _293;
    bool _329 = _118 >= 1.0;
    bool _331 = isnan(_118);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.0);
    bool _337 = _333 || _335;
    float _339 = -_303;
    float _341 = _339 + 1.0;
    bool _343 = _136 >= 1.0;
    bool _345 = isnan(_136);
    bool _347 = _343 || _345;
    bool _349 = isnan(1.0);
    bool _351 = _347 || _349;
    float _353 = _303 * _313;
    float _355 = _313 * _341;
    bool _357 = _156 >= 1.0;
    bool _359 = isnan(_156);
    bool _361 = _357 || _359;
    bool _363 = isnan(1.0);
    bool _365 = _361 || _363;
    float _367 = _299 * _341;
    bool _369 = _174 >= 1.0;
    bool _371 = isnan(_174);
    bool _373 = _369 || _371;
    bool _375 = isnan(1.0);
    bool _377 = _373 || _375;
    float _379 = _156;
    float _381 = _174;
    float _383 = _136;
    float _385 = _299;
    float _387 = _195;
    float _389 = _197;
    float _391 = _199;
    float _393 = _225;
    float _395 = _355;
    float _397 = _247;
    float _399 = _227;
    float _401 = _273;
    float _403 = _275;
    if (_337)
    {
        _379 = _195;
    }
    float _405 = _379;
    float _407 = _405;
    float _409 = _405;
    if (_337)
    {
        _381 = _197;
    }
    float _411 = _381;
    float _413 = _411;
    float _415 = _411;
    if (_337)
    {
        _383 = _199;
    }
    float _417 = _383;
    float _419 = _417;
    float _421 = _417;
    if (!_337)
    {
        bool _423 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _425 = isnan(0.0);
        bool _427 = _423 || _425;
        bool _429 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _431 = _427 || _429;
        if (!_431)
        {
            float _433 = _195 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _407 = _433;
        }
        float _435 = _407;
        _409 = _435;
        if (!_431)
        {
            float _437 = _197 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _413 = _437;
        }
        float _439 = _413;
        _415 = _439;
        if (!_431)
        {
            float _441 = _199 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _419 = _441;
        }
        float _443 = _419;
        bool _445 = !_431;
        _421 = _443;
        if (!_445)
        {
            float _447 = _197 * 0.715200006961822509765625;
            float _449 = fma(_195, 0.2125999927520751953125, _447);
            float _451 = fma(_199, 0.072200000286102294921875, _449);
            float _453 = 1.0 / _451;
            float _455 = _453 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _457 = precise::clamp(_455, 0.0, 1.0);
            float _459 = fma(_457, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _461 = _195 * _459;
            float _463 = _197 * _459;
            float _465 = _199 * _459;
            _409 = _461;
            _415 = _463;
            _421 = _465;
            _385 = _451;
        }
    }
    float _467 = _409;
    float _469 = _415;
    float _471 = _421;
    float _473 = _385;
    float _475 = _473;
    float _477 = _471;
    if (_337)
    {
        _387 = _467;
    }
    float _479 = _387;
    float _481 = _479;
    if (_337)
    {
        _389 = _469;
    }
    float _483 = _389;
    float _485 = _483;
    if (_337)
    {
        _391 = _471;
    }
    float _487 = _391;
    float _489 = _487;
    if (!_337)
    {
        float _491 = _317 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _493 = _323 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float2 _1764 = float2(_493, _491);
        float3 _497 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1764, float2(0.0), isnan(_1764))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1764, float2(0.0), isnan(_1764))).xyz;
        float _499 = _497.x;
        float _501 = _497.y;
        float _503 = _497.z;
        float _505 = _499 + _467;
        float _507 = _501 + _469;
        float _509 = _503 + _471;
        _485 = _507;
        _489 = _509;
        _481 = _505;
        _475 = _493;
    }
    float _511 = _485;
    float _513 = _489;
    float _515 = _481;
    float _517 = _475;
    float _519 = _513;
    float _521 = _511;
    float _523 = _515;
    float _525 = _511;
    float _527 = _513;
    float _529 = _513;
    float _531 = _511;
    float _533 = _515;
    float _535 = _517;
    if (_337)
    {
        _519 = _511;
    }
    float _537 = _519;
    float _539 = _537;
    if (_337)
    {
        _521 = _513;
    }
    float _541 = _521;
    float _543 = _541;
    if (!_337)
    {
        bool _545 = _511 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _547 = isnan(_511);
        bool _549 = _545 || _547;
        bool _551 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _553 = _549 || _551;
        bool _555 = _513 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _557 = isnan(_513);
        bool _559 = _555 || _557;
        bool _561 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _563 = _559 || _561;
        float _565 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _515, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _567 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _511, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _569 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _513, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _571 = _515 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _573 = isnan(_515);
        bool _575 = _571 || _573;
        bool _577 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _579 = _575 || _577;
        float _581 = exp2(_565);
        float _583 = exp2(_567);
        float _585 = exp2(_569);
        if (_579)
        {
            float _587 = -_581;
            float _589 = _587 + 1.0;
            _523 = _589;
        }
        float _591 = _523;
        _533 = _591;
        if (_553)
        {
            float _593 = -_583;
            float _595 = _593 + 1.0;
            _525 = _595;
        }
        float _597 = _525;
        _531 = _597;
        _539 = _597;
        _477 = _585;
        if (_563)
        {
            float _599 = -_585;
            float _601 = _599 + 1.0;
            _527 = _601;
        }
        float _603 = _527;
        _529 = _603;
        _543 = _603;
    }
    float _605 = _529;
    float _607 = _531;
    float _609 = _533;
    float _611 = _539;
    float _613 = _543;
    float _615 = _477;
    float _617 = _605;
    float _619 = _607;
    float _621 = _615;
    float _623 = _609;
    float _625 = _611;
    float _627 = _613;
    if (_351)
    {
        _535 = _221;
    }
    float _629 = _535;
    float _631 = _629;
    float _633 = _629;
    if (_351)
    {
        _617 = _223;
    }
    float _635 = _617;
    float _637 = _635;
    float _639 = _635;
    if (_351)
    {
        _619 = _225;
    }
    float _641 = _619;
    float _643 = _641;
    float _645 = _641;
    if (!_351)
    {
        bool _647 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _649 = isnan(0.0);
        bool _651 = _647 || _649;
        bool _653 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _655 = _651 || _653;
        if (!_655)
        {
            float _657 = _221 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _631 = _657;
        }
        float _659 = _631;
        _633 = _659;
        if (!_655)
        {
            float _661 = _223 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _637 = _661;
        }
        float _663 = _637;
        _639 = _663;
        if (!_655)
        {
            float _665 = _225 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _643 = _665;
        }
        float _667 = _643;
        bool _669 = !_655;
        _645 = _667;
        if (!_669)
        {
            float _671 = _223 * 0.715200006961822509765625;
            float _673 = fma(_221, 0.2125999927520751953125, _671);
            float _675 = fma(_225, 0.072200000286102294921875, _673);
            float _677 = 1.0 / _675;
            float _679 = _677 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _681 = precise::clamp(_679, 0.0, 1.0);
            float _683 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _685 = _221 * _683;
            float _687 = _223 * _683;
            float _689 = _225 * _683;
            _633 = _685;
            _639 = _687;
            _645 = _689;
            _621 = _677;
        }
    }
    float _691 = _633;
    float _693 = _639;
    float _695 = _645;
    float _697 = _621;
    float _699 = _691;
    float _701 = _693;
    float _703 = _695;
    float _705 = _697;
    if (!_351)
    {
        float _707 = _323 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _709 = _321 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _2068 = float2(_707, _709);
        float3 _711 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2068, float2(0.0), isnan(_2068))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2068, float2(0.0), isnan(_2068))).xyz;
        float _713 = _711.x;
        float _715 = _711.y;
        float _717 = _711.z;
        float _719 = _713 + _691;
        float _721 = _715 + _693;
        float _723 = _717 + _695;
        _699 = _719;
        _701 = _721;
        _703 = _723;
        _393 = _717;
    }
    float _725 = _699;
    float _727 = _701;
    float _729 = _703;
    float _731 = _393;
    float _733 = _731;
    float _735 = _727;
    float _737 = _729;
    float _739 = _729;
    if (!_337)
    {
        float _741 = _609 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _623 = _741;
    }
    float _743 = _623;
    if (!_337)
    {
        float _745 = _611 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _625 = _745;
    }
    float _747 = _625;
    float _749 = _747;
    if (!_337)
    {
        float _751 = _613 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _627 = _751;
    }
    float _753 = _627;
    float _755 = _201 * _355;
    float _757 = _355 * _743;
    float _759 = _355 * _747;
    float _761 = _355 * _753;
    float _763 = _725;
    float _765 = _725;
    float _767 = _755;
    if (_351)
    {
        _733 = _727;
    }
    float _769 = _733;
    float _771 = _769;
    if (_351)
    {
        _749 = _729;
    }
    float _773 = _749;
    float _775 = _773;
    if (!_351)
    {
        bool _777 = _727 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _779 = isnan(_727);
        bool _781 = _777 || _779;
        bool _783 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _785 = _781 || _783;
        bool _787 = _729 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _789 = isnan(_729);
        bool _791 = _787 || _789;
        bool _793 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _795 = _791 || _793;
        float _797 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _725, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _799 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _727, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _801 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _729, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _803 = _725 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _805 = isnan(_725);
        bool _807 = _803 || _805;
        bool _809 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _811 = _807 || _809;
        float _813 = exp2(_797);
        float _815 = exp2(_799);
        float _817 = exp2(_801);
        if (_811)
        {
            float _819 = -_813;
            float _821 = _819 + 1.0;
            _763 = _821;
        }
        float _823 = _763;
        _765 = _823;
        if (_785)
        {
            float _825 = -_815;
            float _827 = _825 + 1.0;
            _735 = _827;
        }
        float _829 = _735;
        _771 = _829;
        if (_795)
        {
            float _831 = -_817;
            float _833 = _831 + 1.0;
            _737 = _833;
        }
        float _835 = _737;
        _739 = _835;
        _775 = _835;
    }
    float _837 = _739;
    float _839 = _765;
    float _841 = _771;
    float _843 = _775;
    float _845 = _837;
    float _847 = _839;
    float _849 = _841;
    float _851 = _843;
    if (_365)
    {
        _845 = _247;
    }
    float _853 = _845;
    float _855 = _853;
    float _857 = _853;
    if (_365)
    {
        _395 = _249;
    }
    float _859 = _395;
    float _861 = _859;
    float _863 = _859;
    if (_365)
    {
        _705 = _251;
    }
    float _865 = _705;
    float _867 = _865;
    float _869 = _865;
    if (!_365)
    {
        bool _871 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _873 = isnan(0.0);
        bool _875 = _871 || _873;
        bool _877 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _879 = _875 || _877;
        if (!_879)
        {
            float _881 = _247 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _855 = _881;
        }
        float _883 = _855;
        _857 = _883;
        if (!_879)
        {
            float _885 = _249 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _861 = _885;
        }
        float _887 = _861;
        _863 = _887;
        if (!_879)
        {
            float _889 = _251 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _867 = _889;
        }
        float _891 = _867;
        bool _893 = !_879;
        _869 = _891;
        if (!_893)
        {
            float _895 = _249 * 0.715200006961822509765625;
            float _897 = fma(_247, 0.2125999927520751953125, _895);
            float _899 = fma(_251, 0.072200000286102294921875, _897);
            float _901 = 1.0 / _899;
            float _903 = _901 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _905 = precise::clamp(_903, 0.0, 1.0);
            float _907 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _909 = _247 * _907;
            float _911 = _249 * _907;
            float _913 = _251 * _907;
            _857 = _909;
            _863 = _911;
            _869 = _913;
        }
    }
    float _915 = _857;
    float _917 = _863;
    float _919 = _869;
    float _921 = _919;
    float _923 = _915;
    float _925 = _917;
    if (!_365)
    {
        float _927 = _321 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _929 = _325 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float2 _2402 = float2(_929, _927);
        float3 _931 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2402, float2(0.0), isnan(_2402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2402, float2(0.0), isnan(_2402))).xyz;
        float _933 = _931.x;
        float _935 = _931.y;
        float _937 = _931.z;
        float _939 = _933 + _915;
        float _941 = _935 + _917;
        float _943 = _937 + _919;
        _921 = _943;
        _923 = _939;
        _925 = _941;
        _397 = _933;
    }
    float _945 = _921;
    float _947 = _923;
    float _949 = _925;
    float _951 = _397;
    float _953 = _951;
    float _955 = _947;
    float _957 = _949;
    float _959 = _945;
    float _961 = _839;
    if (_365)
    {
        _953 = _947;
    }
    float _963 = _953;
    float _965 = _963;
    if (_365)
    {
        _847 = _949;
    }
    float _967 = _847;
    float _969 = _967;
    if (!_365)
    {
        bool _971 = _947 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _973 = isnan(_947);
        bool _975 = _971 || _973;
        bool _977 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _979 = _975 || _977;
        bool _981 = _949 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _983 = isnan(_949);
        bool _985 = _981 || _983;
        bool _987 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _989 = _985 || _987;
        float _991 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _947, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _993 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _949, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _995 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _945, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _997 = _945 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _999 = isnan(_945);
        bool _1001 = _997 || _999;
        bool _1003 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1005 = _1001 || _1003;
        float _1007 = exp2(_991);
        float _1009 = exp2(_993);
        float _1011 = exp2(_995);
        if (_979)
        {
            float _1013 = -_1007;
            float _1015 = _1013 + 1.0;
            _955 = _1015;
        }
        float _1017 = _955;
        _965 = _1017;
        if (_989)
        {
            float _1019 = -_1009;
            float _1021 = _1019 + 1.0;
            _957 = _1021;
        }
        float _1023 = _957;
        _969 = _1023;
        if (_1005)
        {
            float _1025 = -_1011;
            float _1027 = _1025 + 1.0;
            _959 = _1027;
        }
    }
    float _1029 = _965;
    float _1031 = _959;
    float _1033 = _969;
    float _1035 = _1029;
    float _1037 = _1033;
    if (!_351)
    {
        float _1039 = _839 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _961 = _1039;
    }
    float _1041 = _961;
    if (!_351)
    {
        float _1043 = _841 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _849 = _1043;
    }
    float _1045 = _849;
    float _1047 = fma(_227, _353, _755);
    float _1049 = _1045;
    if (!_351)
    {
        float _1051 = _843 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _851 = _1051;
    }
    float _1053 = _851;
    float _1055 = fma(_353, _1041, _757);
    if (!_365)
    {
        float _1057 = _1029 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1035 = _1057;
    }
    float _1059 = _1035;
    float _1061 = fma(_353, _1045, _759);
    float _1063 = fma(_353, _1053, _761);
    float _1065 = fma(_253, _319, _1047);
    float _1067 = fma(_319, _1059, _1055);
    if (_377)
    {
        _399 = _273;
    }
    float _1069 = _399;
    float _1071 = _1069;
    float _1073 = _1069;
    if (_377)
    {
        _767 = _275;
    }
    float _1075 = _767;
    float _1077 = _1075;
    float _1079 = _1075;
    if (_377)
    {
        _1049 = _277;
    }
    float _1081 = _1049;
    float _1083 = _1081;
    float _1085 = _1081;
    if (!_377)
    {
        bool _1087 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1089 = isnan(0.0);
        bool _1091 = _1087 || _1089;
        bool _1093 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1095 = _1091 || _1093;
        if (!_1095)
        {
            float _1097 = _273 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1071 = _1097;
        }
        float _1099 = _1071;
        _1073 = _1099;
        if (!_1095)
        {
            float _1101 = _275 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1077 = _1101;
        }
        float _1103 = _1077;
        _1079 = _1103;
        if (!_1095)
        {
            float _1105 = _277 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1083 = _1105;
        }
        float _1107 = _1083;
        bool _1109 = !_1095;
        _1085 = _1107;
        if (!_1109)
        {
            float _1111 = _275 * 0.715200006961822509765625;
            float _1113 = fma(_273, 0.2125999927520751953125, _1111);
            float _1115 = fma(_277, 0.072200000286102294921875, _1113);
            float _1117 = 1.0 / _1115;
            float _1119 = _1117 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1121 = precise::clamp(_1119, 0.0, 1.0);
            float _1123 = fma(_1121, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1125 = _273 * _1123;
            float _1127 = _275 * _1123;
            float _1129 = _277 * _1123;
            _1073 = _1125;
            _1079 = _1127;
            _1085 = _1129;
        }
    }
    float _1131 = _1073;
    float _1133 = _1079;
    float _1135 = _1085;
    float _1137 = _1133;
    float _1139 = _1131;
    float _1141 = _1135;
    if (!_377)
    {
        float _1143 = _325 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1145 = _317 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _2750 = float2(_1143, _1145);
        float3 _1147 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2750, float2(0.0), isnan(_2750))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2750, float2(0.0), isnan(_2750))).xyz;
        float _1149 = _1147.x;
        float _1151 = _1147.y;
        float _1153 = _1147.z;
        float _1155 = _1149 + _1131;
        float _1157 = _1151 + _1133;
        float _1159 = _1153 + _1135;
        _1137 = _1157;
        _1139 = _1155;
        _1141 = _1159;
        _401 = _1149;
        _403 = _1151;
    }
    float _1161 = _1137;
    float _1163 = _1139;
    float _1165 = _1141;
    float _1167 = _401;
    float _1169 = _403;
    float _1171 = _1167;
    float _1173 = _1169;
    float _1175 = _1163;
    float _1177 = _1165;
    float _1179 = _1161;
    float _1181 = _1161;
    float _1183 = _1031;
    if (_377)
    {
        _1171 = _1163;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (_377)
    {
        _1173 = _1165;
    }
    float _1189 = _1173;
    float _1191 = _1189;
    if (!_377)
    {
        bool _1193 = _1163 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1195 = isnan(_1163);
        bool _1197 = _1193 || _1195;
        bool _1199 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1201 = _1197 || _1199;
        bool _1203 = _1165 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1205 = isnan(_1165);
        bool _1207 = _1203 || _1205;
        bool _1209 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1211 = _1207 || _1209;
        float _1213 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1163, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1215 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1165, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1217 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1161, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1219 = _1161 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1221 = isnan(_1161);
        bool _1223 = _1219 || _1221;
        bool _1225 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1227 = _1223 || _1225;
        float _1229 = exp2(_1213);
        float _1231 = exp2(_1215);
        float _1233 = exp2(_1217);
        if (_1201)
        {
            float _1235 = -_1229;
            float _1237 = _1235 + 1.0;
            _1175 = _1237;
        }
        float _1239 = _1175;
        if (_1211)
        {
            float _1241 = -_1231;
            float _1243 = _1241 + 1.0;
            _1177 = _1243;
        }
        float _1245 = _1177;
        _1191 = _1245;
        if (_1227)
        {
            float _1247 = -_1233;
            float _1249 = _1247 + 1.0;
            _1179 = _1249;
        }
        float _1251 = _1179;
        _1187 = _1239;
        _1181 = _1251;
    }
    float _1253 = _1187;
    float _1255 = _1181;
    float _1257 = _1191;
    float _1259 = _1253;
    float _1261 = _1255;
    float _1263 = _1257;
    if (!_365)
    {
        float _1265 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1037 = _1265;
    }
    float _1267 = _1037;
    if (!_365)
    {
        float _1269 = _1031 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1183 = _1269;
    }
    float _1271 = _1183;
    if (!_377)
    {
        float _1273 = _1253 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1259 = _1273;
    }
    float _1275 = _1259;
    if (!_377)
    {
        float _1277 = _1255 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1261 = _1277;
    }
    float _1279 = _1261;
    float _1281 = fma(_319, _1267, _1061);
    float _1283 = fma(_319, _1271, _1063);
    if (!_377)
    {
        float _1285 = _1257 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1263 = _1285;
    }
    float _1287 = _1263;
    float _1289 = fma(_279, _367, _1065);
    float _1291 = fma(_367, _1275, _1067);
    float _1293 = fma(_367, _1279, _1281);
    float _1295 = fma(_367, _1287, _1283);
    out.m_36.x = _1291;
    out.m_36.y = _1293;
    out.m_36.z = _1295;
    out.m_36.w = _1289;
    return out;
}

