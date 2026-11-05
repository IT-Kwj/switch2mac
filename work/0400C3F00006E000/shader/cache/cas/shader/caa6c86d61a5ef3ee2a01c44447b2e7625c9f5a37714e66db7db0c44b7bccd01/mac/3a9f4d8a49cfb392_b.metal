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

// Implementation of the signed GLSL findMSB() function
template<typename T>
inline T spvFindSMSB(T x)
{
    T v = select(x, T(-1) - x, x < T(0));
    return select(clz(T(0)) - (clz(v) + T(1)), T(-1), v == T(0));
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
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _812 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _63 = _57 + _61;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _67 = _59 + _65;
    float2 _932 = float2(_57, _59);
    float3 _71 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_932, float2(0.0), isnan(_932)), int2(0), component::x).xzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _949 = float2(_63, _67);
    float2 _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_949, float2(0.0), isnan(_949)), int2(0), component::x).xz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = -_77;
    float _89 = _75 + _87;
    float _91 = -_77;
    float _93 = _73 + _91;
    float _95 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _97 = -_77;
    float _99 = _97 + _83;
    float _101 = -_77;
    float _103 = _101 + _85;
    float _105 = _95 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _107 = _89 * _99;
    float _109 = abs(_89);
    float _111 = abs(_99);
    float _113 = precise::min(_109, _111);
    float _115 = _105 * 0.0199999995529651641845703125;
    float _117 = abs(_93);
    float _119 = abs(_103);
    float _121 = precise::min(_117, _119);
    float _123 = _93 * _103;
    bool _127 = _107 > 0.0;
    float _129 = _113 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _131 = _121 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    bool _133 = _123 > 0.0;
    bool _135 = _129 > _115;
    bool _137 = _131 > _115;
    bool _139 = _107 > 0.0;
    bool _141 = _139 && _135;
    float _143 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    bool _145 = _123 > 0.0;
    bool _147 = _145 && _137;
    float _149 = -_59;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _153 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[6].w, _151);
    float _155 = _143 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _157 = _153 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _159 = _95 * _155;
    float _161 = _95 * _157;
    float _163 = 0.0;
    float _165 = _95;
    float _167 = _83;
    float _169 = _75;
    float _171 = _89;
    if (_141)
    {
        _163 = 1.0;
    }
    float _173 = _163;
    float _175 = 0.0;
    float _177 = _173;
    if (_141)
    {
        _175 = 0.0;
    }
    float _179 = _175;
    float _181 = 0.0;
    float _183 = _179;
    if (_141)
    {
        _181 = 0.0;
    }
    float _185 = _181;
    float _187 = _185;
    if (_147)
    {
        _165 = 0.0;
    }
    float _189 = _165;
    float _191 = 0.0;
    float _193 = _189;
    if (_141)
    {
        _191 = 1.0;
    }
    float _195 = _191;
    bool _197 = _135 && _127;
    float _199 = _195;
    if (!_197)
    {
        float _201 = abs(_89);
        float _203 = abs(_99);
        bool _205 = _201 >= _203;
        float _207 = _205 ? (-1.0) : 1.0;
        float _209 = _205 ? _83 : _75;
        float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[0].z, _57);
        float _213 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        float _215 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
        float _217 = -_161;
        float _219 = fma(_157, _213, _217);
        float _221 = -_213;
        float _223 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[7].w, _105);
        float _225 = _215 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
        float _227 = -_159;
        float _229 = fma(_213, _225, _227);
        _199 = _207;
        _177 = _229;
        _167 = _213;
        _187 = _223;
        _183 = _219;
        _169 = _209;
        _171 = _225;
    }
    float _231 = _199;
    float _233 = _177;
    float _235 = _167;
    float _237 = _187;
    float _239 = _183;
    float _241 = _169;
    float _243 = _171;
    float _245 = _243;
    float _247 = _241;
    float _249 = _235;
    float _251 = _231;
    if (_147)
    {
        _245 = 0.0;
    }
    float _253 = _245;
    float _255 = _253;
    if (_147)
    {
        _247 = 1.0;
    }
    float _257 = _247;
    float _259 = _257;
    if (_147)
    {
        _249 = _231;
    }
    float _261 = _249;
    bool _263 = _137 && _133;
    float _265 = _261;
    if (!_263)
    {
        float _267 = abs(_93);
        float _269 = abs(_103);
        bool _271 = _267 >= _269;
        float _273 = _271 ? (-1.0) : 1.0;
        float _275 = _271 ? _85 : _73;
        float _277 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[0].w, _59);
        float _279 = _273 * _231;
        float _281 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        float _283 = -_277;
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _287 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[6].w, _285);
        float _289 = -_159;
        float _291 = fma(_155, _281, _289);
        float _293 = _287 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _295 = -_161;
        float _297 = fma(_281, _293, _295);
        float _299 = -_281;
        float _301 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[7].w, _105);
        _265 = _279;
        _259 = _301;
        _255 = _297;
        _193 = _291;
    }
    float _303 = _265;
    float _305 = _259;
    float _307 = _255;
    float _309 = _193;
    float _311 = _233 * _303;
    float _313 = _237 * _303;
    float _315 = 1.0 / _105;
    float _317 = _239 * _303;
    float _319 = _311 * _305;
    float _321 = _313 * _307;
    float _323 = -_319;
    float _325 = fma(_313, _309, _323);
    float _327 = _317 * _309;
    float _329 = -_321;
    float _331 = fma(_317, _305, _329);
    float _333 = _325 * _325;
    float _335 = -_327;
    float _337 = fma(_311, _307, _335);
    float _339 = fma(_331, _331, _333);
    float _341 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _343 = fma(_337, _337, _339);
    float _345 = _341 * _315;
    float _347 = rsqrt(_343);
    float _349 = precise::min(_345, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    bool _351 = _349 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _353 = isnan(_349);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
    bool _359 = _355 || _357;
    float _361 = _331 * _347;
    float _363 = _325 * _347;
    float _365 = _337 * _347;
    float _367 = _337;
    if (!_359)
    {
        _367 = 0.0;
    }
    float _369 = _367;
    bool _371 = !_359;
    float _373 = _369;
    if (!_371)
    {
        float _375 = gl_FragCoord.x;
        float _377 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _379 = _375 / _377;
        float _381 = gl_FragCoord.y;
        float _383 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _385 = _381 / _383;
        float _387 = _363 * _363;
        float _389 = _161 * _161;
        bool _391 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
        float _393 = fma(_361, _361, _387);
        float _395 = fma(_159, _159, _389);
        bool _397 = _393 >= 0.00999999977648258209228515625;
        bool _399 = isnan(_393);
        bool _401 = _397 || _399;
        bool _403 = isnan(0.00999999977648258209228515625);
        bool _405 = _401 || _403;
        float _407 = fma(_105, _105, _395);
        float _409 = -_363;
        float _411 = _161 * _409;
        float _413 = -_361;
        float _415 = fma(_159, _413, _411);
        float _417 = 1.0 / _407;
        float _419 = fma(_105, _365, _415);
        float _421 = _415;
        if (!_405)
        {
            _421 = 1.0;
        }
        float _423 = _421;
        float _425 = _419 * _419;
        float _427 = _393;
        float _429 = _423;
        if (_405)
        {
            float _431 = rsqrt(_393);
            _427 = _431;
        }
        float _433 = _427;
        if (!_405)
        {
            _251 = 0.0;
        }
        float _435 = _251;
        float _437 = trunc(_379);
        int _440 = int(_437);
        float _442 = _425 * _417;
        float _444 = trunc(_385);
        int _446 = int(_444);
        float _448 = _435;
        if (_405)
        {
            float _450 = -_433;
            float _452 = _361 * _450;
            _429 = _452;
        }
        float _454 = _429;
        if (_405)
        {
            float _456 = _363 * _433;
            _448 = _456;
        }
        float _458 = _448;
        bool _460 = !_391;
        float _810;
        if (!_460)
        {
            int _462 = _440 * 10;
            int _464 = _440 ^ _446;
            float _466 = _349 * 1.77777779102325439453125;
            int _468 = _446 * _462;
            int _470 = _464 * 30;
            int _472 = _470 + _468;
            float _474 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _476 = float(_472);
            int _478 = 0;
            float _480 = 0.0;
            float _482 = 0.0;
            bool _484;
            float _808;
            do
            {
                int _486 = _478;
                float _488 = _480;
                float _490 = _482;
                float _492 = float(_486);
                float _494 = _492 + 0.5;
                float _496 = _494 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                float _498 = _496 * 2.0;
                float _500 = fma(_498, (*spvDescriptorSet0.fp_c3)._m0[10].y, _476);
                float _502 = _498 * _498;
                float _504 = _500 * 0.15915493667125701904296875;
                float _506 = _349 * _502;
                float _508 = _504 * 6.283185482025146484375;
                float _510 = sin(_508);
                float _512 = _506 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                float _514 = _512 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _516 = _504 * 6.283185482025146484375;
                float _518 = cos(_516);
                bool _520 = _510 > 0.0;
                float _522 = trunc(_514);
                int _524 = int(_522);
                float _526 = -_510;
                float _528 = _520 ? _526 : _510;
                float _530 = -_518;
                float _532 = _520 ? _530 : _518;
                float _534 = _528 * _458;
                float _536 = -_454;
                float _538 = _528 * _536;
                float _540 = -_454;
                float _542 = -_534;
                float _544 = fma(_532, _540, _542);
                float _546 = fma(_532, _458, _538);
                float _548 = _544 * _502;
                float _550 = _546 * _502;
                int _552 = int(uint(spvFindSMSB(_524)));
                float _554 = _548 * _454;
                float _556 = -_458;
                float _558 = _548 * _556;
                float _560 = -_550;
                float _562 = fma(_560, _458, _554);
                float _564 = -_550;
                float _566 = fma(_564, _454, _558);
                float _568 = _562 * _562;
                float _570 = _566 * _566;
                float _572 = fma(_442, _568, _570);
                bool _574 = _572 > _442;
                int _576 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[18].w);
                int _578 = _552 + _576;
                int _580 = _578 + 1;
                int _582 = max(0, _580);
                int _584 = min(_582, 4);
                float _586 = _570;
                float _588 = _514;
                float _590 = as_type<float>(_580);
                float _592 = _488;
                if (_574)
                {
                    float _594 = _566 * _458;
                    _586 = _594;
                }
                float _596 = _586;
                if (_574)
                {
                    float _598 = _566 * _454;
                    _588 = _598;
                }
                float _600 = _588;
                if (!_574)
                {
                    float _602 = -_548;
                    float _604 = (-0.0) + _602;
                    _590 = _604;
                }
                float _606 = _590;
                float _608 = _606;
                if (!_574)
                {
                    float _610 = -_550;
                    float _612 = (-0.0) + _610;
                    _592 = _612;
                }
                float _614 = _592;
                float _616 = _614;
                if (_574)
                {
                    float _618 = -_454;
                    float _620 = -_596;
                    float _622 = fma(_562, _618, _620);
                    _608 = _622;
                }
                float _624 = _608;
                float _626 = fma(_548, _466, _59);
                if (_574)
                {
                    float _628 = -_600;
                    float _630 = fma(_562, _458, _628);
                    _616 = _630;
                }
                float _632 = _616;
                float _634 = fma(_349, _550, _57);
                float _636 = fma(_466, _624, _59);
                float _638 = _626 * (*spvDescriptorSet0.fp_c3)._m0[16].w;
                float _640 = float(_584);
                float _642 = _634 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float _644 = fma(_349, _632, _57);
                float _646 = _636 * (*spvDescriptorSet0.fp_c3)._m0[16].w;
                float2 _1766 = float2(_642, _638);
                float _648 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1766, float2(0.0), isnan(_1766)), level(_640)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1766, float2(0.0), isnan(_1766)), level(_640)).x;
                float _650 = _644 * (*spvDescriptorSet0.fp_c3)._m0[16].z;
                float2 _1779 = float2(_650, _646);
                float _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1779, float2(0.0), isnan(_1779)), level(_640)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1779, float2(0.0), isnan(_1779)), level(_640)).x;
                float _654 = -_626;
                float _656 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _658 = fma(_654, (*spvDescriptorSet0.fp_c3)._m0[6].w, _656);
                float _660 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _662 = -_636;
                float _664 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _666 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[6].w, _664);
                float _668 = fma(_644, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _670 = _658 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
                float _672 = _660 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
                float _674 = _666 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
                float _676 = _668 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
                int _678 = _486 + 1;
                bool _680 = _678 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                float _682 = fma(_648, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
                float _684 = -_161;
                float _686 = fma(_682, _670, _684);
                float _688 = fma(_652, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
                float _690 = -_159;
                float _692 = fma(_682, _672, _690);
                float _694 = -_682;
                float _696 = fma(_694, (*spvDescriptorSet0.fp_c3)._m0[7].w, _105);
                float _698 = _686 * _686;
                float _700 = -_161;
                float _702 = fma(_688, _674, _700);
                float _704 = -_159;
                float _706 = fma(_688, _676, _704);
                float _708 = -_688;
                float _710 = fma(_708, (*spvDescriptorSet0.fp_c3)._m0[7].w, _105);
                float _712 = fma(_692, _692, _698);
                float _714 = _702 * _702;
                float _716 = -_686;
                float _718 = _363 * _716;
                float _720 = -_702;
                float _722 = _363 * _720;
                float _724 = fma(_696, _696, _712);
                float _726 = fma(_706, _706, _714);
                float _728 = -_361;
                float _730 = fma(_728, _692, _718);
                float _732 = -_724;
                float _734 = fma(_732, _474, 1.0);
                float _736 = fma(_710, _710, _726);
                float _738 = _724 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _740 = -_361;
                float _742 = fma(_740, _706, _722);
                float _744 = -_365;
                float _746 = fma(_744, _696, _730);
                float _748 = -_736;
                float _750 = fma(_748, _474, 1.0);
                float _752 = precise::max(0.0, _734);
                float _754 = _736 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _756 = -_365;
                float _758 = fma(_756, _710, _742);
                float _760 = 1.0 / _738;
                float _762 = precise::max(0.0, _750);
                float _764 = _752 * _752;
                float _766 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _768 = _746 + _766;
                float _770 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _772 = _758 + _770;
                float _774 = _762 * _762;
                float _776 = _752 * _764;
                float _778 = 1.0 / _754;
                float _780 = precise::max(_768, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _782 = _762 * _774;
                float _784 = precise::max(_772, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _786 = _776 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _788 = _782 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _790 = _786 * _780;
                float _792 = _788 * _784;
                float _794 = _790 * _760;
                float _796 = _792 * _778;
                float _798 = precise::max(_794, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _800 = precise::max(_796, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _802 = precise::min(_798, 1.0);
                float _804 = precise::min(_800, 1.0);
                float _806 = _802 + _804;
                _808 = fma(_806, (*spvDescriptorSet0.fp_c3)._m0[9].y, _490);
                _484 = !_680;
                _478 = _678;
                _480 = _792;
                _482 = _808;
            } while (_484);
            _810 = _808;
            _812 = true;
        }
        else
        {
            _810 = 0.0;
        }
        _812 = false;
        float _814 = _810;
        float _816 = _814 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
        float _818 = fma(_57, 2.0, -1.0);
        float _820 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].z;
        float _822 = fma(_59, 2.0, -1.0);
        float _824 = fma(_349, (*spvDescriptorSet0.fp_c3)._m0[0].x, -1.0);
        float _826 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].x;
        float _828 = abs(_818);
        float _830 = _828 + _820;
        float _832 = precise::clamp(_830, 0.0, 1.0);
        float _834 = precise::min(_824, 1.0);
        float _836 = abs(_822);
        float _838 = _836 + _826;
        float _840 = precise::clamp(_838, 0.0, 1.0);
        float _842 = _832 * (*spvDescriptorSet0.fp_c3)._m0[17].w;
        float _844 = _834 * _816;
        float _846 = precise::clamp(_844, 0.0, 1.0);
        float _848 = _840 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _850 = -_846;
        float _852 = _850 + 1.0;
        float _854 = abs(_852);
        float _856 = log2(_854);
        float _858 = _856 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
        float _860 = -_842;
        float _862 = fma(_860, _842, 1.0);
        float _864 = -_848;
        float _866 = fma(_864, _848, _862);
        float _868 = exp2(_858);
        float _870 = -_868;
        float _872 = _870 + 1.0;
        float _874 = _872 * _866;
        float _876 = precise::clamp(_874, 0.0, 1.0);
        float _878 = _876 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        _373 = _878;
    }
    float _880 = _373;
    float _882 = -_880;
    float _884 = _882 + 1.0;
    out.m_34.x = _884;
    out.m_34.y = _77;
    return out;
}

